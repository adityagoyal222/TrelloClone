import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trello_clone/models/board.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference trelloCollection =
      Firestore.instance.collection('trello');

  Future<void> addBoard(String boardName) async {
    return await trelloCollection
        .document(uid)
        .collection('Boards')
        .document(boardName)
        .setData({'name': boardName});
  }

  Future<void> addList(String boardName, String listName) async {
    return await trelloCollection
        .document(uid)
        .collection('Boards')
        .document(boardName)
        .collection('Lists')
        .document(listName)
        .setData({'name': listName});
  }

  Future<void> addCard(
      String boardName, String listName, String cardName) async {
    return await trelloCollection
        .document(uid)
        .collection('Boards')
        .document(boardName)
        .collection('Lists')
        .document(listName)
        .collection('Cards')
        .document(cardName)
        .setData({'name': cardName});
  }

  Future<void> deleteBoard(String boardName) async {
    try {
      return await trelloCollection
          .document(uid)
          .collection('Boards')
          .document(boardName)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteCard(
      String boardName, String listName, String cardName) async {
    try {
      return await trelloCollection
          .document(uid)
          .collection('Boards')
          .document(boardName)
          .collection('Lists')
          .document(listName)
          .collection('Cards')
          .document(cardName)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }

Stream<List<Board>> getBoardName() {
  return trelloCollection
    .document(uid)
    .collection('Boards')
    .snapshots()
    .map((snapShot) => snapShot.documents
    .map((document) => Board.fromJson(document.data))
    .toList());
}
}
