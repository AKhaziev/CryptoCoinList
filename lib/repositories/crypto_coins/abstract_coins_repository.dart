import 'package:crypto_coin_list/repositories/crypto_coins/crypto_coin.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
}