From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Multiple declaration problem
Date: Tue, 27 Feb 2007 18:42:46 +0000
Message-ID: <17892.31654.328309.65384@cerise.gclements.plus.com>
References: <45E05E83.5010005@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <45E05E83.5010005@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> Hello. I have a problem with multiple declaration in a project I am 
> working on. I have constructed a similar testcase which throws the same 
> kind of error. Please see the files in the attachment. -g or -g3 did not 
> give any useful debugging symbols, I don't know why. The following is 
> the session transcript:
> 
> $ ls
> main.cpp  myheader.cpp  myheader.h
> $ g++ -c main.cpp
> $ g++ -c myheader.cpp
> $ g++ -o main main.o myheader.o
> myheader.o:(.data+0x0): multiple definition of `b'
> main.o:(.data+0x0): first defined here
> collect2: ld returned 1 exit status
> $ mv main.cpp main.c
> $ mv myheader.cpp myheader.c
> $ rm *.o
> $ gcc -c main.c
> $ gcc -c myheader.c
> $ gcc -o main main.o myheader.o
> myheader.o:(.rodata+0x0): multiple definition of `a'
> main.o:(.rodata+0x0): first defined here
> myheader.o:(.data+0x0): multiple definition of `b'
> main.o:(.data+0x0): first defined here
> collect2: ld returned 1 exit status
> 
> In my project, I need to put the following statement in a header file:
> 
> int lawCurrentEngine = NONE ; // NONE has been enum-med previously
> 
> because I need to declare a function
> 
> int lawCloseEngine ( int engineID = lawCurrentEngine ) ;
> 
> I include the header file containing these two lines in two cpp files, 
> and I get a multiple definition error for lawCurrentEngine just like in 
> the given test case. If I push the lawCurrentEngine declaration to one 
> of the cpp-s (it's not needed in the other cpp) I am unable to provide 
> the default argument for the lawCloseEngine which can be done only in 
> the header.

Default parameter values need to be constants; if you declare
lawCloseEngine as "const int", you won't get an error.

If you want the default value to be a variable rather than a constant,
you need to use something like:

	int lawCloseEngine ( int engineID = -1 ) ;


	int lawCloseEngine ( int engineID )
	{
		if (engineID == -1)
			engineID = lawCurrentEngine ;
		...
	}

Alternatively, define separate zero-arguments and one-argument
versions of lawCloseEngine.

-- 
Glynn Clements <glynn@gclements.plus.com>
