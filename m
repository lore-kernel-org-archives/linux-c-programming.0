From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Dinamic array allocation
Date: Tue, 26 Oct 2004 06:51:46 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16765.58866.151383.848220@cerise.gclements.plus.com>
References: <417DBE66.7050501@crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <417DBE66.7050501@crearium.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio <fabio@crearium.com>
Cc: linux-c-programming@vger.kernel.org


Fabio wrote:

> I am programming a C code that gets argv[1] as the lenght of an array 
> that is the copy of an array plus more data.
> 
> So, the appication runs as: ./a.out 100
> 
> It create an array of 100 bytes and adds a static defined array plus 
> more data, like:
> 
> char *foo[5]="bar"

This should be:

	const char *foo = "bar";
or:
	char foo[] = "bar";
or:
	char foo[5] = "bar";

Exactly which one depends upon exactly what you want.

In the first case, the string will be stored in the read-only data
segment, the variable foo will be stored in the data segment, and foo
will be initialised to point to the string. You will be able to modify
the variable foo to point elsewhere, e.g.

	foo = "foo";

but you won't be able to modify what it points to (because the
read-only data segment is mapped read-only), i.e. doing:

	foo[0] = 'x';

will result in a segmentation fault at run-time.

In the second and third cases, foo will effectively be a compile-time
constant which points to a region of the data segment (to at least 4
bytes in the second case, at least 5 bytes in the third case). You
will be able to modify the contents of the array, i.e.

	foo[0] = 'x';

but you won't be able to make foo point elsewhere, i.e. doing:

	foo = "foo";

will result in an error at compile time.

> main(int argc, char *argv[])
> {
>     char *Ptr[];

This should probably just be:

	char *Ptr;

-- 
Glynn Clements <glynn.clements@virgin.net>
