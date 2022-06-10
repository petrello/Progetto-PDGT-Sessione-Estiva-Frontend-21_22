part of 'asset_provider.dart';

class AssetNotifier extends StateNotifier<AssetState> {
  AssetNotifier({ required IAssetRepository assetRepository}) :
      _assetRepository = assetRepository, super(const AssetsState.initial());

  final IAssetRepository _assetRepository;
  Future<void> getAssetById() async {
    state = const AssetState.loading();

    try {
      final asset = await _assetRepository.getAssetById();
      state = AssetState.data(asset: asset);
    } catch(err) {
      state = AssetState.error(err.message);
    }
  }
}