import 'dart:io';

import 'package:jwelery_kart/data/models/customer.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final AppDatabase _appDatabase = AppDatabase._internal();

  //private internal constructor to make it singleton
  AppDatabase._internal();

  Database _database;

  static AppDatabase get() {
    return _appDatabase;
  }

  bool didInit = false;

  /// Use this method to access the database which will provide you future of [Database],
  /// because initialization of the database (it has to go through the method channel)
  Future<Database> getDb() async {
    if (!didInit) await _init();
    return _database;
  }

  Future _init() async {
    // Get a location using path_provider
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'jewelerykart.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await _createProjectTable(db);
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      await db.execute("DROP TABLE ${Customer.tblCustomer}");
      await _createProjectTable(db);
    });
    didInit = true;
  }

  Future _createProjectTable(Database db) {
    return db.transaction((Transaction txn) async {
      txn.execute('CREATE TABLE ${Customer.tblCustomer} ('
          '${Customer.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,'
          '${Customer.dbName} TEXT,'
          '${Customer.dbEmail} TEXT,'
          '${Customer.dbContact} TEXT,'
          '${Customer.dbCity} TEXT,'
          '${Customer.dbPincode} TEXT,'
          '${Customer.dbAddress} TEXT);');
    });
  }

  addCustomer(Customer customer) async {
    final db = await getDb();
    var res = await db.insert(Customer.tblCustomer, customer.toJson());
    return res;
  }

  fetchCustomer(int id) async {
    final db = await getDb();
    var res = await db.query(Customer.tblCustomer,
        where: '${Customer.dbId} = ?', whereArgs: [id]);
    return res.isNotEmpty ? Customer.fromJson(res.first) : Null;
  }

  updateCustomer(Customer customer) async {
    final db = await getDb();
    var res = await db.update(Customer.tblCustomer, customer.toJson(),
        where: '${Customer.dbId} = ?', whereArgs: [customer.customerId]);
    return res;
  }

  removeCustomer(int id) async {
    final db = await getDb();
    db.delete(Customer.tblCustomer,
        where: '${Customer.dbId} = ?', whereArgs: [id]);
  }
}
