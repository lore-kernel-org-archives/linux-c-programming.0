From: Suma C <gsumac@gmail.com>
Subject: Re: malloc with size 0
Date: Thu, 22 Dec 2005 13:12:59 +0530
Message-ID: <1f5f62170512212342odf496f5j1161a3965c9141a@mail.gmail.com>
References: <1f5f62170512212043w17e1c8e7v3781e0dc72845efc@mail.gmail.com>
	 <7728232c0512212221y368e782br7fe52d2caee76231@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <7728232c0512212221y368e782br7fe52d2caee76231@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hareesh Nagarajan <hareesh.nagarajan@gmail.com>
Cc: linux-c-programming@vger.kernel.org

http://www.ussg.iu.edu/hypermail/linux/kernel/0011.0/1078.html   got
this one...the thread discusses the same situation

I guess it talks about malloc allocating  a minimum memory (the header
space !!??)...
and so the next question will be: wt about the unique pointer which is
given in the man page!!!


regards
suma

PS
snip from the link above...
All true, but the reason it "works" is that malloc WILL allocate some memory,
even if it's only a few bytes of header.:

       | | (other memory block controled by malloc/free...)
       |-------|
       | header|
       | | - address returned to program
       | next |
       | header| (next memory block...)
Now the strcpy may have copied the string "fffff" over the next header.
The copy worked, the printf worked (its buffers were already allocated...)
BUT... If you allocate more memory via malloc, you will get an error
(eventually). I believe malloc(0) allocates 4 bytes as a minimum, though
this particular call IS undefined. You also did not check to see if
malloc did return something (It did, or you would have gotten a segmentation
fault from writing to location 0 with strcpy).


On 12/22/05, Hareesh Nagarajan <hareesh.nagarajan@gmail.com> wrote:
> On 12/22/05, Suma C <gsumac@gmail.com> wrote:
>
> > When  a 0 is passed to malloc, I get a valid pointer instead of a NULL
> > .What does this mean?
>
> A search on Google would have given you this thread:
> http://www.theone.ru/lists/comp.lang.c/msg00504.html
>
> hth,
>
> ./hareesh
>
