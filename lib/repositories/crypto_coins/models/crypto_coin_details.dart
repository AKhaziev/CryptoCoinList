import 'package:equatable/equatable.dart';

class CryptoCoinDetails extends Equatable {
  const CryptoCoinDetails(
      {required this.toSymbol,
      required this.lastUpdate,
      required this.high24Hour,
      required this.low24Hour,
      required this.priceInUSD,
      required this.imageUrl});

  final String toSymbol;
  final int lastUpdate;
  final double high24Hour;
  final double low24Hour;
  final double priceInUSD;
  final String imageUrl;

  @override
  String toString() {
    return 'CryptoCoinDetails{'
        'toSymbol: $toSymbol, '
        'lastUpdate: $lastUpdate, '
        'high24Hour: $high24Hour, '
        'low24Hour: $low24Hour, '
        'priceInUSD: $priceInUSD, '
        'imageUrl: $imageUrl}';
  }

  @override
  List<Object> get props => [
        toSymbol,
        lastUpdate,
        high24Hour,
        low24Hour,
        priceInUSD,
        imageUrl,
      ];
}
