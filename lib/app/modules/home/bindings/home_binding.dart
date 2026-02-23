import 'package:get/get.dart';

import '../../chat/controllers/chat_controller.dart';
import '../../insights/controllers/insights_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Main shell controller
    Get.lazyPut<HomeController>(() => HomeController());
    // Tab controllers — all loaded when Home route is entered
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<InsightsController>(() => InsightsController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
