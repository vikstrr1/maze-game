import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'user_controller.dart';

class GameController extends GetxController {
  final _db = FirebaseFirestore.instance;
  final userCtrl = Get.find<UserController>();
  
  // Requirement: Track progression
  var unlockedLevel = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProgress();
  }

  void fetchProgress() async {
    if (userCtrl.user.value == null) return;
    // Requirement: Save/Load from application restarts
    final doc = await _db.collection('users').doc(userCtrl.user.value!.uid).get();
    unlockedLevel.value = doc.data()?['unlockedLevel'] ?? 1;
  }
}