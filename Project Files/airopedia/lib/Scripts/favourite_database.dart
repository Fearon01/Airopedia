import 'dart:convert';
import 'package:airopedia/DataStructures/favourite_city.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavouriteDatabase {
  static final FavouriteDatabase instance = FavouriteDatabase._init();

  static Database? _database;

  FavouriteDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('favourites.db');
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
CREATE TABLE $favouriteTable (
      ${FavouriteCityFields.id} $idType,
      ${FavouriteCityFields.name} $textType,
      ${FavouriteCityFields.stateName} $textType,
      ${FavouriteCityFields.countryName} $textType
     )''');
  }

  Future<FavouriteCity> Create(FavouriteCity city) async {
    final db = await instance.database;

    final id = await db.insert(favouriteTable, city.ConvertToJson());
    return city.Copy(id: id);
  }

  Future<int> Update(FavouriteCity city) async 
  {
    final db = await instance.database;

    return db.update(favouriteTable, city.ConvertToJson(), where: '${FavouriteCityFields.id} = ?', whereArgs: [city.id]);
       
  }

  Future<int> Delete(int id) async 
  {
    final db = await instance.database;

    return await db.delete(favouriteTable, where: '${FavouriteCityFields.id} = ?', whereArgs: [id]);
  }

  Future<FavouriteCity> Read(int id) async {
    final db = await instance.database;

    final maps = await db.query(favouriteTable,
        columns: FavouriteCityFields.values,
        where: '${FavouriteCityFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return FavouriteCity.FromJson(maps.first);
    } else {
      throw Exception('ID not found');
    }
  }

  Future<FavouriteCity?> ReadUsingName(String name, String stateName, String countryName) async {
    final db = await instance.database;

    final maps = await db.query(favouriteTable,
        columns: FavouriteCityFields.values,
        where: '${FavouriteCityFields.name} = ? and ${FavouriteCityFields.stateName} = ? and ${FavouriteCityFields.countryName} = ?',
        whereArgs: [name, stateName, countryName]);

    if (maps.isNotEmpty) {
      return FavouriteCity.FromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<FavouriteCity>> ReadAll() async {
    final db = await instance.database;

    final order = '${FavouriteCityFields.name} ASC';

    final result = await db.query(favouriteTable, orderBy: order);

    return result.map((json) => FavouriteCity.FromJson(json)).toList();
  }

  Future CloseDatabase() async {
    final db = await instance.database;

    db.close();
  }

}
