import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get_x/app/modules/dog/dog_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DogTable {
  Database? _database;
  List<Dog> dogList = [];
  bool isLoading = false;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  // init
  DogTable() {
    initDB();
  }

  //初始化数据库方法
  initDB() async {
    // Avoid errors caused by flutter upgrade.
    // Importing 'package:flutter/widgets.dart' is required.
    print(join(await getDatabasesPath(), 'doggie_database.db'));
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    return await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      // 设置数据库的路径。注意：使用 `path` 包中的 `join` 方法是
      // 确保在多平台上路径都正确的最佳实践。
      join(await getDatabasesPath(), 'doggie_database.db'),
      // When the database is first created, create a table to store dogs.
      // 当数据库第一次被创建的时候，创建一个数据表，用以存储狗狗们的数据。
      onCreate: (db, version) async {
        // Run the CREATE TABLE statement on the database.
        await db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      onOpen: (db) => db,
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      // 设置版本。它将执行 onCreate 方法，同时提供数据库升级和降级的路径。
      version: 1,
    );
  }

  // Define a function that inserts dogs into the database
  Future<void> insertDog(Dog dog) async {
    final Database db = await database;
    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'dogs',
      dog.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Dog>> getDogs() async {
    final Database db = await database;
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i) {
      return Dog.fromJson(maps[i]);
    });
  }

  // 根据id查询信息
  Future<Dog?> getDogById(int id) async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('dogs',
        columns: ['id', 'name', 'age'], where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Dog.fromJson(maps.first);
    }
    return null;
  }

  Future<void> updateDog(Dog dog) async {
    final Database db = await database;
    // Update the given Dog (修改给定的狗狗的数据)
    await db.update(
      'dogs',
      dog.toJson(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    final Database db = await database;
    // Remove the Dog from the database (将狗狗从数据库移除)
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
