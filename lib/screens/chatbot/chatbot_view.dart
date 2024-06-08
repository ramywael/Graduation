import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grad/constants/constant.dart';
import 'package:grad/screens/chatbot/chat_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'api_key.dart';

class ChatbotView extends StatefulWidget {
  const ChatbotView({super.key});

  @override
  State<ChatbotView> createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<ChatbotView> {

  List<ChatBotModel> chatList = [];
  final TextEditingController controller = TextEditingController();
  File? image;

  void onSendMessage() async {
    late ChatBotModel model;

    if (image == null) {
      model = ChatBotModel(isMe: true, message: controller.text);
    } else {
      final imageBytes = await image!.readAsBytes();

      String base64EncodedImage = base64Encode(imageBytes);

      model = ChatBotModel(
        isMe: true,
        message: controller.text,
        base64EncodedImage: base64EncodedImage,
      );
    }

    chatList.insert(0, model);

    setState(() {});

    final geminiModel = await sendRequestToGemini(model);

    chatList.insert(0, geminiModel);
    setState(() {});
  }

  void selectImage() async {
    final picker = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    if (picker != null) {
      image = File(picker.path);
    }
  }

  Future<ChatBotModel> sendRequestToGemini(ChatBotModel model) async {
    String url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${GeminiApiKey.apiKey}";

    Map<String, dynamic> body = {};

    if (model.base64EncodedImage == null) {
      url =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${GeminiApiKey.apiKey}";

      body = {
        "contents": [
          {
            "parts": [
              {"text": model.message},
            ],
          },
        ],
      };
    } else {
      url =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro-vision:generateContent?key=${GeminiApiKey.apiKey}";

      body = {
        "contents": [
          {
            "parts": [
              {"text": model.message},
              {
                "inline_data": {
                  "mime_type": "image/jpeg",
                  "data": model.base64EncodedImage,
                }
              }
            ],
          },
        ],
      };
    }

    Uri uri = Uri.parse(url);

    final result = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    );

    if (kDebugMode) {
      print(result.statusCode);
    }
    if (kDebugMode) {
      print(result.body);
    }

    final decodedJson = json.decode(result.body);

    String message =
    decodedJson['candidates'][0]['content']['parts'][0]['text'];

    ChatBotModel geminiModel = ChatBotModel(isMe: false, message: message);

    return geminiModel;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Chatbot",
          style: TextStyle(
              fontSize: 28,
              fontFamily: 'Ubuntu',
              color: kPrimaryColor
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: ListView.builder(
              reverse: true,
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      chatList[index].isMe ? "Me" : "Chatbot",
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Ubuntu',
                      color: Colors.red
                    ),
                  ),
                  subtitle: chatList[index].base64EncodedImage != null
                      ? Column(
                    children: [
                      Image.memory(
                        base64Decode(chatList[index].base64EncodedImage!),
                        height: 300,
                        width: double.infinity,
                      ),
                      Text(
                          chatList[index].message,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Ubuntu'
                        ),
                      ),
                    ],
                  )
                      : Text(
                      chatList[index].message,
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Ubuntu'
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20,top: 20,bottom: 25,right: 10),
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(

                      prefixIcon: IconButton(
                        onPressed: () {
                          selectImage();
                        },
                        color: kPrimaryColor,
                        icon: const Icon(
                          Icons.upload_file,
                          size: 23,
                        ),
                      ),
                      hintText: "Enter your message ... ",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(21),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                IconButton(
                  onPressed: () {
                    if(controller.text == ''){
                      showScaffoldMessenger(
                          context: context,
                          message: "Enter the message, please ",
                          color: kPrimaryColor
                      );
                    }
                    else {
                      onSendMessage();
                      setState(() {
                        controller.clear();
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.send,
                    color: kPrimaryColor,
                      size: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
