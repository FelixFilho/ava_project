import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/models/address.dart';
import '../../data/models/user.dart';

class SQLiteService {
  final String userDatabase = 'user';
  final String addressDatabase = 'address';
  Database? _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await databaseConnect();
      return _db!;
    }
  }

  Future<Database> databaseConnect() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT)'
          'CREATE TABLE address(id INTEGER PRYMARY KEY AUTOINCREMENT, cep TEXT, logradouro TEXT, complemento TEXT, bairro TEXT, localidade TEXT, uf TEXT, FOREIGN KEY (userid) REFERENCES user (id) ON DELETE NO ACTION ON UPDATE NO ACTION)',
        );
      },
      version: 1,
    );

    return database;
  }

  Future<Either<String, User>> login(String email, String password) async {
    final scopedDb = await db;

    final List<Map<String, dynamic>> maps = await scopedDb.query(
      userDatabase,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (maps.isEmpty) {
      return const Left('Usuário ou senha incorreto');
    } else {
      return Right(
        User(
          email: maps.first['email'],
          password: maps.first['password'],
          id: maps.first['id'].toString(),
          name: maps.first['name'],
        ),
      );
    }
  }

  Future<void> insertUser(String name, String email, String password) async {
    final scopedDb = await db;

    await scopedDb.insert(
      userDatabase,
      {
        'name': name,
        'email': email,
        'password': password,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertAddress(Address address) async {
    final scopedDb = await db;

    await scopedDb.insert(
      addressDatabase,
      address.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> getUsers() async {
    final scopedDb = await db;

    final List<Map<String, dynamic>> maps = await scopedDb.query(userDatabase);

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }

  Future<List<Address>> getAddresses() async {
    final scopedDb = await db;

    final List<Map<String, dynamic>> maps =
        await scopedDb.query(addressDatabase);

    return List.generate(maps.length, (i) {
      return Address(
        id: maps[i]['id'],
        cep: maps[i]['cep'],
        logradouro: maps[i]['logradouro'],
        complemento: maps[i]['complemento'],
        bairro: maps[i]['bairro'],
        localidade: maps[i]['localidade'],
        uf: maps[i]['uf'],
      );
    });
  }

  Future<void> updateUser(User user) async {
    final scopedDb = await db;

    await scopedDb.update(
      userDatabase,
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<void> updateAddress(Address address) async {
    final scopedDb = await db;

    await scopedDb.update(
      addressDatabase,
      address.toMap(),
      where: 'id = ?',
      whereArgs: [address.id],
    );
  }

  Future<void> deleteUser(int id) async {
    final scopedDb = await db;

    await scopedDb.delete(
      userDatabase,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAddress(int id) async {
    final scopedDb = await db;

    await scopedDb.delete(
      addressDatabase,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
