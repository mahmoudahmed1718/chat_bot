import 'package:chat_bot/app/models/gemine_model/gemine_model.dart';
import 'package:chat_bot/app/utils/notification_util.dart';
import 'package:chat_bot/config/app_config.dart';
import 'package:chat_bot/features/home/actions/get_message_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(const HomeState());

  static HomeBloc to = getIt.get();

  Future<void> getReponseMessage({required String message}) async {
    emit(state.copyWith(isChatting: true));
    GetMessageAction()
        .listen(
          onStart: () => NotificationUtil.showLoading(),
          onDone: () => NotificationUtil.hideLoading(),

          onSuccess: (response) {
            emit(state.copyWith(geminiModel: GemineModel.fromJson(response!)));
          },

          onError: (error) => NotificationUtil.showError(error.message),
        )
        .withHeader('x-goog-api-key', 'AIzaSyAY_T-JtdQZth46idM6-s82_cDLto9Mhgg')
        .withHeader('contentType', 'application/json')
        .whereMap({
          "contents": [
            {
              "parts": [
                {"text": message},
              ],
            },
          ],
        })
        .execute();
  }
}
