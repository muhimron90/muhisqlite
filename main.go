package main

import (
	"os"
	"unsafe"
)

/*
#cgo LDFLAGS: -lsqlite3
#include "custom_sqlite.h"
#include <stdlib.h>
*/
import "C"

func main() {
	cstr := C.CString("muhi.db")
	defer C.free(unsafe.Pointer(&cstr))
	code := C.open_db(cstr)
	os.Exit(int(code))
}
