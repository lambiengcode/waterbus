// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:universal_io/io.dart';
import 'package:waterbus_sdk/flutter_waterbus_sdk.dart';
import 'package:waterbus_sdk/utils/path_helper.dart';

// Project imports:
import 'package:waterbus/core/constants/api_endpoints.dart';
import 'package:waterbus/core/injection/injection_container.dart';
import 'package:waterbus/core/utils/datasources/base_local_data.dart';
import 'package:waterbus/features/app/bloc/bloc.dart';
import 'package:waterbus/features/auth/presentation/bloc/auth_bloc.dart';

class Application {
  /// [Production - Dev]
  static Future<void> initialAppLication() async {
    try {
      // Config local storage
      await BaseLocalData.initialBox();

      // Init dependency injection
      final Directory? appDir = await PathHelper.appDir;

      await WaterbusSdk.instance.initial(
        waterbusUrl: ApiEndpoints.wsUrl,
        recordBenchmarkPath:
            appDir == null ? '' : '${appDir.path}/benchmark.txt',
        apiWaterbusUrl: ApiEndpoints.baseUrl,
      );

      configureDependencies();

      AppBloc.authBloc.add(OnAuthCheckEvent());
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  ///Singleton factory
  static final Application _instance = Application._internal();

  factory Application() {
    return _instance;
  }

  Application._internal();
}
