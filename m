From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: getlogin(), prints ((NULL)) when printing multiple times in a row.
Date: Wed, 12 Mar 2003 23:14:23 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15983.48975.608147.30390@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.33.0303051227480.30291-100000@soochak.ncst.ernet.in>
	<Pine.LNX.4.21.0303122335180.15008-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0303122335180.15008-100000@hestia>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org


J. wrote:

> But, Everytime when I execute the following C code (bottom) from within a
> shell loop as in:
> 
> while : ; do ./program ; done
> 
> it prints: ((NULL))
> 
> But when I excute it in the normal way:
> ./program
> It prints perfectly ok: myusername
> 
> C Code.
> #include <stdio.h>
> #include <unistd.h>
> #include <sys/types.h>
> 
> int main(void) {
>  char *username = NULL;
> 
>  username = getlogin();
>  /* for(;;) */
>   printf("%s\n", username);
> 
>  return 0;
> }
> 
> When I call the printf from a for loop in the native C code it also
> starts to print ((NULL)) after a couple of loops.

Odd; for me, it's consistent: it either always prints "glynn" or
always prints "(null)".

But is getlogin() (i.e. the name from the utmp entry for the
controlling tty) really the information that you want? Or would you be
better off with:

	struct passwd *pw = getpwuid(getuid());
	pw ? pw->pw_name : "<none>"

?

Bear in mind that not all processes have a controlling terminal, and
even for those that do, there may not be an associated utmp entry.

-- 
Glynn Clements <glynn.clements@virgin.net>
