From: <cyon.john@wipro.com>
Subject: RE: Multiple declaration problem
Date: Tue, 27 Feb 2007 16:20:17 +0530
Message-ID: <70661EB74D51BD4889EE03CC34E733F58DDD8A@blr-m2-msg.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: samjnaa@gmail.com, linux-c-programming@vger.kernel.org

Hi,

#ifdef ... #define ... #endif protects you from accidently incuding a
header file twice in a source file.
But since you are including it in different source files, compiler will
not complain, but while linking linker will find that 'b' is defined at
two places and complain.

Can't you use  
		int lawCloseEngine ( int engineID = NONE ) ;

I think that should solve your problem.

Regards,
Cyon P.J.


-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of
Shriramana Sharma
Sent: Saturday, February 24, 2007 9:19 PM
To: linux-c-programming@vger.kernel.org
Subject: Multiple declaration problem

Hello. I have a problem with multiple declaration in a project I am
working on. I have constructed a similar testcase which throws the same
kind of error. Please see the files in the attachment. -g or -g3 did not
give any useful debugging symbols, I don't know why. The following is
the session transcript:

$ ls
main.cpp  myheader.cpp  myheader.h
$ g++ -c main.cpp
$ g++ -c myheader.cpp
$ g++ -o main main.o myheader.o
myheader.o:(.data+0x0): multiple definition of `b'
main.o:(.data+0x0): first defined here
collect2: ld returned 1 exit status
$ mv main.cpp main.c
$ mv myheader.cpp myheader.c
$ rm *.o
$ gcc -c main.c
$ gcc -c myheader.c
$ gcc -o main main.o myheader.o
myheader.o:(.rodata+0x0): multiple definition of `a'
main.o:(.rodata+0x0): first defined here
myheader.o:(.data+0x0): multiple definition of `b'
main.o:(.data+0x0): first defined here
collect2: ld returned 1 exit status

In my project, I need to put the following statement in a header file:

int lawCurrentEngine = NONE ; // NONE has been enum-med previously

because I need to declare a function

int lawCloseEngine ( int engineID = lawCurrentEngine ) ;

I include the header file containing these two lines in two cpp files,
and I get a multiple definition error for lawCurrentEngine just like in
the given test case. If I push the lawCurrentEngine declaration to one
of the cpp-s (it's not needed in the other cpp) I am unable to provide
the default argument for the lawCloseEngine which can be done only in
the header.

I don't understand how I am getting such an error when I have used the
#ifndef #define #endif technique as per good programming practice.

Please help,

Thanks.

Shriramana Sharma.
