From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: Variable Declaration Order
Date: Thu, 01 Jul 2004 19:22:34 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40E48EAA.4030106@ig.com.br>
References: <40E44FBD.3040805@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40E44FBD.3040805@comcast.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-c-programming@vger.kernel.org

What are you suggesting a use of pointers arrangement ?

Are you thinking to use them to point to the next byte of the structure ?
If yes, I suggest you to user "union", and to forget the ideia of 
attributes arragement, it could be dangerous and dependent of compilers 
options.
I no, forget all I said.

SAMPLE:

struct incorrect {
   char *p;
   char buf[5];
};

struct correct {
   union both {
      char *p;
      char buf[5];
      // char *p; // could be here instead.
   };
};

Luciano

John Richard Moser wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> When declaring variables, what order do you all declare them in?  I
> usually follow the following scheme:
>
> struct foo {
>     int *ptr;
>     struct bar other_structs;
>     int fixed_val;
>     float fixed_float;
>     char array[2];
> };
>
> int baz() {
>     char array[2];
>     int fixed_val;
>     float fixed_float;
>     struct foo other_structs;
>     int *ptr;
> }
>
> The idea is to make sure that the arrangement in memory is always
>
> [PTR ][NORM][AL  ][ARRAY]
>
> if possible; but to try to keep arrays on the right side, and pointers
> on the left.  Structures should be handled VERY carefully to assure that
> no pointers are to the right of arrays.  If a structure has a pointer
> and an array, and two structures need to be in the same allocation unit,
> such as:
>
> struct bar {
>     int *ptr;
>     char array[2];
> };
>
> struct foo {
>     int *ptr;
>     struct bar other_structs;
>     struct bar other_structs;
>     int fixed_val;
>     float fixed_float;
>     char array[2];
> };
>
> int baz() {
>     char array[2];
>     int fixed_val;
>     float fixed_float;
>     struct foo other_structs;
>     struct foo other_structs;
>     int *ptr;
> }
>
> Then they need to be pointers to avoid pointer clobbering:
>
> struct bar {
>     int *ptr;
>     char array[2];
> };
>
> struct foo {
>     int *ptr;
>     struct bar *other_structs;
>     struct bar *other_structs2;
>     int fixed_val;
>     float fixed_float;
>     char array[2];
> };
>
> int baz() {
>     char array[2];
>     int fixed_val;
>     float fixed_float;
>     struct foo *other_structs;
>     struct foo *other_structs2;
>     int *ptr;
>     other_structs = initNewFoo();
>     other_structs2 = initNewFoo();
> }
>
> This is the variable order I tend to use to avoid nasty things from
> programming bugs.  The point of putting fixed length values (int, float,
> etc) after pointers is so that a missplaced cast (i.e. &achar passed to
> a function expecting an int*) don't clobber the pointer, allowing
> certain situations to allow someone who knows just how to set the bug
> off to make the program do arbitrary memory writes.
>
> I use ProPolice; so on the stack, the end of the stack frame has a
> canary that gets clobbered if that first array overflows
>
> Anyone have a better scheme, or see a flaw in my order?
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
>
> iD8DBQFA5E+8hDd4aOud5P8RAupkAJ4ulx0274SxUwzRWM5F0XzH6+tUmwCff7+V
> CLKkaD3XUN6JpshjlMzfw10=
> =H6sQ
> -----END PGP SIGNATURE-----
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
