From: Rechberger Markus <mrechberger@gmail.com>
Subject: Re: Problem with pointer to external function
Date: Fri, 1 Jul 2005 12:54:37 +0200
Message-ID: <d9def9db05070103545325ee64@mail.gmail.com>
References: <20050701103026.GA2965@paktahn.black.cat>
Reply-To: Rechberger Markus <mrechberger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050701103026.GA2965@paktahn.black.cat>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hey,

I'd write it like that:

main.c
----
#include <stdio.h>

extern void cb();
void (*callback)()=cb;

int main (int argc, char** argv){
      callback();
      return(0);
}

defhandler.c
----
void cb()
{
       printf("handler\n");
}


$ gcc main.c defhandler.c -o test
$ ./test
handler

Markus
		


On 7/1/05, leslie.polzer@gmx.net <leslie.polzer@gmx.net> wrote:
> Hello list,
> 
> why do it get the segfault below? What's wrong?
> 
> 
> [sky@paktahn ~/code/cbtest]% cat main.c
> #include <stdio.h>
> 
> typedef void (*callback)();
> 
> extern callback cb;
> 
> int
> main (int argc, char** argv)
> {
>         cb();
> 
>         return(0);
> }
> 
> [sky@paktahn ~/code/cbtest]% cat defhandlers.c
> void cb()
> {
> }
> 
> [sky@paktahn ~/code/cbtest]% gcc main.c defhandlers.c -ggdb
> [sky@paktahn ~/code/cbtest]% gdb ./a.out
> GNU gdb 6.3
> Copyright 2004 Free Software Foundation, Inc.
> GDB is free software, covered by the GNU General Public License, and you are
> welcome to change it and/or distribute copies of it under certain conditions.
> Type "show copying" to see the conditions.
> There is absolutely no warranty for GDB.  Type "show warranty" for details.
> This GDB was configured as "i686-pc-linux-gnu"...Using host libthread_db library "/lib/tls/libthread_db.so.1".
> 
> (gdb) run
> Starting program: /home/sky/code/cbtest/a.out
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x5de58955 in ?? ()
> (gdb) bt full
> #0  0x5de58955 in ?? ()
> No symbol table info available.
> #1  0x08048367 in main (argc=1, argv=0xbffff634) at main.c:10
> No locals.
> (gdb)
> 
> 
> Regards,
> 
> Leslie
> 
> --
> PGP-KID: 0x52D70289
> 
> 
>
