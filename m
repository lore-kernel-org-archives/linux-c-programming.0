From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: dynamic allocation of array of structures
Date: Sat, 22 Mar 2003 21:28:04 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15996.54628.878592.818662@cerise.nosuchdomain.co.uk>
References: <20030322202720.267284000B9@mwinf0501.wanadoo.fr>
	<Pine.LNX.4.21.0303222141500.5852-100000@hestia>
	<20030322230044.B6857@neutrino.particles.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030322230044.B6857@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


J. wrote:

> struct {
>  char *name;
>  int telnr;
> } people[100];
> 
> Instead of statically allocating an array of 100 of these structures like
> I have done, I want to dynamically allocate the array at run-time and
> resize the number of structures some where at any time in the main
> program. 
> 
> I know how to resize char arrays and int arrays but I never (re)sized an
> array of structres which can be accessed with something as: ``people[4].name''. 
> In Google nothing really usefull turns up.
> 
> Can this be done without having to resort to other implementations like
> linked lists etc.. ? If so how ?

Use malloc() and realloc(), i.e.

	ptr = malloc(count * sizeof(record));
and:
	ptr = realloc(ptr, count * sizeof(record));

Elias Athanasopoulos wrote:

> > Maybe some of you could give a hunch what goes wrong. 
> 
> You should use linked lists.

I can't see any reason to use linked lists here.

> The code below can work if you save
> the starting offset of you elements, but in general it is not safe.

[snip]

> +  t = ptr;
> 
> >  for(i = 0; i < 10; i++, ptr++) {
> >   ptr->initial = 'A' + i;
> >   ptr->roomnr = i;
> >  }
> 
> +  ptr = t;

It's better to just leave the original pointer alone, and work on the
copy, e.g.

  for(i = 0, t = ptr; i < 10; i++, t++) {
   t->initial = 'A' + i;
   t->roomnr = i;
  }

Actually, using explicit pointer increment operations for array
iteration is a throwback to the days before compilers commonly
performed loop induction optimisation.

Nowadays, you may as well just write:

  for(i = 0; i < 10; i++) {
   record *t = &ptr[i];
   t->initial = 'A' + i;
   t->roomnr = i;
  }

Leave the induction up to the compiler; it's less likely to get it
wrong than a programmer is.

-- 
Glynn Clements <glynn.clements@virgin.net>
