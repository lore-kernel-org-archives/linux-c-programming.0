From: sheetal fegde <sheetalfegde@yahoo.com>
Subject: RedHat Itanium 64 GCC 3.2.3 linking problems
Date: Wed, 15 Sep 2004 01:33:40 -0700 (PDT)
Sender: gcc-help-owner@gcc.gnu.org
Message-ID: <20040915083340.19367.qmail@web52710.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <gcc-help-return-17896-gcc-help=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gcc-help@gcc.gnu.org
Cc: linux-c-programming@vger.kernel.org

Hi,

I am facing some problem while linking using gcc-3.2.3

Machine Information
RedHat  IA64
Linux  2.4.21-4.EL #1 SMP Fri Oct 3 17:29:39 EDT 2003
ia64 ia64 ia64 GNU/Linux

g++/gcc information
> gcc -v
 Reading specs from
/usr/lib/gcc-lib/ia64-redhat-linux/3.2.3/specs
 Configured with: ../configure --prefix=/usr
--mandir=/usr/share/man --infodir=/usr/share/info
--enable-shared --enable-threads=posix
--disable-checking --with-system-zlib --
enable-__cxa_atexit --host=ia64-redhat-linux
 Thread model: posix
 gcc version 3.2.3 20030502 (Red Hat Linux 3.2.3-20)

>g++- v
Reading specs from
/usr/lib/gcc-lib/ia64-redhat-linux/3.2.3/specs
Configured with: ../configure --prefix=/usr
--mandir=/usr/share/man --infodir=/usr/share/info
--enable-shared --enable-threads=posix
--disable-checking --with-system-zlib
--enable-__cxa_atexit --host=ia64-redhat-linux
Thread model: posix
gcc version 3.2.3 20030502 (Red Hat Linux 3.2.3-20)


I am trying to build some application with oracle oci,
while linking I am getting following errors.
I feel there is no worng with my code as it works with
gcc 2.96, when i try with 3.2.3 it gives following
problems..

gcc  -c -g -Wno-deprecated -DROGUE6 -DRW_MLS_LIBRARY
-DUSE_SOURCEPRO
-D_RWCONFIG_LINUXGCC323K2421DEBUG_NtvSTL_NoThr_64bit_sd
-DFULL_ORACLE8OCI -DOBT -DREMOTE_HOST_BACKUP -DLINUX
-DDEBUGIO -D_GNU_SOURCE -D__LP64__   -I../oracle/mml 
-o /usr/oracle/OBTBld/obj/obacktrack/lib/mmlIO.o 
../oracle/mml/mmlIO.c 

DtCSharedArchive
/usr/oracle/OBTBld/obj/obacktrack/lib/libobk.so 

#	g++  -Xlinker -G  -static -g  -o 
/usr/oracle/OBTBld/obj/obacktrack/lib/libobk.so 
/usr/oracle/OBTBld/obj/obacktrack/lib/mml.o
/usr/oracle/OBTBld/obj/obacktrack/lib/mmlChlCommn.o
/usr/oracle/OBTBld/obj/obacktrack/lib/mmlIO.o  ;
	g++  -Xlinker -G   -o 
/usr/oracle/OBTBld/obj/obacktrack/lib/libobk.so 
/usr/oracle/OBTBld/obj/obacktrack/lib/mml.o
/usr/oracle/OBTBld/obj/obacktrack/lib/mmlChlCommn.o
/usr/oracle/OBTBld/obj/obacktrack/lib/mmlIO.o  ;

/usr/lib/libc_nonshared.a(elf-init.oS)(.text+0x31): In
function `__libc_csu_init':
: undefined reference to `__init_array_start'
/usr/lib/libc_nonshared.a(elf-init.oS)(.text+0x32): In
function `__libc_csu_init':
: undefined reference to `__init_array_end'
/usr/lib/libc_nonshared.a(elf-init.oS)(.text+0x40): In
function `__libc_csu_init':
: undefined reference to `__init_array_start'
/usr/lib/libc_nonshared.a(elf-init.oS)(.text+0x41): In
function `__libc_csu_init':
: undefined reference to `__init_array_end'
/usr/lib/libc_nonshared.a(elf-init.oS)(.text+0xd1): In
function `__libc_csu_fini':
: undefined reference to `__fini_array_start'
/usr/lib/libc_nonshared.a(elf-init.oS)(.text+0xe0): In
function `__libc_csu_fini':
: undefined reference to `__fini_array_end'
/usr/lib/libc_nonshared.a(elf-init.oS)(.text+0xf0): In
function `__libc_csu_fini':
: undefined reference to `__fini_array_start'
/usr/lib/libc_nonshared.a(elf-init.oS)(.text+0xf1): In
function `__libc_csu_fini':
: undefined reference to `__fini_array_end'
/usr/bin/ld:
/usr/oracle/OBTBld/obj/obacktrack/lib/libobk.so:
hidden symbol `__fini_array_end' isn't defined
collect2: ld returned 1 exit status

What is going wrong? I feel this some problem in
glibc.
can somebody help me on this.
Thanks,
Sheetal.



		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail
