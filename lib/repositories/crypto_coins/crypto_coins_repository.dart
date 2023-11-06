import 'package:crypto_coin_list/repositories/crypto_coins/crypto_coin.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository  {
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

    final cryptoCoinsList = dataRaw.entries.map((e) {
      // final currencyCode = (e.value['USD'] as Map<String, dynamic>)['FROMSYMBOL'];
      final details = CryptoCoinDetails(
          toSymbol: (e.value['USD'] as Map<String, dynamic>)['TOSYMBOL'],
          lastUpdate: (e.value['USD'] as Map<String, dynamic>)['LASTUPDATE'],
          high24Hour: (e.value['USD'] as Map<String, dynamic>)['HIGH24HOUR'],
          low24Hour: (e.value['USD'] as Map<String, dynamic>)['LOW24HOUR'],
          priceInUSD: (e.value['USD'] as Map<String, dynamic>)['PRICE'],
          imageUrl:
              'https://www.cryptocompare.com${(e.value['USD'] as Map<String, dynamic>)['IMAGEURL']}');
      return CryptoCoin(name: e.key, details: details);
    }).toList();
    // debugPrint(cryptoCoinsList.toString());
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoinDetails> getCoinDetails(String currencyCode) async {

    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetails(
        toSymbol: (usdData)['TOSYMBOL'],
        lastUpdate: (usdData)['LASTUPDATE'],
        high24Hour: (usdData)['HIGH24HOUR'],
        low24Hour: (usdData)['LOW24HOUR'],
        priceInUSD: (usdData)['PRICE'],
        imageUrl: 'https://www.cryptocompare.com${(usdData)['IMAGEURL']}'
    );
    return details;
  }

  // Future<CryptoCoinDetails> _fetchCoinDetail(String currencyCode) async {
  //
  // }

}


