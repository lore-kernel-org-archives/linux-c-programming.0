From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Curious segmentation fault - please help
Date: Sat, 13 May 2006 19:20:59 +0200
Message-ID: <6a00c8d50605131020o6665b157u18b72e93cc04411b@mail.gmail.com>
References: <200605131958.39156.samjnaa@gmail.com>
	 <6a00c8d50605130809pba67862gd981f8bf0fa6927f@mail.gmail.com>
	 <200605132157.24997.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200605132157.24997.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 5/13/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Saturday 13 May 2006 20:39 samaye, Steve Graegert alekhiit:
>
> > Looks like the function 'listsplpanchaanga' tries to access the
> > 'grahanaama' array's nth element with only n - 1 being present
> > ('vaasara = 6' accesses the last, 7th, element),
>
> Yep. But the array does contain 7 elements. Vide line 64 of monthpan.c:

Sure, but valgrind's output shows, that the program tries to read the
first character of the nth element: "Invalid read of size 1" (with
char of size 1).

Furthermore it shows that the error occurs in the same loop in function:

/* called from within main */
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)

[debug output here and still within listsplpanchaanga()]

==9675== Invalid read of size 1
==9675==    at 0x4021FB8: strlen (in
/usr/lib/valgrind/x86-linux/vgpreload_memcheck.so)
==9675==    by 0x40A0807: vfprintf (in /lib/libc-2.4.so)
==9675==    by 0x40A5C92: printf (in /lib/libc-2.4.so)
==9675==    by 0x8049B7D: listsplpanchaanga (monthpan.c:593)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==  Address 0x726956 is not stack'd, malloc'd or (recently) free'

This reads as: main() calls listsplpanchaanga() calls printf() calls
vfprintf() calls strlen() where the read failed.  In line 593 printf()
tries to read a byte which is neither on the stack, the heap nor has
been free()'d.

[snip]

> vaasara[6] does give the correct output. The fault is seen *after* vaasara[6]
> is read and written to stdout:

which accesses the last element correctly.  Nevertheless, the function
tries to read one more character causing a segfault.  Please don't
misinterpret valgind's output: we are still in listsplpanchaanga().

> > step in the loop.  Maybe you can simply correct the error by accessing
> > 'grahanaama' using 'vaasara - 1': grahanaama[vaasara - 1] if this is
> > what you wanted to achieve.
>
> But then I would not get grahanaama[0] = "Surya" which is what I want to get.
> Actually this program compiled and worked perfectly on GCC 4.02 with SUSE
> 10.0. (And also GCC 4.1 with SUSE 10.0 I think.) But since I upgraded to SUSE
> 10.1, I get this error. SUSE 10.1 has gcc 4.1 and glibc 2.4, [as I am sure
> you as a fellow suser know] if that means anything...

Hm, don't know what could have changed.  I am not a SuSEr anymore;
returned to Debian and NetBSD.

> > At least, this is my first guess.  I have not yet fully grasped the
> > meaning of the code, due to difficulties in understanding the variable
> > and function names :-)
>
> Sanskrit. It's an ancient-Indian-astronomy application.

Hey cool!  My girlfriend is a Buddhist, she may indeed have some
knowledge of Sanskrit, but I have serious doubts that she is willing
to read the code :-)

	\Steve
