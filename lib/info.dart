import 'package:cloud_firestore/cloud_firestore.dart';

class TeamData {
  static DocumentSnapshot partidas;
  static int size = 3;
  static List<String> nomes;
  static List<String> logos;
  static int ind = 0;

  static void getLogos() async {
    for (int i = 0; i < size; i++) {
      Firestore.instance
          .collection('esportes')
          .document('basquete')
          .collection('nba')
          .where('nome', isEqualTo: nomes[i])
          .snapshots()
          .listen((event) {
        logos[i] = event.documents[0]['logo'];
      });
    }
  }

  static void getNames() async {
    Firestore.instance
        .collection("esportes")
        .document("basquete")
        .collection("nba")
        .document("partidas")
        .snapshots()
        .listen((event) {
      size = event['confrontos'].length;
      nomes = new List<String>(size);
      logos = new List<String>(size);
      for(int i = 0; i < size; i++){
        nomes[i] = event['confrontos'][i];
      }
    });
  }
}
