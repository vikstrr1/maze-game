class LevelProgress {
  final String id;
  final int levelIndex;
  final bool isCompleted;
  final String userId;

  LevelProgress({
    required this.id, 
    required this.levelIndex, 
    required this.isCompleted, 
    required this.userId
  });

  factory LevelProgress.fromFirestore(Map<String, dynamic> data, String id) {
    return LevelProgress(
      id: id,
      levelIndex: data['levelIndex'],
      isCompleted: data['isCompleted'] ?? false,
      userId: data['userId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'levelIndex': levelIndex,
      'isCompleted': isCompleted,
      'userId': userId,
    };
  }
}