From: =?iso-8859-1?q?Andr=E9s_Rold=E1n?= <aroldan@fluidsignal.com>
Subject: Re: I'm really starting to dislike stdio
Date: Thu, 19 Jun 2003 07:56:09 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <7dhe6m445y.fsf@void.central.fluidsignal.com>
References: <011801c33580$48425aa0$e764a8c0@fesnel.noip.org>
	<003c01c335c7$a7f437b0$3d6405d5@carlos>
	<004001c33635$21f3d3a0$e764a8c0@fesnel.noip.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <004001c33635$21f3d3a0$e764a8c0@fesnel.noip.org> (John T.
 Williams's message of "Thu, 19 Jun 2003 03:33:16 -0400")
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

man 3 getpass

Cheers

"John T. Williams" <jtwilliams@vt.edu> writes:

> I really appricated the help with the progress bar.
>
> I have another problem
>
> I am trying to read in a password from the stdin, but I don't want it to
> display to the screen as the person types it in.
> I either like to mock su, and take input w/o any output, or output a *  for
> each typed character, and I cannot figure out how to get this to work
>
> I've tried
> _____________________
>
>         read(1, &tmpch, 1);
>
>         while(tmpch != '\n') {
>                 memset(prog, '*', stars);
>                 printf("\rPassword: %-20s ", prog );
>                 stars++;
>
>                 buff[loop] = tmpch;
>                 loop++;
>                 read(1, &tmpch, 1);
>         }
>         read(1, &tmpch, 1);
>
>         while(tmpch != '\n') {
>                 memset(prog, '*', stars);
>                 printf("\rPassword: %-20s ", prog );
>                 stars++;
>
>                 buff[loop] = tmpch;
>                 loop++;
>                 read(1, &tmpch, 1);
>         }
> --------------------------
>
> I've tried
>
> ____________________
>
>
> tmpch = getchar();
> while(tmpch != '\n') {
>     memset(prog, '*', stars)
>     printf("\rPassword: %-20s ", prog );
>     stars++;
>
>     buff[loop] = tmpch;
>     loop++;
>     tmpch = getchar();
> }
>
> and I tried getc from the curses library.
> The problem with all of these is that they only actually do the read part
> after I've hit the <enter> key.  I want it to process each character as it
> is typed.  Anyone who has any ideas or can tell me a better way to read
> characters w/o displaying it to the screen and I'd be greatful.
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Andres Roldan <aroldan@fluidsignal.com>
http://people.fluidsignal.com/~aroldan
CSO, Fluidsignal Group
