import 'dart:convert';
import 'package:airopedia/DataStructures/recently_visited.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RecentlyVisitedDatabase {
  static final RecentlyVisitedDatabase instance = RecentlyVisitedDatabase._init();

  static Database? _database;

  RecentlyVisitedDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('recently_visited.db');
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
CREATE TABLE $recentTable (
      ${RecentCityFields.id} $idType,
      ${RecentCityFields.name} $textType,
      ${RecentCityFields.stateName} $textType,
      ${RecentCityFields.countryName} $textType,
      ${RecentCityFields.lastAccess} $textType
     )''');
  }

  Future<RecentCity> Create(RecentCity city) async {
    final db = await instance.database;

    final id = await db.insert(recentTable, city.ConvertToJson());
    return city.Copy(id: id);
  }

  Future<int> Update(RecentCity city) async 
  {
    final db = await instance.database;

    return db.update(recentTable, city.ConvertToJson(), where: '${RecentCityFields.id} = ?', whereArgs: [city.id]);
       
  }

  Future<int> Delete(int id) async 
  {
    final db = await instance.database;

    return await db.delete(recentTable, where: '${RecentCityFields.id} = ?', whereArgs: [id]);
  }

  Future<RecentCity> Read(int id) async {
    final db = await instance.database;

    final maps = await db.query(recentTable,
        columns: RecentCityFields.values,
        where: '${RecentCityFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return RecentCity.FromJson(maps.first);
    } else {
      throw Exception('ID not found');
    }
  }

  Future<RecentCity?> ReadUsingName(String name, String stateName, String countryName) async {
    final db = await instance.database;

    final maps = await db.query(recentTable,
        columns: RecentCityFields.values,
        where: '${RecentCityFields.name} = ? and ${RecentCityFields.stateName} = ? and ${RecentCityFields.countryName} = ?',
        whereArgs: [name, stateName, countryName]);

    if (maps.isNotEmpty) {
      return RecentCity.FromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<RecentCity>> ReadAll() async {
    final db = await instance.database;

    final order = '${RecentCityFields.lastAccess} DESC';

    final result = await db.query(recentTable, orderBy: order);

    return result.map((json) => RecentCity.FromJson(json)).toList();
  }

  Future CloseDatabase() async {
    final db = await instance.database;

    db.close();
  }

}
