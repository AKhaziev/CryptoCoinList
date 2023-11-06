import 'package:crypto_coin_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_coin_event.dart';
part 'crypto_coin_state.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  CryptoCoinBloc(this.coinsRepository) : super(CryptoCoinInitial()) {

    on<LoadCryptoCoin>((event, emit) {
      print('Crypto coin loading ');
    });
  }

  final AbstractCoinsRepository coinsRepository;
}