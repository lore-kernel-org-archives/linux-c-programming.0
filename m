From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: c++ compiling problem. undefined reference to main
Date: Tue, 6 Apr 2004 17:13:52 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <33120BB62E0A7643AE75E2B03CA0EDA08E3A0B@mail7.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org



-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of srg
Sent: Tuesday, April 06, 2004 4:44 PM
To: linux-c-programming@vger.kernel.org
Subject: c++ compiling problem. undefined reference to main


Hello:

We have a problem compiling c++ code.
At the bottom of this message you can see the compiler error.

Here are the details:

[snip....]

># cat hello.cpp
>#include <iostream>

>using namespace std;

>int main(int argc,char** argv)
>{
>   cout << "hello" << endl;
>}
># g++ -o hello hello.cpp
># ./hello
>hello

>At this point all is OK, now comes the problem:

as it should be, you have coded, compiled and linked
a simple executable.

># cat cj_enteros.hpp

>#ifndef _CJ_ENTEROS_HPP_
>#define _CJ_ENTEROS_HPP_

>#include <iostream>

[snip....]


># g++ -o cj_enteros cj_enteros.cpp
>/usr/lib/gcc-lib/i486-linux/3.3.3/../../../crt1.o(.text+0x18): In 
>function `_start':
>../sysdeps/i386/elf/start.S:98: undefined reference to `main'
>collect2: ld returned 1 exit status

again, all is as it should be.  Remember that all executables must define
an entry point -- i.e. int main(int, char**).  When the program is linked
it is arranged that the C startup code calls this function and you program
begins executing.  There is no entry point defined in cj_enteros.cpp and 
thus you get the error.  A hint to this is to notice where the error was
generated (in this case it was from the linker/loader - ld).  Try this:

1) execute this command:
   g++ -c cj_enteros.cpp -o cj_enteros.o

   this will produce an object file (cj_enteros.o) but not attempt to link
   the file.

2) now create a new cpp file `test_enteros.cpp', in the same directory that 
   contains the cj_enteros.[cpp|h] files, that contains the following:

   #include <iostream>

   using namespace std;

   int main(int argc,char** argv)
   {
      cj_enteros     cls;
   }

   and try to compile it using the following command:

   g++ test_enteros.cpp -o test_enteros

   this command should fail, furthermore if you look at the errors you will
   see that it is failing in the compilation phase.  Basically this is
telling
   you that the compiler does not know what cj_enteros is.  Now to the test 
   file add the following line:

   #include "enteros.h"

   immediately after the inclusion of iostream, and try to compile it again
   using this command:

   g++ test_enteros.cpp -o test_enteros

   this command will also fail (you should compare the differences between
the
   two outputs).  This command will now fail in the linker with an
unresolved
   reference (as I recall the error).  What has happened, is that the
#include 
   file has provided enough information to the C++ compiler to be able to
perform 
   type checking on the class however no implementation of the class and its

   functions have been provided.

   Finally, try the following series of command:

   g++ -c cj_enteros.cpp -o cj_enteros.o
   g++ test_enteros.coo cj_enteros.o -o test_enteros

   Now, these two commands should execute correctly producting the
executable.

Hope this helps,

George
