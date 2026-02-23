import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessage {
  const ChatMessage({
    required this.text,
    required this.isUser,
    required this.time,
  });

  final String text;
  final bool isUser;
  final DateTime time;
}

class ChatController extends GetxController {
  final messageController = TextEditingController();
  final scrollController = ScrollController();

  var isTyping = false.obs;
  var messages = <ChatMessage>[].obs;

  // Rotating mock AI responses (sebelum Firebase + AI diintegrasikan)
  static const _responses = [
    'Aku dengar kamu. Mau cerita lebih? Kadang ngeluarin isi kepala bisa sangat membantu. 🙂',
    'Itu wajar banget dirasain. Burnout pada developer itu nyata, dan kamu tidak sendirian. Apa yang paling bikin kamu berat hari ini?',
    'Terima kasih sudah share. Coba kita cari tahu apa yang bisa bikin situasinya lebih ringan ya?',
    'Sudah berapa lama kamu coding hari ini? Istirahat 5–10 menit kadang justru bikin fokus balik lebih tajam lho. 💡',
    'Kamu keren banget sudah sadar soal kondisi kamu. Self-awareness itu langkah pertama yang paling penting.',
    'Hmm, menarik. Seringkali pola stress developer muncul dari ekspektasi yang terlalu tinggi ke diri sendiri. Gimana kamu menetapkan target harian kamu?',
    'Kalau boleh saran — coba tulis 3 hal yang udah kamu selesaikan hari ini, sekecil apapun. Itu bisa bantu kasih perspektif positif.',
  ];

  int _responseIdx = 0;

  @override
  void onInit() {
    super.onInit();
    // Pesan selamat datang dari SWENY
    messages.add(ChatMessage(
      text:
          'Hei! Aku SWENY, companion AI kamu. 👋\n\nAku di sini untuk dengerin dan bantu kamu manage stress serta burnout sebagai developer.\n\nBagaimana hari coding kamu hari ini?',
      isUser: false,
      time: DateTime.now(),
    ));
  }

  void sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    // Tambahkan pesan user
    messages.add(ChatMessage(text: text, isUser: true, time: DateTime.now()));
    messageController.clear();
    _scrollToBottom();

    // Tampilkan typing indicator
    isTyping.value = true;
    await Future.delayed(const Duration(milliseconds: 1400));
    isTyping.value = false;

    // Balas dengan response AI
    final reply = _responses[_responseIdx % _responses.length];
    _responseIdx++;
    messages.add(ChatMessage(text: reply, isUser: false, time: DateTime.now()));
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 120), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String formatTime(DateTime time) {
    final h = time.hour.toString().padLeft(2, '0');
    final m = time.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
