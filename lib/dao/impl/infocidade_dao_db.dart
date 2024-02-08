import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../infocidade.dart';
import '../infocidade_dao.dart';
import '../listacomandossql.dart';


class infocidadeDaoDb implements infocidadeDao {
  Database? _db;

  @override
  Future iniciar() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'indice_solarimetrico.db'),
      onCreate: (db, version) {
        return db.execute(
          listarComandosSql(),
        );
      },
      version: 1,
    );
  }

  @override
  Future<List<InfoCidade>> listar(String tabela) async {
    final List<Map<String, dynamic>> result = await _db!.query(tabela);
    return result.map((element) => InfoCidade.fromMap(element)).toList();
  }
}
