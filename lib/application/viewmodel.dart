import 'package:client_crypto/application/api.dart';
import 'package:client_crypto/application/dio_provider.dart';
import 'package:client_crypto/application/asset_repository.dart';
import 'package:client_crypto/data/asset_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/**
 * will hold all that logic
 */

final viewModelProvider = 
  StateNotifierProvider<ViewModel, AsyncValue<AssetDTO>>(
          (ref) => ViewModel(Repository(Api(ref.watch(dioProvider))))
  )
;

class ViewModel extends StateNotifier<AsyncValue<AssetDTO>> {
  ViewModel(this._repository) : super(const AsyncLoading());
  
  final IRepository _repository;
  
  Future<void> retreiveAsset() async {
    state = const AsyncLoading();
    final AssetDTO asset = await _repository.retreiveAsset();
    state = AsyncValue.data(asset);
  }
}