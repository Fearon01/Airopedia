import 'dart:convert';
import 'package:airopedia/DataStructures/observation.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ObservationsDatabase {
  static final ObservationsDatabase instance = ObservationsDatabase._init();

  static Database? _database;

  ObservationsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('observations.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filePath);

    return await openDatabase(path, version: 1, onCreate: _CreateDB);
  }

  Future _CreateDB(Database database, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    
    final textType = 'TEXT NOT NULL';

    await database.execute('''
CREATE TABLE $observationTable (
      ${ObservationFields.id} $idType,
      ${ObservationFields.name} $textType,
      ${ObservationFields.stateName} $textType,
      ${ObservationFields.countryName} $textType,
      ${ObservationFields.observation} $textType,
      ${ObservationFields.observationTitle} $textType,
      ${ObservationFields.observationTime} $textType
     )''');
  }

  Future<Observation> Create(Observation observation) async {
    final db = await instance.database;

    final id = await db.insert(observationTable, observation.ConvertToJson());
    return observation.Copy(id: id);
  }

  Future<int> Update(Observation observation) async 
  {
    final db = await instance.database;

    return db.update(observationTable, observation.ConvertToJson(), where: '${ObservationFields.id} = ?', whereArgs: [observation.id]);
       
  }

  Future<int> Delete(int id) async 
  {
    final db = await instance.database;

    return await db.delete(observationTable, where: '${ObservationFields.id} = ?', whereArgs: [id]);
  }

  Future<Observation> Read(int id) async {
    final db = await instance.database;

    final maps = await db.query(observationTable,
        columns: ObservationFields.values,
        where: '${ObservationFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Observation.FromJson(maps.first);
    } else {
      throw Exception('ID not found');
    }
  }

  Future<List<Observation>> ReadAll() async {
    final db = await instance.database;

    final order = '${ObservationFields.name} ASC';

    final result = await db.query(observationTable, orderBy: order);

    return result.map((json) => Observation.FromJson(json)).toList();
  }

  Future CloseDatabase() async {
    final db = await instance.database;

    db.close();
  }

}
