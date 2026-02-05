import 'package:chat_bot/app/data/gemine_model.dart';
import 'package:chat_bot/app/utils/notification_util.dart';
import 'package:chat_bot/config/app_config.dart';
import 'package:chat_bot/features/home/actions/get_message_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(const HomeState());

  static HomeBloc to = getIt.get();

  Future<void> getMessage({required String message}) async {
    GetMessageAction()
        .listen(
          onStart: () => NotificationUtil.showLoading(),
          onDone: () => NotificationUtil.hideLoading(),

          onSuccess: (response) {
            emit(state.copyWith(geminiModel: GeminiModel.fromJson(response!)));
          },

          onError: (error) => NotificationUtil.showError(error.message),
        )
        .withHeader('x-goog-api-key', 'AIzaSyBWzvb5ABC605vpA1kjOsWHgEsQjm8poOU')
        .withHeader('contentType', 'application/json')
        .whereMap({
          "contents": [
            {
              "parts": [
                {"text": message},
              ],
            },
          ],
        });
  }
}
