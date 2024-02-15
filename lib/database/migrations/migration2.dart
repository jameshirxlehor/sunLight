List<String> migration2() {
  return [
    "CREATE TABLE dimensionamentos(id INTEGER PRIMARY KEY AUTOINCREMENT,mesOuMedia	INTEGER,potenciaPlaca	INTEGER,orientacaoPlacas	TEXT,nome	TEXT,data	TEXT,estado	TEXT,cidade	TEXT,jan	DOUBLE,fev	DOUBLE,mar	DOUBLE,abr	DOUBLE,mai	DOUBLE,jun	DOUBLE,jul	DOUBLE,ago	DOUBLE,sete	DOUBLE,outu	DOUBLE,nov	DOUBLE,dez	DOUBLE,anual	DOUBLE, mediaConsumo DOUBLE);"
  ];
}