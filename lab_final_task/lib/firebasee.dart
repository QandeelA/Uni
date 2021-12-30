
import 'package:firebase_database/firebase_database.dart';

class Board {
  String key;
  String Pass;
  String Index;
  Board(this.Pass, this.Index);
  Board.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        Pass = snapshot.value,
        Index = snapshot.value;

  toJson() {
    return {
      "Pass": Pass,
      "Index": Index,
    };
  }
}
