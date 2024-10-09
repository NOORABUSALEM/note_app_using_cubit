import 'package:note/core/local_database/database_helper.dart';
import 'package:note/sahred/note_service/model/note_model.dart';

class NoteDataProvider {
  final localClient = DatabaseHelper();

  Future<int> create(NoteModel note) async {
    final db = await localClient.database;
    final result = await db.insert(
      DatabaseHelper.noteTableKey,
      note.toMapWithoutId(),
    );
    return result;
  }

  Future<int> update(NoteModel note) async {
    print('NoteDataProvider.update: note.id: ${note.id}');
    final db = await localClient.database;
    final result = await db.update(
      DatabaseHelper.noteTableKey,
      note.toMapWithoutId(),
      where: "id = ?",
      whereArgs: [note.id],
    );
    return result;
  }
  Future<int> delete(NoteModel note) async {
    print('NoteDataProvider.update: note.id: ${note.id}');
    final db = await localClient.database;
    final result = await db.delete(
      DatabaseHelper.noteTableKey,
      where: "id = ?",
      whereArgs: [note.id],
    );
    return result;
  }

  Future<List<NoteModel>> fetch([int limit = 15]) async {
    final db = await localClient.database;
    final result = await db.query(
      DatabaseHelper.noteTableKey,
      limit: limit,
    );
    return result.map((e) => NoteModel.fromMap(e)).toList();
  }
}
// final result = await db.rawInsert('''
// insert into ${DatabaseHelper.noteTableKey}
// (title, description, colorCode) values(?,?,?)
// ''', [
//   note.title,
//   note.description,
//   note.colorCode,
// ]);
