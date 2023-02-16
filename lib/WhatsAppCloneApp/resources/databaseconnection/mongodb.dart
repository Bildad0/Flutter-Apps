// ignore_for_file: unused_field, unnecessary_null_comparison

import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DBConnection {
  static DBConnection? _instance;
  final _host = dotenv.env['TRIAL_ENV'];
  final _port = dotenv.env['PORT'];
  final _dbName = dotenv.env['DB_NAME'];
  late Db _db;

  static getInstance() {
    _instance ??= DBConnection();
    return _instance;
  }

  Future<Db> getConnection() async {
    if (_db == null) {
      try {
        _db = Db(_getConnectionString());
        await _db.open();
      } catch (e) {
        print(e);
      }
    }
    return _db;
  }

  _getConnectionString() {
    return "mongodb://$_host:$_port/$_dbName";
  }

  closeConnection() {
    _db.close();
  }
}
