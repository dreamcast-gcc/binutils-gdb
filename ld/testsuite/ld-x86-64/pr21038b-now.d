#name: PR ld/21038 (.plt.sec, -z now)
#source: pr21038b.s
#as: --64
#ld: -z now -z bndplt -melf_x86_64 -shared -z relro --ld-generated-unwind-info --hash-style=sysv -z max-page-size=0x200000 -z noseparate-code $NO_DT_RELR_LDFLAGS
#objdump: -dw -Wf

.*: +file format .*

Contents of the .eh_frame section:

0+ 0000000000000014 00000000 CIE
  Version:               1
  Augmentation:          "zR"
  Code alignment factor: 1
  Data alignment factor: -8
  Return address column: 16
  Augmentation data:     1b

  DW_CFA_def_cfa: r7 \(rsp\) ofs 8
  DW_CFA_offset: r16 \(rip\) at cfa-8
  DW_CFA_nop
  DW_CFA_nop

0+18 0000000000000014 0000001c FDE cie=00000000 pc=00000000000001d8..00000000000001dd
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

0+30 0000000000000024 00000034 FDE cie=00000000 pc=00000000000001b0..00000000000001d0
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 6 to 00000000000001b6
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 10 to 00000000000001c0
  DW_CFA_def_cfa_expression \(DW_OP_breg7 \(rsp\): 8; DW_OP_breg16 \(rip\): 0; DW_OP_lit15; DW_OP_and; DW_OP_lit5; DW_OP_ge; DW_OP_lit3; DW_OP_shl; DW_OP_plus\)
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

0+58 0000000000000010 0000005c FDE cie=00000000 pc=00000000000001d0..00000000000001d8
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop


Disassembly of section .plt:

0+1b0 <.plt>:
 +[a-f0-9]+:	ff 35 b2 01 20 00    	push   0x2001b2\(%rip\)        # 200368 <_GLOBAL_OFFSET_TABLE_\+0x8>
 +[a-f0-9]+:	f2 ff 25 b3 01 20 00 	bnd jmp \*0x2001b3\(%rip\)        # 200370 <_GLOBAL_OFFSET_TABLE_\+0x10>
 +[a-f0-9]+:	0f 1f 00             	nopl   \(%rax\)
 +[a-f0-9]+:	68 00 00 00 00       	push   \$0x0
 +[a-f0-9]+:	f2 e9 e5 ff ff ff    	bnd jmp 1b0 <func@plt-0x20>
 +[a-f0-9]+:	0f 1f 44 00 00       	nopl   0x0\(%rax,%rax,1\)

Disassembly of section .plt.sec:

0+1d0 <func@plt>:
 +[a-f0-9]+:	f2 ff 25 a1 01 20 00 	bnd jmp \*0x2001a1\(%rip\)        # 200378 <func>
 +[a-f0-9]+:	90                   	nop

Disassembly of section .text:

0+1d8 <foo>:
 +[a-f0-9]+:	e8 f3 ff ff ff       	call   1d0 <func@plt>
#pass
