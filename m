From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: const char * vs char[]
Date: Tue, 23 Mar 2004 20:26:47 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16480.40327.998566.932705@cerise.nosuchdomain.co.uk>
References: <20040323151902.000048da.cialdi@firenze.net>
	<000f01c410e6$6d7197e0$0c81640a@aca.org.ar>
	<20040323170446.GB11933@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040323170446.GB11933@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Jan-Benedict Glaw wrote:

> > No... "char*" and "char []" are synonyms.
> 
> There's a subtle difference:

I wouldn't say that the difference between pointers and arrays is
subtle; the difference is actually rather substantial.

The reason why beginners tend to confuse the two is that C treats an
array as a pointer to its first element in almost all of the
situations where an array can be used.

> char *hello_ptr = "A really loooong hello world";
> char write_string[] = "this is some long garbage";
> 
> void main(void) {
> 	/* legal */
> 	sprintf (write_string, "%s", "stuff");
> 
> 	/* illegal - may be in a read-only segment */
> 	sprintf (hello_ptr, "%s", "Don't do that");
> }
> 
> So if you're preparing some space for say building up some packet (to be
> sent out to hardware), use "char xx[]", but if you only want to have a
> read-only string (to printf() it to the user), you can use "char *xx".

In the latter case, you could also use "const char xx[]".

The main reasons to make a variable a pointer rather than an array
are:

1. You want the pointer to point at some pre-existing data.

2. You want to be able to change the pointer itself (as opposed to
what it points at).

-- 
Glynn Clements <glynn.clements@virgin.net>
