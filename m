From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Memory bug somewhere
Date: Sat, 24 May 2003 19:08:15 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16079.46351.86604.713178@cerise.nosuchdomain.co.uk>
References: <1053798538.1248.24.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1053798538.1248.24.camel@localhost.localdomain>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: davidgn@servidor.unam.mx
Cc: linux-c-programming@vger.kernel.org


David Eduardo Gomez Noguera wrote:

> I have been having a program crash in this function.
> It basically recives a pointer to a structure 
> 
> typedef struct hufftree {
>   HuffCode code;
>   struct hufftree *l;
>   struct hufftree *r;
> }hufftree;
> 
> a code, a size (of the code) and a data asigned to that huffman code.
> 
> This function inserts the data at the end of the path marked by the code
> and the size of the code.
> 
> It segfaults after some asignments (some calls to ins_code), always at
> the same point.
> 
> Can anybody here see what is wrong with this?

I can't see any errors here. However, if you corrupt the heap, you
normally get a segfault during some subsequent call to malloc/free,
not at the point that the corruption occurs.

One option is to use mcheck(), e.g. by linking against libmcheck. This
is mentioned in the libc Info file.

-- 
Glynn Clements <glynn.clements@virgin.net>
