import 'package:crypto_coin_list/repositories/crypto_coins/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {

  CryptoCoinsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AVAX&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;

    // debugPrint('Response = ${response.toString()}');
    // debugPrint('Data = ${response.data.toString()}');
    // debugPrint('dataRaw = ${dataRaw.toString()}');

    final cryptoCoinsList = dataRaw.entries
        .map((e) => (CryptoCoin(
      name: e.key,
      priceInUSD: (e.value['USD'] as Map<String, dynamic>)['PRICE'],
      imageUrl: 'https://www.cryptocompare.com${(e.value['USD'] as Map<String, dynamic>)['IMAGEURL']}',
    )))
        .toList();
    // debugPrint(cryptoCoinsList.toString());
    return cryptoCoinsList;
  }
}
