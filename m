From: David Wuertele <dave-gnus@bfnet.com>
Subject: Re: Why does linking a.so with b.so require execs to be linked both
 -la and -lb?
Date: Mon, 11 Aug 2003 17:10:24 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <m3vft320sv.fsf@bfnet.com>
References: <m3k79jj4av.fsf@bfnet.com> <tmml01xphg.ln2@thune.mrc-home.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

I asked my friend, who is a windows programmer, whether windows had
the same behavior.  He said absolutely not, and generated this test.
His test is even more interesting than mine.  It does the following:

1.  build two libraries libA and libB.  libA has one function that
    calls a function in libB.
2.  link libA and libB
3.  Erase libB
4.  link a program that uses A's function with libA --- WITHOUT HAVING
    ACCESS TO libB!

Why can't we do this on Linux?

Here's the windows demonstration:


C:\libtest>REM -- build.bat - build dynamic linking test 

C:\libtest>REM -- clean all output files and do a dir 

C:\libtest>erase libB.obj libB.dll libB.exp libB.lib  

C:\libtest>erase libA.obj libA.dll libA.exp libA.lib  

C:\libtest>erase prog.obj prog.exe 

C:\libtest>dir
 Volume in drive C is SilverBox
 Volume Serial Number is BCEE-2C23

 Directory of C:\libtest

08/11/2003  04:09 PM    <DIR>          .
08/11/2003  04:09 PM    <DIR>          ..
08/11/2003  04:07 PM             1,437 build.bat
08/11/2003  03:33 PM               159 libA.c
08/11/2003  03:33 PM                65 libA.h
08/11/2003  03:33 PM               112 libB.c
08/11/2003  03:33 PM                65 libB.h
08/11/2003  03:45 PM               202 prog.c
               6 File(s)          2,040 bytes
               2 Dir(s)  40,561,799,168 bytes free

C:\libtest>REM -- cat the contents of the files 

C:\libtest>type libA.h 
// FILE: libA.h

extern __declspec(dllimport) void libA_func();
C:\libtest>type libA.c 
// FILE: libA.c

#include "libB.h"

extern __declspec(dllexport) void libA_func()
{
    printf("libA_func() calling libB_func()\n");
    libB_func();
}
C:\libtest>type libB.h 
// FILE: libB.h

extern __declspec(dllimport) void libB_func();
C:\libtest>type libB.c 
// FILE: libB.c

extern __declspec(dllexport) void libB_func()
{
    printf("libB_func() executing()\n");
}
C:\libtest>type prog.c 
#include <stdio.h>
#include "libA.h"

int main(int argc, const char ** argv)
{
    printf("prog.exe calling libA_func()\n");
    libA_func();
    printf("prog.exe exiting\n");
    return 0;
}

C:\libtest>REM -- compile and link libB.c to libB.dll 

C:\libtest>cl -c libB.c 
libB.c

C:\libtest>link libB.obj /dll /out:"libB.dll" /implib:"libB.lib" 
Microsoft (R) Incremental Linker Version 6.00.8447
Copyright (C) Microsoft Corp 1992-1998. All rights reserved.

   Creating library libB.lib and object libB.exp

C:\libtest>REM -- compile and link libA.c to libA.dll doing 

C:\libtest>REM -- the "-lB" equivalent 

C:\libtest>cl -c libA.c 
libA.c

C:\libtest>link libA.obj libB.lib /dll /out:"libA.dll" /implib:"libA.lib" 
Microsoft (R) Incremental Linker Version 6.00.8447
Copyright (C) Microsoft Corp 1992-1998. All rights reserved.

   Creating library libA.lib and object libA.exp

C:\libtest>REM -- erase all of the libB output files to prove that linking 

C:\libtest>REM -- prog.c doesn't depend on libB. 

C:\libtest>erase libB.obj libB.dll libB.exp libB.lib  

C:\libtest>REM -- for good measure erase all of libA's output files except 

C:\libtest>REM -- the export library and the dll 

C:\libtest>erase  libA.obj libA.exp 

C:\libtest>REM -- do another dir so we can see what's in our directory now 

C:\libtest>dir
 Volume in drive C is SilverBox
 Volume Serial Number is BCEE-2C23

 Directory of C:\libtest

08/11/2003  04:09 PM    <DIR>          .
08/11/2003  04:09 PM    <DIR>          ..
08/11/2003  04:07 PM             1,437 build.bat
08/11/2003  03:33 PM               159 libA.c
08/11/2003  04:09 PM            45,056 libA.dll
08/11/2003  03:33 PM                65 libA.h
08/11/2003  04:09 PM             1,896 libA.lib
08/11/2003  03:33 PM               112 libB.c
08/11/2003  03:33 PM                65 libB.h
08/11/2003  03:45 PM               202 prog.c
               8 File(s)         48,992 bytes
               2 Dir(s)  40,561,750,016 bytes free

C:\libtest>REM -- compile prog.c into prog.exe 

C:\libtest>cl prog.c libA.lib 
prog.c
Microsoft (R) Incremental Linker Version 6.00.8447
Copyright (C) Microsoft Corp 1992-1998. All rights reserved.

/out:prog.exe 
prog.obj 
libA.lib 

C:\libtest>REM -- now that prog.exe has built, re-compile and link 

C:\libtest>REM -- libB so that prog.exe will run 

C:\libtest>cl -c libB.c 
libB.c

C:\libtest>link libB.obj /dll /out:"libB.dll" /implib:"libB.lib" 
Microsoft (R) Incremental Linker Version 6.00.8447
Copyright (C) Microsoft Corp 1992-1998. All rights reserved.

   Creating library libB.lib and object libB.exp

C:\libtest>REM -- let's delete all output files again and do a dir 

C:\libtest>erase libB.obj libB.exp libB.lib  

C:\libtest>erase libA.obj libA.exp libA.lib  

C:\libtest>erase prog.obj 

C:\libtest>dir
 Volume in drive C is SilverBox
 Volume Serial Number is BCEE-2C23

 Directory of C:\libtest

08/11/2003  04:09 PM    <DIR>          .
08/11/2003  04:09 PM    <DIR>          ..
08/11/2003  04:07 PM             1,437 build.bat
08/11/2003  03:33 PM               159 libA.c
08/11/2003  04:09 PM            45,056 libA.dll
08/11/2003  03:33 PM                65 libA.h
08/11/2003  03:33 PM               112 libB.c
08/11/2003  04:09 PM            45,056 libB.dll
08/11/2003  03:33 PM                65 libB.h
08/11/2003  03:45 PM               202 prog.c
08/11/2003  04:09 PM            40,960 prog.exe
               9 File(s)        133,112 bytes
               2 Dir(s)  40,561,664,000 bytes free

C:\libtest>REM -- NOW FINALLY LET'S RUN THE PROGRAM! 

C:\libtest>prog.exe
prog.exe calling libA_func()
libA_func() calling libB_func()
libB_func() executing()
prog.exe exiting

C:\libtest>REM

C:\libtest>REM

C:\libtest>REM

C:\libtest>REM -- and let's type this file 

C:\libtest>type build.bat 
	REM -- build.bat - build dynamic linking test
	REM -- clean all output files and do a dir
erase libB.obj libB.dll libB.exp libB.lib 
erase libA.obj libA.dll libA.exp libA.lib 
erase prog.obj prog.exe
dir
	REM -- cat the contents of the files
type libA.h
type libA.c
type libB.h
type libB.c
type prog.c
	REM -- compile and link libB.c to libB.dll
cl -c libB.c
link libB.obj /dll /out:"libB.dll" /implib:"libB.lib"
	REM -- compile and link libA.c to libA.dll doing
	REM -- the "-lB" equivalent
cl -c libA.c
link libA.obj libB.lib /dll /out:"libA.dll" /implib:"libA.lib"
	REM -- erase all of the libB output files to prove that linking
	REM -- prog.c doesn't depend on libB.
erase libB.obj libB.dll libB.exp libB.lib 
	REM -- for good measure erase all of libA's output files except
	REM -- the export library and the dll
erase  libA.obj libA.exp
	REM -- do another dir so we can see what's in our directory now
dir
	REM -- compile prog.c into prog.exe
cl prog.c libA.lib
	REM -- now that prog.exe has built, re-compile and link
	REM -- libB so that prog.exe will run
cl -c libB.c
link libB.obj /dll /out:"libB.dll" /implib:"libB.lib"
	REM -- let's delete all output files again and do a dir
erase libB.obj libB.exp libB.lib 
erase libA.obj libA.exp libA.lib 
erase prog.obj
dir
	REM -- NOW FINALLY LET'S RUN THE PROGRAM!
prog.exe
	REM
	REM
	REM
	REM -- and let's type this file
type build.bat

