From: Hareesh Nagarajan <hareesh.nagarajan@gmail.com>
Subject: Mysterious GDB Error!
Date: Fri, 11 Feb 2005 01:28:34 -0600
Message-ID: <7728232c05021023285bbb6c92@mail.gmail.com>
Reply-To: Hareesh Nagarajan <hareesh.nagarajan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

I've written this simple piece of code that uses STL strings in C++
(appears below). Now when I run GDB I get the following:

1. warning: Unable to find dynamic linker breakpoint function.
GDB will be unable to debug shared library initializers
and track explicitly loaded dynamic code.

2. The program being debugged stopped while in a function called from GDB.
When the function (std::string::at(unsigned) const) is done executing,
GDB will silently stop (instead of continuing to evaluate the
expression containing the function call).

Why on earth am I getting the second message? I am not able call the
member functions of any container.

My specs:
Athlon Processor
2.6.9-gentoo-r1
Gentoo 2004.3 (stage3 install)
GDB was emerged from source.

How can I set gdb straight? Do I need to re-emerge something.

Thanks,

Hareesh
PS: The code and the GDB output follow.

<code>
#include <string>
#include <iostream>
using namespace std;

int main(void)
{
	string s("hello");
	char x;
	
	cout << s.at(3);
	x = s.at(3);
	return 0;
}
</code>

<gdb>

hareesh: 1/ $ gdb ./a.out 
GNU gdb 6.0
Copyright 2003 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "i686-pc-linux-gnu"...Using host
libthread_db library
 "/lib/libthread_db.so.1".

(gdb) l
1       #include <string>
2       #include <iostream>
3       using namespace std;
4       
5       int main(void)
6       {
7               string s("hello");
8               char x;
9               
10              cout << s.at(3);
(gdb) b 9
Breakpoint 1 at 0x80488a6: file x.cc, line 9.
(gdb) r
Starting program: /home/hareesh/courses/485/1/a.out 
warning: Unable to find dynamic linker breakpoint function.
GDB will be unable to debug shared library initializers
and track explicitly loaded dynamic code.

Breakpoint 1, main () at x.cc:10
10              cout << s.at(3);
(gdb) inspect s.at(3)

Breakpoint 1, main () at x.cc:10
10              cout << s.at(3);
The program being debugged stopped while in a function called from GDB.
When the function (std::string::at(unsigned) const) is done executing,
GDB will
silently stop (instead of continuing to evaluate the expression containing
the function call).

</gdb>
