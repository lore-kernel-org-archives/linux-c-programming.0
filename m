From: David Eduardo Gomez Noguera <davidgn@servidor.unam.mx>
Subject: Re: Memory bug somewhere
Date: 24 May 2003 14:47:05 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1053805624.1248.35.camel@localhost.localdomain>
References: <1053798538.1248.24.camel@localhost.localdomain>
	 <16079.46351.86604.713178@cerise.nosuchdomain.co.uk>
Reply-To: davidgn@servidor.unam.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16079.46351.86604.713178@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

On Sat, 2003-05-24 at 13:08, Glynn Clements wrote:
> David Eduardo Gomez Noguera wrote:
> 
> > I have been having a program crash in this function.
> > It basically recives a pointer to a structure 
> > 
> > typedef struct hufftree {
> >   HuffCode code;
> >   struct hufftree *l;
> >   struct hufftree *r;
> > }hufftree;
> > 
> > a code, a size (of the code) and a data asigned to that huffman code.
> > 
> > This function inserts the data at the end of the path marked by the code
> > and the size of the code.
> > 
> > It segfaults after some asignments (some calls to ins_code), always at
> > the same point.
> > 
> > Can anybody here see what is wrong with this?
> 
> I can't see any errors here. However, if you corrupt the heap, you
> normally get a segfault during some subsequent call to malloc/free,
> not at the point that the corruption occurs.
> 
> One option is to use mcheck(), e.g. by linking against libmcheck. This
> is mentioned in the libc Info file.

Thank you. I have just tried that, with the result that it went very
slow, and seemed to swap all memory (because after the program ends,
with the message "Killed", the output for free mem from `free` is all
the memory)
I called mcheck at the megening of main, with a NULL argument.

on other side, after reading a bit, I tried with 
MALLOC_CHECK_ set to 1, but it dropped me only one message at the
beginig of all the output:

malloc: using debugging hooks
malloc: top chunk is corrupt
./sagem

I think that is before I use malloc even once.

have read a bit, but I think its not related to my problem.
With the printf statemens, I found the segfault was in the malloc call,
gdb's backtrace says that too:

Program received signal SIGSEGV, Segmentation fault.
0x400b682e in _int_malloc () from /lib/libc.so.6
(gdb) backtrace
#0  0x400b682e in _int_malloc () from /lib/libc.so.6
#1  0x400b5830 in malloc () from /lib/libc.so.6
#2  0x400b9aac in mallochook () from /lib/libc.so.6
#3  0x400b57cc in malloc () from /lib/libc.so.6
#4  0x08049c36 in ins_code (tree=0x804c3d0, code=78, size=7 '\a',
dato=161 '?')
    at sagem.c:532
#5  0x08049ae1 in hs (hf=0xbfffdca0) at sagem.c:469
#6  0x08049618 in main (argc=2, argv=0xbfffde74) at sagem.c:258
#7  0x4005e5cd in __libc_start_main () from /lib/libc.so.6

Why I think it might be a problem with glibc is because it doesnt
segfaults on a mandrake 9.1, but it does crash on rh 8 and 9.

how could I be corrupting the heap if that is the problem?

