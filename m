From: "John T. Williams" <jtwilliams@vt.edu>
Subject: linking at run time.
Date: Thu, 10 Jul 2003 02:50:48 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <003501c346c8$d32cd4c0$ed64a8c0@descartes>
References: <00be01c34553$57ea97a0$caba0ba4@uwe.ac.uk> <16138.54505.701672.164306@cerise.nosuchdomain.co.uk> <012101c3462f$ec43a810$caba0ba4@uwe.ac.uk> <16140.52121.385331.351810@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Is there a way to cause an exicutable to link against a specific library at
run time.

let me explain a little
I'm creating a dynamic library like this

$ gcc pop3.c -o libpop3.so -shared  -I../include

then creating an exicutable like this

$ gcc main.c -o getmail -L../lib -I../include -lpop3

both work fine.

in order to run my exicutable I have been copying my libpop3.so file to
/use/lib
then running ldconfig

and the file exicutes fine.  but its a bit of a pain in the butt to do this
every time I recompile the library.

I was wondering if there was any way to run my program, getmail, so that ldd
would link it against a specified file so that I didn't have to put a
library that I'm developing into my /usr/lib folder.  nor have to run
ldconfig as root.

I hope this makes sense.


