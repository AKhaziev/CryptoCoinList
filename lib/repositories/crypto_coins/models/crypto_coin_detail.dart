import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_detail.g.dart';

@JsonSerializable()
class CryptoCoinDetail extends Equatable {
  const CryptoCoinDetail(
      {required this.toSymbol,
      required this.lastUpdate,
      required this.high24Hour,
      required this.low24Hour,
      required this.priceInUSD,
      required this.imageUrl});

  @JsonKey(name: "TOSYMBOL")
  final String toSymbol;

  @JsonKey(name: "LASTUPDATE")
  final int lastUpdate;

  @JsonKey(name: "HIGH24HOUR")
  final double high24Hour;

  @JsonKey(name: "LOW24HOUR")
  final double low24Hour;

  @JsonKey(name: "PRICE")
  final double priceInUSD;

  @JsonKey(name: "IMAGEURL")
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

  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) => _$CryptoCoinDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

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
