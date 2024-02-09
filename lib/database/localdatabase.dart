import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sunlight/database/migrations/migration1.dart';
import 'package:sunlight/database/migrations/migration2.dart';



class LocalDatabase {

  static final Map<int, List<String>> _migrationScripts = {
    1: migration1(),
    2: migration2(),
  };

  Future<Database> initDatabase(String fname) async {
    return await openDatabase(
        join(await getDatabasesPath(), fname),
        version: _migrationScripts.length,
        onCreate: (db, version) async {
          for(final script in _migrationScripts.values) {
            for(String sql in script){
              await db.execute(sql);
            }
          }
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          for (int i = oldVersion + 1; i <= newVersion; i++) {
            for(String sql in (_migrationScripts[i] as List<String>)) {
              await db.execute(sql);
            }
          }
        }
    );
  }
}

