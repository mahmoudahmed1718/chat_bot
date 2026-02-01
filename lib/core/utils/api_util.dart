import 'package:api_request/api_request.dart';
import 'package:requests_inspector/requests_inspector.dart';

import 'package:chat_bot/app/utils/notification_util.dart';
import 'package:chat_bot/config/app_config.dart';
import 'package:chat_bot/core/app_storage.dart';
import 'package:chat_bot/core/extensions/context_extension.dart';
import 'package:flutter/widgets.dart';

class ApiUtils {
  ApiUtils.init(BuildContext context) {
    ApiRequestOptions.instance?.config(
      baseUrl: 'BASE_URL_HERE',
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
      defaultHeaders: {'Content-Language': context.locale.languageCode},
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
