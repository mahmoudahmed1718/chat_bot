import 'package:app_forms/app_forms.dart';
import 'package:chat_bot/features/home/widgets/build__chat_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late stt.SpeechToText _speech;
  bool isListening = false;

  final _formKey = GlobalKey<FormBuilderState>();
  final ValueNotifier<bool> hasText = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildChatAppBar(context),
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(children: [Gap(16), _buildInputBar()])),
    );
  }

  Widget _buildInputBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: FormBuilder(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'message',
                    decoration: const InputDecoration(
                      hintText: "Hello chatGPT, how are you today?",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      hasText.value = value != null && value.trim().isNotEmpty;
                    },
                  ),
                ),

                /// 🎤 Mic Button
                IconButton(
                  icon: Icon(
                    isListening ? Icons.mic : Icons.mic_none,
                    color: isListening ? Colors.red : Colors.grey,
                  ),
                  onPressed: _listen,
                ),

                /// 📤 Send Button
                ValueListenableBuilder<bool>(
                  valueListenable: hasText,
                  builder: (context, active, _) {
                    return IconButton(
                      icon: Icon(
                        Icons.send,
                        color: active ? Colors.white : Colors.grey,
                      ),
                      onPressed: active
                          ? () {
                              final text = _formKey
                                  .currentState
                                  ?.fields['message']
                                  ?.value;

                              print("Send: $text");

                              _formKey.currentState?.reset();
                              hasText.value = false;
                            }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _listen() async {
    if (!isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => isListening = true);

        _speech.listen(
          onResult: (result) {
            final text = result.recognizedWords;

            _formKey.currentState?.fields['message']?.didChange(text);
            hasText.value = text.trim().isNotEmpty;
          },
        );
      }
    } else {
      setState(() => isListening = false);
      _speech.stop();
    }
  }
}
