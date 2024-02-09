import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sunlight/model/listacomandossql.dart';

class LocalDatabase {

  static final Map<int, List<String>> _migrationScripts = {
    1: listarComandosSql()
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

