import 'package:api_request/api_request.dart';
import 'package:requests_inspector/requests_inspector.dart';

import 'package:chat_bot/app/utils/notification_util.dart';
import 'package:chat_bot/config/app_config.dart';
import 'package:chat_bot/core/app_storage.dart';
import 'package:flutter/widgets.dart';

class ApiUtils {
  ApiUtils.init(BuildContext context) {
    ApiRequestOptions.instance?.config(
      baseUrl: 'https://generativelanguage.googleapis.com/',
      getToken: () => getIt.get<AppStorage>().getToken(),
      interceptors: [RequestsInspectorInterceptor()],
      tokenType: ApiRequestOptions.bearer,
      logLevel: ApiLogLevel.debug,
      onError: (error) {
        NotificationUtil.showError(error.message);
      },
      unauthenticated: () {
        //Force logout user form app
        getIt.get<AppStorage>().setToken(null);
      },
      defaultHeaders: {'Content-Language': 'en'},
    );
  }

  static void setLanguage(String languageCode) {
    ApiRequestOptions.instance?.config(
      defaultHeaders: {'Content-Language': languageCode},
    );
    ApiRequestOptions.refreshConfig();
    getIt.get<AppStorage>().setLocale(languageCode);
  }
}
