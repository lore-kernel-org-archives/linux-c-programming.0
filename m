From: HIToC <hitoc_mail@yahoo.it>
Subject: Re: pointers
Date: Mon, 31 Oct 2005 14:07:03 +0100
Message-ID: <200510301947.09432.hitoc_mail@yahoo.it>
References: <43648017.7040700@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43648017.7040700@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ework0 <ework0@gmail.com>
Cc: Linux C programming <linux-c-programming@vger.kernel.org>

On Sunday 30 October 2005 09:11, ework0 wrote:
> I would like to know what are the advantages of use pointers to
> insert/modify values in an array of characters for example.

With a pointer you can have access to a single element of an
array in a very easy and fast way. Probably your example was
not the best for this purpose; considere this one:

char str[16] = "0123456789ABCDEF";
char* p = str;

Now p points to the first element of the array str. If you want
to obtain or to modify the element pointed by p, you can do
this by simply operating on p. Remember that the operations
like p++, will not modify the element pointed by p, but only
p will point the next element in the array.


> what is the advantages of use this manipulation of array with these
> pointers ?

When you have to scan big sequences of objects, is a very common
way to use pointers in order to have the access to a single element
or when you pass an object to a function passing the address and not
to copy the entire object.

A wrong use of pointers can cause errors difficult to find.
-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
