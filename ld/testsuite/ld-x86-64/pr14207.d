#name: PR ld/14207
#as: --64
#ld: -melf_x86_64 -shared -z relro -z now --hash-style=sysv -z max-page-size=0x200000 -z noseparate-code $NO_DT_RELR_LDFLAGS
#readelf: -l --wide
#target: x86_64-*-linux*

Elf file type is DYN \(Shared object file\)
Entry point 0x[0-9a-f]+
There are 4 program headers, starting at offset 64

Program Headers:
  Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
  LOAD           0x000000 0x0000000000000000 0x0000000000000000 0x000150 0x000150 R   0x200000
  LOAD           0x000150 0x0000000000200150 0x0000000000200150 0x0004b8 0x0016f0 RW  0x200000
  DYNAMIC        0x0001a0 0x00000000002001a0 0x00000000002001a0 0x0001c0 0x0001c0 RW  0x8
  GNU_RELRO      0x000150 0x0000000000200150 0x0000000000200150 0x0004b8 0x000eb0 R   0x1

 Section to Segment mapping:
  Segment Sections...
   00     \.hash \.dynsym \.dynstr 
   01     \.(init_array|ctors) \.(fini_array|dtors) \.jcr \.data\.rel\.ro \.dynamic \.got .bss 
   02     \.dynamic 
   03     \.(init_array|ctors) \.(fini_array|dtors) \.jcr \.data\.rel\.ro \.dynamic \.got 
#pass
