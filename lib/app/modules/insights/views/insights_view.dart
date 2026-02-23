import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/insights_controller.dart';

class InsightsView extends GetView<InsightsController> {
  const InsightsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InsightsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InsightsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
