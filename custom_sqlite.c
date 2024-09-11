#include "custom_sqlite.h"
#include <stdio.h>

static int callback(void *data, int argc, char *argv[], char *azColName[]) {
  int i;
  fprintf(stderr, "%s: \n", (const char *)data);
  for (i = 0; i < argc; i++) {
    printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
  }
  printf("\n");
  return 0;
}

int open_db(const char *db_name) {
  sqlite3 *db;
  char *zErrMsg = 0;
  int rc;
  char *sql_stmt;
  const char *data = "Callback called";

  rc = sqlite3_open(db_name, &db);
  if (rc) {
    fprintf(stderr, "cant open database %s\n", sqlite3_errmsg(db));
    sqlite3_close(db);
    return (-1);
  } else {
    fprintf(stderr, "Opened database successfully\n");
  }
  // create SQL STATEMENT
  sql_stmt = "SELECT * FROM posts";
  /* execute */
  rc = sqlite3_exec(db, sql_stmt, callback, (void *)data, &zErrMsg);
  if (rc != SQLITE_OK) {
    fprintf(stderr, "SQL error : %s\n", zErrMsg);
    sqlite3_free(zErrMsg);
  } else {
    fprintf(stdout, "OPERATION successfully\n");
  }
  sqlite3_close(db);
  return 0;
}
