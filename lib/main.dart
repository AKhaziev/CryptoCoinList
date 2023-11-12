import 'dart:async';

import 'package:crypto_coin_list/repositories/crypto_coins/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_currencies_list_app.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');

  final app =  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // talker.info(app.options.name);

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
        // printRequestHeaders: true,
        // printResponseHeaders: true,
        // printResponseMessage: true,
      ),
    ),
  );

  GetIt.I.registerSingleton<AbstractCoinsRepository>(
      CryptoCoinsRepository(dio: dio)
  );

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printEventFullData: false,
      printStateFullData: false
    )
  );

  FlutterError.onError = (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  // runApp(const CryptoCurrenciesListApp());
  runZonedGuarded(() => runApp(const CryptoCurrenciesListApp()),
          (error, stack) => GetIt.I<Talker>().handle(error, stack)
  );
}
