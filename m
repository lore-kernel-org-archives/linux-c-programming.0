From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Hex editor.
Date: Mon, 14 Feb 2005 10:23:32 -0500
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA363F@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Fabio wrote:

>I would like to know how a developer can view .dat files or data stored in
>non-text files.

There are the old standbys - od (octal dump) and hexdump.  These should be 
included with every Linux distribution, check the man pages for info on 
how to use them.

In addition, I have always found the ht editor (http://hte.sourceforge.net/)
to be very useful.  In addition to viewing a binary file, you can edit the 
file as well, view the various sections in an ELF, and it does perform a 
disassembly of executables.

>Let's say a developer store struct's on a binary file called foo.dat.
>Another developer want to find out what is the structure and dont have the
>source code, how can he analize the foo.dat file? What tools do you guys
>know that work on solaris sparc by the way???

Lots of trial and error, good guesses and the such.  For example consider 
the simple structure,

struct test
{
    short   x;
    short   y;
    int     z:
}

if this structure were initialized to x=15, y=20 and z=35 (and assuming a little
endian machine) the binary file *could* look like (using hex),

0x0E 0x00 0x14 0x00 0x23 0x00 0x00 0x00 

However, the following structure could also produce the above values,

struct test1
{
   int    x1;
   short  y1;
   short  z1:
}

when it is initialized to x1=1310734, y1 = 32 and z1 = 0.  Doing an analysis like
it is particular useful if you can control the output in some way.  For example
run the program with known inputs and see what the output is.  This will allow to 
make some guesses about the structure.  Now come up with test cases to test your
guesses, and use the results to refine your guesses.

>Another question a bit related to this. On unix like systems, what tools
>beside gdb and truss (strace) do a developer have to know what is a
>program doing?

A recent Linux Journal had a list of the top-ten tools that a developer should
know about (Linux Journal Sept 2004.)  The list is:

 1. ctags
 2. strace
 3. fuser
 4. ps
 5. time
 6. nm  (and ldd)
 7. strings
 8. od and xxd
 9. file
10. objdump

hope this helps.
George



