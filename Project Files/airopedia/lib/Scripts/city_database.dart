import 'dart:convert';
import 'package:airopedia/DataStructures/city.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CityDatabase {
  static final CityDatabase instance = CityDatabase._init();

  static Database? _database;

  CityDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('cities.db');
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
CREATE TABLE $cityTable (
      ${CityFields.id} $idType,
      ${CityFields.name} $textType,
      ${CityFields.stateName} $textType,
      ${CityFields.countryName} $textType,
      ${CityFields.lastAccess} $textType
     )''');
  }

  Future<City> Create(City city) async {
    final db = await instance.database;

    final id = await db.insert(cityTable, city.ConvertToJson());
    return city.Copy(id: id);
  }

  Future<int> Update(City city) async 
  {
    final db = await instance.database;

    return db.update(cityTable, city.ConvertToJson(), where: '${CityFields.id} = ?', whereArgs: [city.id]);
       
  }

  Future<int> Delete(int id) async 
  {
    final db = await instance.database;

    return await db.delete(cityTable, where: '${CityFields.id} = ?', whereArgs: [id]);
  }

  Future<City> Read(int id) async {
    final db = await instance.database;

    final maps = await db.query(cityTable,
        columns: CityFields.values,
        where: '${CityFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return City.FromJson(maps.first);
    } else {
      throw Exception('ID not found');
    }
  }

  Future<List<City>> ReadAll() async {
    final db = await instance.database;

    final order = '${CityFields.name} ASC';

    final result = await db.query(cityTable, orderBy: order);

    return result.map((json) => City.FromJson(json)).toList();
  }

  Future CloseDatabase() async {
    final db = await instance.database;

    db.close();
  }

}
