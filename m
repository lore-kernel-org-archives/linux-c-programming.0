From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Newbie question on malloc()
Date: Fri, 4 Jun 2004 00:53:53 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16575.47633.683051.92531@cerise.nosuchdomain.co.uk>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
	<20040603012832.GC2562@luna.mooo.com>
	<16574.55886.797709.765778@cerise.nosuchdomain.co.uk>
	<1086301555.22497.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1086301555.22497.0.camel@localhost>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jtwilliams@vt.edu
Cc: Micha Feigin <michf@post.tau.ac.il>, linux-c-programming <linux-c-programming@vger.kernel.org>


John T. Williams wrote:

> but I believe that it is simply good practice to always be aware
> of memory you have dynamically allocated and always free it after you no
> more use for it.

As an "all other factors being equal ..." argument, I would agree with
that. But, most of the time, all other factors aren't equal.

There are many situations where keeping track of allocated memory
blocks would add significant complexity. E.g. when using heavily
linked data structures, it's common to copy pointers, so there may be
many pointers to the same block of memory.

In that situation, you can't just traverse the data structure, freeing
all of the pointers which you encounter; doing so would result not
only in freeing blocks multiple times, but quite possibly freeing
blocks which you will subsequently need to traverse into.

Another example: if you are storing strings in dynamically allocated
memory, you can "discard" some bytes from the beginning of the string
by advancing the pointer. However, you can't then pass the modified
pointer to free(); for that purpose, you would have to keep the
original pointer around as well.

In either case, you essentially have to add an additional layer of
memory management, so that allocating a block adds it to the set of
allocated blocks while freeing the block removes it.

For a short-lived program (i.e. a typical Unix command-line utility),
there is often no need to do this; often you can just allocate memory
as you need it and not to bother explicitly freeing anything.

Essentially, memory leaks are only an issue for programs which either
run indefinitely (e.g. daemons or interactive applications) or which
process large amounts of data in a linear sequence (i.e. you wouldn't
want "grep" to allocate a new block of memory for every line).

> In this way you don't get used to saying well if I miss
> it the operating system will clean it up for me. Please note I do not
> suggest that one should go to out of the way to free memory on abnormal
> termination, but its simply good practice to free memory when it is no
> longer being used in the normal behavior of your code. 

But that assumes that you know when memory is no longer being used. In
non-trivial programs, determining "liveness" can itself be
non-trivial.

When you release a structure which contains pointers to other
structures, you can only release any referenced structures when you
remove the last remaining reference. And it may not be straightforward
to determine whether other references exist.

There are a number of solutions, all of which have some drawbacks:

1. Reference counting. Not only does this requires significant
discipline (ensuring that you always increment/decrement reference
counts at the right points), but it doesn't cope with circular
references: if A references B and B references A, the reference counts
will be non-zero, so the structures won't be released even if nothing
else references either A or B.

2. Mark/Scan. This requires that you can reliably enumerate all
referencess to dynamic memory blocks. Unlike reference counting, this
scheme handles circular references correctly, but the effort involved
tends to make this approach impractical for anything other than
language interpreters or projects of such complexity that no other
solution is practical.

3. Copy everything; i.e. never duplicate or modify pointers. If you
need to copy data, copy the entire structure (and anything which it
references) rather than just the pointer. If you need a substring,
copy the relevant portion into a newly-allocated memory block. Not
only is this approach only feasible with "lightly" linked data
structures, it can easily result in significant bloat.

And, to keep to the original point (freeing memory upon termination),
if you're going to add your own memory management layer, one obvious
feature would be:

	extern int shutting_down;

	void my_free(void *p)
	{
		if (!shutting_down)
			free(p);
	}

I.e. explicitly skip calling free() if you know that you're about to
quit.

-- 
Glynn Clements <glynn.clements@virgin.net>
