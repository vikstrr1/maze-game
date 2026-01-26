import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'user_controller.dart';

class GameController extends GetxController {
  final _db = FirebaseFirestore.instance;
  final userCtrl = Get.find<UserController>();
  
  var unlockedLevel = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProgress();
  }

  void fetchProgress() async {
    if (userCtrl.user.value == null) return;
    try {
      final doc = await _db.collection('users').doc(userCtrl.user.value!.uid).get();
      if (doc.exists) {
        unlockedLevel.value = doc.data()?['unlockedLevel'] ?? 1;
      }
    } catch (e) {
      print("Error fetching progress: $e");
    }
  }

  Future<void> completeLevel(int levelId) async {
    final user = userCtrl.user.value;
    if (user == null) return;

    if (levelId >= unlockedLevel.value) {
      int nextLevel = levelId + 1;
      unlockedLevel.value = nextLevel;

      await _db.collection('users').doc(user.uid).set({
        'unlockedLevel': nextLevel,
        'userId': user.uid,
        'lastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    }
  }
}