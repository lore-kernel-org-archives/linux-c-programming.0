From: Suciu Flavius <suciuflavius@tiscali.de>
Subject: Re: C language(asm construct)
Date: Fri, 08 Oct 2004 08:02:18 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <ck59si$qsf$1@sea.gmane.org>
References: <20041006104403.96723.qmail@web52903.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041006104403.96723.qmail@web52903.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi,

Steps:

1) write hello_world.c
2) the preprocesor parse you hello_world.c file, process every # 
starting commands (like #include #define #ifdef ...) and generate a 
temporary file
3) the compiler start it's job reading the c file, parsing it, checking 
it for errors, optimizing it and generating an assembler file
4) the assembler generate than the obj files
5) the linker solve the libraries, global variables referencing, etc and 
generate the executable which of course, is in machine code and platform 
dependent.

Retain that step 4 can be optional, the compiler can generate object 
files without an assembler, it depending on the compilers ;)

So, to move your compiler on another platform, you need a new assembler 
and linker, the compiler can be the same. Look for example at GNU 
Compiler family ;)

For more info read
Aho, Sethi, Ullman - Compilers Principles, Techinques, And Tools



Ankit Jain wrote:
> hi
> 
> i want to know if this is correct? i am a bit confused
> about linker...i am talking this topic when we have a
> asm construct in our code.
> 
> The compiler basically reads the .c program and
> converts it into assembly code.Now during this it
> neglects this assembler construct and leaves it for
> assembler.Assembler is the person which basically
> looks for this part of the code and changes it into
> machine code. 
> 
> thanks
> 
> ankit
> 
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping" 
> your friends today! Download Messenger Now 
> http://uk.messenger.yahoo.com/download/index.html
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

