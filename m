From: Suciu Flavius <suciuflavius@tiscali.de>
Subject: Re: Windows can use cpp in c code but in linux ?? I dont know how.
Date: Thu, 30 Sep 2004 18:49:53 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <cjhct8$3uk$1@sea.gmane.org>
References: <36a2bb3d04093003501d1b58a7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <36a2bb3d04093003501d1b58a7@mail.gmail.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi,

Your solution is a partial solution, because you "migration" require 
also the C++ library to be linked.

First, of course it's possible ;)

Second, under windoze you compiler it's smart (or dumb enought) to link 
automaticly with the c++ library.

Under Linux, gcc it's a pure c compiler, it never link agains c++ 
library, so "the misterious" messages refer to the missing c++ library 
because you code do references for operator new and delete ;)

To solve this is easy, link with the c++ library: -lstdc++

gcc a.c mylib.a -lstdc++

Third, welcom in the Linux world :)

Regards, and don't forget, under Linux EVERYTHING is possible :D






mojtaba mahdavi wrote:
> Hi all.
> 
> I am a windows programmer and want to migrate my codes to linux. 
> 
> My problem is as followes.
> 
> I want to use cpp (File1.cpp) codes in c (File2.c) codes. 
> 
> in windows I have done following and it is ok. 
> 
> 1- I wrote a cpp code (Wrap.cpp) that wraps my cpp code (File1.cpp) and 
> compiled it using cpp compiler. 
> ( my strategy: for every method I wrote a c function that calls the methode. 
> each function gets a void * to the class handle and ... ) 
> 
> 2- I exported my wrapper functions as C interfaces using extern "C". (Wrap.h) 
> 
> 3- in File2.c I used wrap.h and compiled it as a c code. every thing is fine. 
> 
> Now I have trouble with linux to do that (because I am a newbie in linux). 
> 
> at first, is it possible in linux ?? ( I think it must be possible ).
> 
> secondly, How do I it. 
> 
> actually I have done above in linux but I got some error message. 
> 
> My strateghy is as follows. 
> 
> 1- complie file1.cpp and wrap.cpp using gcc and making file1.o and
> wrap.o. it is ok.
> 2- making library using ar command. it is ok. (mylib.a) 
> 3- compile and link file2.c with mylib.a ..???????!!!!!!!! 
> 	this generates an error. 
> 		it says : 
> 
> ./libmylib.a(wrap.o)(.text+0xc):wrap.cpp: undefined reference to `
> ___gxx_personality_sj0'
> ./libmylib.a(wrap.o)(.text+0x44):wrap.cpp: undefined reference to
> `operator new(unsigned)'
> ./libmylib.a(wrap.o)(.text+0x85):wrap.cpp: undefined reference to
> `operator delete(void*)'
> ./libmylib.a(wrap.o)(.text+0xeb):wrap.cpp: undefined reference to
> `operator delete(void*)'
> collect2: ld returned 1 exit status
> 
> 
> NOW. 
> 
> what should I do ????
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

