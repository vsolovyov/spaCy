from cymem.cymem cimport Pool
from preshed.maps cimport PreshMap
from murmurhash.mrmr cimport hash64
from .typedefs cimport attr_t

from libc.stdint cimport int64_t

from .typedefs cimport hash_t

cpdef hash_t hash_string(unicode string) except 0


ctypedef union Utf8Str:
    unsigned char[8] s
    unsigned char* p


cdef class StringStore:
    cdef Pool mem
    cdef Utf8Str* c
    cdef int64_t size

    cdef PreshMap _map
    cdef size_t _resize_at

    cdef const Utf8Str* intern(self, unsigned char* chars, int length) except NULL
