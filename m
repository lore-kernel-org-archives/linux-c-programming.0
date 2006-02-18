From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: glibc detected - free(): invalid next size
Date: Sat, 18 Feb 2006 10:14:32 +0000
Message-ID: <17398.62344.541615.752060@cerise.gclements.plus.com>
References: <43F6A9AF.8010309@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43F6A9AF.8010309@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Colannino <james@colannino.org>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


James Colannino wrote:

> Hey everyone.  I have a quick question.  What does the following runtime 
> error mean?
> 
> *** glibc detected *** free(): invalid next size (fast): 0x0804a1c0 ***
> 
> Does this mean that the program attempted to free memory from a pointer 
> that wasn't allocated any memory?   I have a feeling that is what this 
> means, but the message itself is cryptic.

Either the pointer passed to free() was bogus (not returned from
malloc(), calloc() etc), or the heap is corrupt.

> On a related note, does anyone know of a good source that describes 
> runtime errors such as this in detail?  It would help me greatly in my 
> debugging experience.  Thanks :)

I don't know of any documentation for allocator warnings other than
the glibc source code itself.

-- 
Glynn Clements <glynn@gclements.plus.com>
