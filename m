From: Tiago Maluta <maluta_tiago@yahoo.com.br>
Subject: Re: swapcontext and free memory
Date: Wed, 18 Mar 2009 19:22:13 +0000
Message-ID: <49C149E5.4020309@yahoo.com.br>
References: <18142048.1237399551641.JavaMail.ngmail@webmail17.arcor-online.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18142048.1237399551641.JavaMail.ngmail@webmail17.arcor-online.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: xcomp@arcor.de
Cc: linux-c-programming@vger.kernel.org

xcomp@arcor.de wrote:
> Hi all,
> I have written a small test case which simply creates a new context, swaps to it and returns to the main function. I am allocating memory for the ucontext_t structures and the stack on which the context is executed using malloc.
Because of this I also want to deallocate the memory again using free.
The problem is I can't deallocate the memory after swapping back. It
runs only if all three free() calls are commented out. Otherwise a
segmentation fault occurs. Does swapcontext handle this on its own? Can
anyone explain this behavior? I didn't find anything concerning this
problem in the web.
> I am running this program on Ubuntu 8.04 with the following system information: Linux
ubuntu8041 2.6.24-23-generic #1 SMP i686 GNU/Linux

(...)

> 	main_context = (ucontext*) malloc(sizeof(ucontext));
> 	thread_context = (ucontext*) malloc(sizeof(ucontext));

changing:

main_context = (ucontext_t*) malloc(sizeof(ucontext_t));
thread_context = (ucontext_t*) malloc(sizeof(ucontext_t));

and compiling with free() I got:

#./a.out
start

Allocated memory:
        main_context:   0x804b008
        thread_context: 0x804b168
        thread_stack:   0x804b2c8
thread_function was called...

swapcontext() returned. Freeing memory starts now...
thread_stack was deallocated...
thread_context was deallocated...
main_context was deallocated...

I'm using glibc version 2.8.

--tm



