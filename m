From: Progga <abulfazl@juniv.edu>
Subject: Re: Boot code in C
Date: Tue, 6 Jul 2004 11:26:18 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040706112618.B358@Imrashi.net.bd>
References: <1089035369.7299.48.camel@kaushal>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1089035369.7299.48.camel@kaushal>; from kaushal@rocsys.com on Mon, Jul 05, 2004 at 07:19:29PM +0530
List-Id: <linux-c-programming.vger.kernel.org>
To: kaushal <kaushal@rocsys.com>
Cc: linux-c-programming@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 05, 2004 at 07:19:29PM +0530, kaushal wrote:

>           I want to know if there is a way to  generate a binary file,
> from  a C program(Not from an assembly code)(can use any Linux
> tools)that can be burned on to a floppy and which ,say--  just prints a
> string on to the screen.
> I tried out to the following:

 If you are willing to use grub for booting your code, then -

	$ info multiboot

		-> Example -> Example OS code


 If you want a custome bootloader but grub to boot the executive, see the
attachment.  It's a mixture of C and (Nasm) Assembly.  The reference was
tiny.txt.



 Khoda Hafez
 Progga

* Attached is the bootloader BOOT12.* by Jhon Fine.  It's for fat12.
** Also Google for this file - "CompilingBinaryFilesUsingACompiler.pdf". 


--45Z9DzgjV8m4Oswq
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="c-kern.tar.bz2"
Content-Transfer-Encoding: base64

QlpoOTFBWSZTWeMFOOYABDt/iv86FBBe///+P7f/qv///+oAICAAAAhQBX7mtd3WW5xd3XRO
zuzawamKaE2p6mppgTJ6RhB6j1DQNA0GgaDQAaANAlEmamKegTRPVAyNPUGjQDQaAAAAAaAA
SIiTJqJtJ6jTajIZGhpoaZA0yANAZAA0NAHMmmhkADEZBkANMEDEA0aaADIGgASRECaEwTNQ
NMpo9E9IPU0yaaBoANAGmjEPUepzofRyc/I2LGGS1QicAesAI+BKOiCwKLg7jQxHP1bodlg6
sQ1YNI40pIkJbSAlRbv9GwqqnahVc8N/4pQwpDSgaA2D9wNmzMB/Gko/Y6dN15i1KUmOxwwH
3tS+5VgNyLsX3z/En5piSUjZnuHZy3sec7niZftQlIQ9E0D5EnCnRolNtPHwFS03HhYWuyBK
LLQGm6t+i1HakVwEMiXZgFxGMRc8bNqVEkuU0JZiGhJBp33NtHBEMNBka0Gm1IibtLXvRESu
1xVbKkKljAQe1LnVffZ1a+urY/k06sthVm0N5GFUYIEKDEn2Ja3yiELongWHLIkIC8CGJSEp
HioMSCjF67KCIn+IC9V3ewl8HzOI2pYbvTdl0zcL5At5GESBMPhX24bBFByiva3X3SIlhZzY
7EFGsoL3Ipg04ZdqUiFgT2YRa3bi0A2KOkj0zqJqo4XbkYOHcfQy+fTzMZtjtcpzLYx5ethB
nE5LLK/NXfJL1jC5E1ndeovb9wypDFTBYb7HX6ttpk2u3WjIEYBkoGSll0lDSguqAcTN1d84
6iSSV8cI1uJszZjiAuIazgIEi6GLIy76GNzXdmo4AqDOVGWg3ojGVpTZjUpta9lyYWvBhaM1
QlXHDeBm2ZcKzby7JKTM7ruYZYw3+vidw8N1ATaCxJbljq+he2MER1FVxOt9TL0XvQeCIM2t
MQbuIxuT8NSDkFn9tmpOKKhJhHZC3xoKXPfmcIRh65S3s+mq+uJZM0vUpmiWOzzlVNiUzR5V
BsK/a1xcsDNlEZs0FJFtBEuMGCYrUoi1tqxmjfJNWVIEYZwubLfhunnV7kAs7yWtkilzmiZw
SGwFsGOqsZ3DpngWeB8dr9YLowKBtvkc/AMG/uK0+Z3nyzL7EznCczdDhMQ5mZzwg04L2zkp
9At9Nzl6ldm4617Mb0zArOHgXBMKhoIQ9SRaYoVaVU9DkzfMwau3lMpElrQJ0dhbTAbsyUzg
9IinHNdeCb8RvaV19g4hG8VhLYY8ry5q9Ftw22NBbvMG/KAmurxBiJ0bxRFXrvDo9fLV2+TB
jhYFZMOo5wMGK64vaF5RMBRO8epAilV0kDOalivdtMmTAMmBh+itrLCwqCwohKFggtKF9IpV
JB2FNbpmTsaY8Q2SRpMxzBVL1SXIWTOHQ8xOH9XhybYtC9Ng7RUJB3dboXzgM2iWA8mfzmDf
uvx4BLIlBICk6YnKSohFho5aXiFJf4yUsZ6p91FUGGMsEi1hsS2EZD2+XOwSGmYzMDAMs8a5
G9RcdzjsymEJysEws6LSxF8HYsGFEKYMVMOPUVUtvPQV2kyE6rBtp0hZfRGCKhwX6NSPmtsb
PAAqif24ldgg4o5VAUGOYz3CuKhWivaKUQwg1qQdQpnZFETIyXTmrUlgWUYKBT4byiUkxKee
IUrZRfZFMtvJVekANsbAxsYXKBWgapYNKsKDDIZggE6tEvlvbGtAFjbJEaYD+AFB2dnvSxbT
RjUQtaFbQHBsYJRJ4ic6DGZcURv6uSkZMweQgwcWkmVhU0ypqFatWmabqoyjlEFMxHRkwa1u
O1GuzKQ9HqEUuvMwlNebsaRTokuzEhIdVaEWZD9DgGra4dk71xCsIDWPACRxl1XpW+WMxAL/
i7kinChIcYKccwA=

--45Z9DzgjV8m4Oswq
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="BOOT12.bin"
Content-Transfer-Encoding: base64

6zyQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAxwI7YjtC8AHyJ5YhWJIpGEPdmFgNGDot2EbEETtPuRr8DAOiKAFCLVhEeB78A
Bkp4aL7zfbkLAI1FIFDzpl917v91+otGDot2Fr9AAOhgAFuJ3onYgfv4D3MYQInf0duLGXMI
0evR69Hr0euA5w852HTiKfB0HlOKXg23APfjv0gAAQa+fJZISPfjA0b+EPLoHwDru+oAAAAJ
vkZ9uA0OuwcAzRCshMB1+TDkzRbNGTHSUlADRhwTVh6LXhj38ynTOfN2AonzQonRmfd2GojW
hujQzNDMAOEp+IPgf3QEOdh2AZNQiftRsQXT41mOwzHbilYktALNE3KgW1haAdgQ8gHfKd51
q8MKRXJyb3IgRXhlY3V0aW5nIEZBVDEyIGJvb3RzZWN0b3INClByZXNzIGFueSBrZXkgdG8g
cmVib290DQoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAExPQURFUiAgQklOVao=

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="BOOT12.ASM"

; boot12.asm  FAT12 bootstrap for real mode image or loader
; Version 1.0, Jul 5, 1999
; Sample code
; by John S. Fine  johnfine@erols.com
; I do not place any restrictions on your use of this source code
; I do not provide any warranty of the correctness of this source code
;_____________________________________________________________________________
;
; Documentation:
;
; I)    BASIC features
; II)   Compiling and installing
; III)  Detailed features and limits
; IV)   Customization
;_____________________________________________________________________________
;
; I)    BASIC features
;
;    This boot sector will load and start a real mode image from a file in the
; root directory of a FAT12 formatted floppy or partition.
;
;    Inputs:
; DL = drive number
;
;    Outputs:
; The boot record is left in memory at 7C00 and the drive number is patched
; into the boot record at 7C24.
; SS = DS = 0
; BP = 7C00
;_____________________________________________________________________________
;
; II)   Compiling and installing
;
;  To compile, use NASM
;
;  nasm boot12.asm -o boot12.bin
;
;  Then you must copy the first three bytes of BOOT12.BIN to the first three
;  bytes of the volume and copy bytes 0x3E through 0x1FF of BOOT12.BIN to
;  bytes 0x3E through 0x1FF of the volume.  Bytes 0x3 through 0x3D of the
;  volume should be set by a FAT12 format program and should not be modified
;  when copying boot12.bin to the volume.
;
;  If you use my PARTCOPY program to install BOOT12.BIN on A:, the
;  commands are:
;
;  partcopy boot12.bin 0 3 -f0
;  partcopy boot12.bin 3e 1c2 -f0 3e
;
;  PARTCOPY can also install to a partition on a hard drive.  Please read
;  partcopy documentation and use it carefully.  Careless use could overwrite
;  important parts of your hard drive.
;
;  You can find PARTCOPY and links to NASM on my web page at
;  http://www.erols.com/johnfine/
;_____________________________________________________________________________
;
; III)  Detailed features and limits
;
;   Most of the limits are stable characteristics of the volume.  If you are
; using boot12 in a personal project, you should check the limits before
; installing boot12.  If you are using boot12 in a project for general
; distribution, you should include an installation program which checks the
; limits automatically.
;
; CPU:  Supports any 8088+ CPU.
;
; Volume format:  Supports only FAT12.
;
; Sector size:  Supports only 512 bytes per sector.
;
; Drive/Partition:  Supports whole drive or any partition of any drive number
; supported by INT 13h.
;
; Diskette parameter table:  This code does not patch the diskette parameter
; table.  If you boot this code from a diskette that has more sectors per
; track than the default initialized by the BIOS then the failure to patch
; that table may be a problem.  Because this code splits at track boundaries
; a diskette with fewer sectors per track should not be a problem.
;
; File position:  The file name may be anywhere in the root directory and the
; file may be any collection of clusters on the volume.  There are no
; contiguity requirements.  (But see track limit).
;
; Track boundaries:  Transfers are split on track boundaries.  Many BIOS's
; require that the caller split floppy transfers on track boundaries.
;
; 64Kb boundaries:  Transfers are split on 64Kb boundaries.  Many BIOS's
; require that the caller split floppy transfers on track boundaries.
;
; Cluster boundaries:  Transfers are merged across cluster boundaries whenever
; possible.  On some systems, this significantly reduces load time.
;
; Cluster 2 limit:  Cluster 2 must start before sector 65536 of the volume.
; This is very likely because only the reserved sectors (usually 1) and
; the FAT's (two of up to 12 sectors each) and the root directory (usually
; either 15 or 32 sectors) precede cluster 2.
;
; Track limit:  The entire image file must reside before track 32768 of the
; entire volume.  This is true on most media up to 1GB in size.  If it is a
; problem it is easy to fix (see boot16.asm).  I didn't expect many people
; to put FAT12 partitions beyond the first GB of a large hard drive.
;
; Memory boundaries:  The FAT, Root directory, and Image must all be loaded
; starting at addresses that are multiples of 512 bytes (32 paragraphs).
;
; Memory use:  The FAT and Root directory must each fit entirely in the
; first 64Kb of RAM.  They may overlap.
;
; Root directory size:  As released, it supports up to 928 entries in the
; root directory.  If ROOT_SEG were changed to 0x7E0 it would support up
; to 1040.  Most FAT12 volumes have either 240 or 512 root directory
; entries.
;_____________________________________________________________________________
;
; IV)   Customization
;
;   The memory usage can be customized by changing the _SEG variables (see
; directly below).
;
;   The file name to be loaded and the message displayed in case of error
; may be customized (see end of this file).
;
;   The ouput values may be customized.  For example, many loaders expect the
; bootsector to leave the drive number in DL.  You could add "mov dl,[drive]"
; at the label "eof:".
;
;   Some limits (like maximum track) may be removed.  See boot16.asm for
; comparison.
;
;   Change whatever else you like.  The above are just likely possibilities.
;_____________________________________________________________________________


; Change the _SEG values to customize memory use during the boot.
; When planning memory use, remember:
;
; *)  Each of ROOT_SEG, FAT_SEG, and IMAGE_SEG must be divisible by 0x20
;
; *)  None of ROOT, FAT or IMAGE should overlap the boot code itself, or
;     its stack.  That means: avoid paragraphs 0x7B0 to 0x7DF.
;
; *)  The FAT area must not overlap the IMAGE area.  Either may overlap
;     the ROOT area;  But, if they do then the root will not remain in
;     memory for possible reuse by the next stage.
;
; *)  The FAT area and the root area must each fit within the first 64Kb
;     excluding BIOS area (paragraphs 0x60 to 0xFFF).
;
; *)  A FAT12 FAT can be up to 6Kb (0x180 paragraphs).
;
; *)  A FAT12 root directory is typically either 0x1E0 or 0x400 paragraphs
;     long, but larger sizes are possible.
;
; *)  The code will be two bytes shorter when FAT_SEG is 0x800 than when it
;     is another value.  (If you reach the point of caring about two bytes).
;
%define ROOT_SEG	0x60
%define FAT_SEG		0x800
%define IMAGE_SEG	0x900

%if ROOT_SEG & 31
  %error "ROOT_SEG must be divisible by 0x20"
%endif
%if ROOT_SEG > 0xC00
  %error "Root directory must fit within first 64Kb"
%endif
%if FAT_SEG & 31
  %error "FAT_SEG must be divisible by 0x20"
%endif
%if FAT_SEG > 0xE80
  %error "FAT must fit within first 64Kb"
%endif
%if IMAGE_SEG & 31
  %error "IMAGE_SEG must be divisible by 0x20"
%endif

; The following %define directives declare the parts of the FAT12 "DOS BOOT
; RECORD" that are used by this code, based on BP being set to 7C00.
;
%define	sc_p_clu	bp+0Dh		;byte  Sectors per cluster
%define	sc_b4_fat	bp+0Eh		;word  Sectors (in partition) before FAT
%define	fats		bp+10h		;byte  Number of FATs
%define dir_ent		bp+11h		;word  Number of root directory entries
%define	sc_p_fat	bp+16h		;word  Sectors per FAT
%define sc_p_trk	bp+18h		;word  Sectors per track
%define heads		bp+1Ah		;word  Number of heads
%define sc_b4_prt	bp+1Ch		;dword Sectors before partition
%define drive		bp+24h		;byte  Drive number

	org	0x7C00

entry:
	jmp	short begin
	nop

; Skip over the data portion of the "DOS BOOT RECORD".  The install method
; must merge the code from this ASM with the data put in the boot record
; by the FAT12 formatter.
;
	times 0x3B db 0

begin:
	xor	ax, ax
	mov	ds, ax
	mov	ss, ax
	mov	sp, 0x7C00
	mov	bp, sp
	mov	[drive], dl	;Drive number

	mov	al, [fats]	;Number of FATs
	mul	word [sc_p_fat]	; * Sectors per FAT
	add	ax, [sc_b4_fat]	; + Sectors before FAT
				;AX = Sector of Root directory

	mov	si, [dir_ent]	;Max root directory entries
	mov	cl, 4
	dec	si
	shr	si, cl
	inc	si		;SI = Length of root in sectors

	mov	di, ROOT_SEG/32	;Buffer (paragraph / 32)
	call	read_16		;Read root directory
	push	ax		;Sector of cluster two
%define sc_clu2 bp-2		;Later access to the word just pushed is via bp

	mov	dx, [dir_ent]	;Number of directory entries
	push	ds
	pop	es
	mov	di, ROOT_SEG*16

search:
	dec	dx		;Any more directory entries?
	js	error		;No
	mov	si, filename	;Name we are searching for
	mov	cx, 11		;11 characters long
	lea	ax, [di+0x20]	;Precompute next entry address
	push	ax
	repe cmpsb		;Compare
	pop	di
	jnz	search		;Repeat until match

	push word [di-6]	;Starting cluster number

	mov	ax, [sc_b4_fat]	;Sector number of FAT
	mov	si, [sc_p_fat]	;Length of FAT
	mov	di, FAT_SEG/32	;Buffer (paragraph / 32)
	call	read_16		;Read FAT

next:
	pop	bx		;Cluster number
	mov	si, bx		;First cluster in this sequence
	mov	ax, bx		;Last cluster in this sequence

.0:
	cmp	bx, 0xFF8	;End of file?
	jae	.2		; Yes
	inc	ax		;Last cluster plus one in sequence

	;Look in FAT for next cluster
	mov	di, bx		;Cluster number
	rcr	bx, 1		;1.5 byte entry per cluster
				;bx = 0x8000 + cluster/2
				;c-bit set for odd clusters

	mov	bx, [bx+di+FAT_SEG*16-0x8000]
	jnc	.1
	shr	bx, 1
	shr	bx, 1
	shr	bx, 1
	shr	bx, 1
.1:	and	bh, 0xF

	cmp	ax, bx		;Is the next one contiguous?
	je	.0		;Yes: look further ahead
.2:	sub	ax, si		;How many contiguous in this sequence?
	jz	eof		;None, must be done.

	push	bx		;Save next (eof or discontiguous) cluster
	
	mov	bl, [sc_p_clu]	;Sectors per cluster
	mov	bh, 0		;  as a word
	mul	bx		;Length of sequence in sectors
.3:	mov	di, IMAGE_SEG/32 ;Destination (paragraph / 32)
	add	[.3+1], ax	 ;Precompute next destination
	xchg	ax, si		;AX = starting cluster ;SI = length in sectors
	dec	ax
	dec	ax		;Starting cluster minus two
	mul	bx		; * sectors per cluster
	add	ax, [sc_clu2]	; + sector number of cluster two
	adc	dl, dh		;Allow 24-bit result

	call	read_32		;Read it
	jmp	short next	;Look for more

eof:
	jmp	IMAGE_SEG:0

error:	mov	si, errmsg	;Same message for all detected errors
	mov	ax, 0xE0D	;Start message with CR
	mov	bx, 7
.1:	int	10h
	lodsb
	test	al, al
	jnz	.1
	xor	ah, ah
	int	16h		;Wait for a key
	int	19h		;Try to reboot

read_16:
	xor	dx, dx

read_32:
;
; Input:
;    dx:ax = sector within partition
;    si    = sector count
;    di    = destination segment / 32
;
; The sector number is converted from a partition-relative to a whole-disk
; (LBN) value, and then converted to CHS form, and then the sectors are read
; into (di*32):0.
;
; Output:
;    dx:ax  updated (sector count added)
;    di     updated (sector count added)
;    si = 0
;    bp, ds preserved
;    bx, cx, es modified

.1:	push	dx			;(high) relative sector
	push	ax			;(low) relative sector

	add	ax, [sc_b4_prt]		;Convert to LBN
	adc	dx, [sc_b4_prt+2]

	mov	bx, [sc_p_trk]		;Sectors per track
	div	bx			;AX = track ;DX = sector-1
	sub	bx, dx			;Sectors remaining, this track
	cmp	bx, si			;More than we want?
	jbe	.2			;No
	mov	bx, si			;Yes: Transfer just what we want
.2:	inc	dx			;Sector number
	mov	cx, dx			;CL = sector ;CH = 0
	cwd				;(This supports up to 32767 tracks
	div	word [heads]		;Track number / Number of heads
	mov	dh, dl			;DH = head

	xchg	ch, al			;CH = (low) cylinder  ;AL=0
	ror	ah, 1			;rotate (high) cylinder
	ror	ah, 1
	add	cl, ah			;CL = combine: sector, (high) cylinder

	sub	ax, di
	and	ax, byte 0x7F		;AX = sectors to next 64Kb boundary
	jz	.3			;On a 64Kb boundary already
	cmp	ax, bx			;More than we want?
	jbe	.4			;No
.3:	xchg	ax, bx			;Yes: Transfer just what we want
.4:	push	ax			;Save length
	mov	bx, di			;Compute destination seg
	push	cx
	mov	cl, 5
	shl	bx, cl
	pop	cx
	mov	es, bx
	xor	bx, bx			;ES:BX = address
	mov	dl, [drive]		;DL = Drive number
	mov	ah, 2			;AH = Read command
	int	13h			;Do it
	jc	error
	pop	bx			;Length
	pop	ax			;(low) relative sector
	pop	dx			;(high) relative sector
	add	ax, bx			;Update relative sector
	adc	dl, dh
	add	di, bx			;Update destination
	sub	si, bx			;Update count
	jnz	.1			;Read some more
	ret

errmsg	db	10,"Error Executing FAT12 bootsector",13
	db	10,"Press any key to reboot",13,10,0

size	equ	$ - entry
%if size+11+2 > 512
  %error "code is too large for boot sector"
%endif
	times	(512 - size - 11 - 2) db 0

filename db	"LOADER  BIN"		;11 byte name
	db	0x55, 0xAA		;2  byte boot signature

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="tiny.txt"

The smallest pmode + C program I could write is shown below,
in three files. I compiled with GCC, not GPP, and got no
warnings.

This code doesn't check for a 32-bit CPU or V86 mode. If you
try to run it inside a DOS box, Windows will kill it.

load.asm is assembled to aout format instead of COFF, because
DJGPP COFF doesn't let you mix 16- and 32-bit code.

;/****************************************************************************
;       file load.asm
;****************************************************************************/
[SECTION .text]
[BITS 16]
[GLOBAL start]
start:  xor ebx,ebx             ; now in real mode (16-bit)
	mov bx,cs
	shl ebx,4
	mov eax,ebx		; EAX=EBX=CS<<4
	lea eax,[ebx]
	mov [gdt2 + 2],ax	; set descriptor base address=EAX
	mov [gdt3 + 2],ax
	shr eax,16
	mov [gdt2 + 4],al
	mov [gdt3 + 4],al
	mov [gdt2 + 7],ah
	mov [gdt3 + 7],ah
	lea eax,[ebx + gdt]	; point gdt_ptr to the gdt
	mov [gdt_ptr + 2],eax	; EAX=linear address of gdt
	push dword 0		; zero EFLAGS (interrupts off,
	popfd			;  IOPL=0, NT bit=0)
	lgdt [gdt_ptr]
	mov eax,cr0
	or al,1
	mov cr0,eax
	jmp SYS_CODE_SEL:do_pm
[BITS 32]
do_pm:  mov ax,SYS_DATA_SEL     ; now in 32-bit pmode
	mov ds,eax		; EAX works, one byte smaller :)
	mov ss,eax
        nop
	mov es,eax
	mov fs,eax
	mov gs,eax
	xor eax,eax		; zero top 16 bits of ESP
	mov ax,sp
	mov esp,eax
[EXTERN _main]
	call _main		; call C code
	jmp $			; freeze

[SECTION .data]
; null descriptor
gdt:	dw 0			; limit 15:0
	dw 0			; base 15:0
	db 0			; base 23:16
	db 0			; type
	db 0			; limit 19:16, flags
	db 0			; base 31:24
; linear data segment descriptor
LINEAR_SEL	equ	$-gdt
        dw 0xFFFF               ; limit 0xFFFFF (1 meg? 4 gig?)
	dw 0			; base for this one is always 0
	db 0
	db 0x92			; present,ring 0,data,expand-up,writable
        db 0xCF                 ; page-granular (4 gig limit), 32-bit
	db 0
; code segment descriptor
SYS_CODE_SEL	equ	$-gdt
gdt2:	dw 0xFFFF
	dw 0			; (base gets set above)
	db 0
	db 0x9A			; present,ring 0,code,non-conforming,readable
	db 0xCF
	db 0
; data segment descriptor
SYS_DATA_SEL	equ	$-gdt
gdt3:	dw 0xFFFF
	dw 0			; (base gets set above)
	db 0
	db 0x92			; present,ring 0,data,expand-up,writable
	db 0xCF
	db 0
gdt_end:

gdt_ptr:
	dw gdt_end - gdt - 1	; GDT limit
	dd gdt			; linear, physical address of GDT

;/****************************************************************************
;       file hello.c
;****************************************************************************/
#include <string.h> /* movedata() */

#define	LINEAR_SEL	0x08
#define	SYS_DATA_SEL	0x18

int main(void)
{
	const char Msg[] = "h e l l o ";

	movedata(SYS_DATA_SEL, (unsigned)Msg,
		LINEAR_SEL, 0xB8000,
		sizeof(Msg));
	return 0;
}

;/****************************************************************************
;	file build.bat
;*****************************************************************************/
nasm -f aout -o load.o load.asm
gcc -c -O2 -Wall -g -o hello.o hello.c
ld -o pm.com -oformat binary -Ttext=0x100 load.o hello.o /djgpp/lib/libc.a


--45Z9DzgjV8m4Oswq--
