import 'package:chat_bot/app/models/gemine_model/gemine_model.dart';
import 'package:chat_bot/app/utils/notification_util.dart';
import 'package:chat_bot/config/app_config.dart';
import 'package:chat_bot/features/home/actions/get_message_action.dart';
import 'package:chat_bot/features/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(const HomeState());

  static HomeBloc to = getIt.get();

  Future<void> getReponseMessage({required String message}) async {
    // 1. Immediately add the USER message to the list so it shows up in UI
    final userMessage = ChatMessage(text: message, isUser: true);
    final updatedMessagesWithUser = List<ChatMessage>.from(state.messages!)
      ..add(userMessage);

    emit(state.copyWith(isChatting: true, messages: updatedMessagesWithUser));

    GetMessageAction()
        .listen(
          onStart: () => NotificationUtil.showLoading(),
          onDone: () => NotificationUtil.hideLoading(),

          onSuccess: (response) {
            final model = GemineModel.fromJson(response!);
            final aiText =
                model.candidates?.first.content?.parts?.first.text ?? '';

            // 2. Add the AI response to the list
            final aiMessage = ChatMessage(text: aiText, isUser: false);
            final finalMessages = List<ChatMessage>.from(state.messages!)
              ..add(aiMessage);

            emit(state.copyWith(geminiModel: model, messages: finalMessages));
          },

          onError: (error) => NotificationUtil.showError(error.message),
        )
        .withHeader('x-goog-api-key', 'AIzaSyBNDvl1bmdIuO9Cmdj_CPt6Cnt7nLGbAt8')
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
