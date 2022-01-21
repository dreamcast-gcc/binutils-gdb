# If you change this file, please also look at files which source this one:
# shlelf.sh, shelf_nbsd.sh

SCRIPT_NAME=elf
OUTPUT_FORMAT="elf32-sh"
NO_REL_RELOCS=yes
TEXT_START_ADDR=0x8C010000
MAXPAGESIZE=128
ARCH=sh
MACHINE=
TEMPLATE_NAME=elf
GENERATE_SHLIB_SCRIPT=yes
EMBEDDED=yes
# These are for compatibility with the COFF toolchain.
ENTRY=start
CTOR_START='___ctors = .;'
CTOR_END='___ctors_end = .;'
DTOR_START='___dtors = .;'
DTOR_END='___dtors_end = .;'
# remove this
unset STACK_ADDR
# We do not need .stack for shared library.
test -n "$CREATE_SHLIB" && unset STACK_ADDR
