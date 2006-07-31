from tree cimport FILE

cdef extern from "Python.h":
    ctypedef struct PyObject
    ctypedef struct PyThreadState
    ctypedef int size_t
    ctypedef int Py_ssize_t
    cdef int INT_MAX

    cdef void Py_INCREF(object o)

    cdef FILE* PyFile_AsFile(object p)
    cdef int PyFile_Check(object p)
    cdef object PyFile_Name(object p)

    cdef int PyUnicode_Check(object obj)
    cdef int PyString_Check(object obj)

    cdef object PyUnicode_FromEncodedObject(object s, char* encoding,
                                            char* errors)
    cdef object PyUnicode_Decode(char* s, Py_ssize_t size,
                                 char* encoding, char* errors)
    cdef object PyUnicode_DecodeUTF8(char* s, Py_ssize_t size, char* errors)
    cdef object PyUnicode_AsUTF8String(object ustring)
    cdef char* PyUnicode_AS_DATA(object ustring)
    cdef Py_ssize_t PyUnicode_GET_DATA_SIZE(object ustring)
    cdef object PyString_FromStringAndSize(char* s, Py_ssize_t size)
    cdef object PyString_FromString(char* s)
    cdef object PyString_FromFormat(char* format, ...)
    cdef Py_ssize_t PyString_GET_SIZE(object s)
    cdef object PyBool_FromLong(long value)
    cdef object PyNumber_Int(object value)

    cdef Py_ssize_t PyList_GET_SIZE(object l)
    cdef int PyList_Append(object l, object obj) except -1
    cdef int PyList_Reverse(object l) except -1
    cdef int PyList_Insert(object l, Py_ssize_t index, object o) except -1
    cdef object PyList_GET_ITEM(object l, Py_ssize_t index)
    cdef int PyDict_SetItemString(object d, char* key, object value) except -1
    cdef int PyDict_SetItem(object d, object key, object value) except -1
    cdef PyObject* PyDict_GetItemString(object d, char* key)
    cdef PyObject* PyDict_GetItem(object d, object key)
    cdef int PyDict_DelItem(object d, object key) except -1
    cdef void PyDict_Clear(object d)
    cdef object PyDict_Copy(object d)
    cdef Py_ssize_t PyDict_Size(object d)
    cdef object PyList_AsTuple(object o)
    cdef object PySequence_List(object o)
    cdef object PySequence_Tuple(object o)
    cdef object PyTuple_GET_ITEM(object o, Py_ssize_t pos)

    cdef int PyDict_Check(object instance)
    cdef int PyNumber_Check(object instance)
    cdef int PyBool_Check(object instance)
    cdef int PySequence_Check(object instance)
    cdef int PyType_Check(object instance)
    cdef int PyTuple_CheckExact(object instance)

    cdef int PyObject_SetAttr(object o, object name, object value)

    cdef void* PyMem_Malloc(size_t size)
    cdef void* PyMem_Realloc(void* p, size_t size)
    cdef void PyMem_Free(void* p)
    cdef object PyErr_NoMemory() # always returns NULL to pass on exception

    ctypedef enum PyGILState_STATE:
        PyGILState_LOCKED
        PyGILState_UNLOCKED

    cdef PyGILState_STATE PyGILState_Ensure()
    cdef void PyGILState_Release(PyGILState_STATE state)
    cdef PyThreadState* PyEval_SaveThread()
    cdef void PyEval_RestoreThread(PyThreadState* state)
    cdef PyObject* PyThreadState_GetDict()

cdef extern from "etree_defs.h": # redefines some functions as macros
    cdef int _isString(object obj)
    cdef int isinstance(object instance, object classes)
    cdef int issubclass(object derived,  object superclasses)
    cdef int hasattr(object obj, object attr)
    cdef int callable(object obj)
    cdef object str(object obj)
    cdef object iter(object obj)
    cdef char* _cstr(object s)
