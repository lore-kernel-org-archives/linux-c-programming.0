From: nanakos@wired-net.gr
Subject: Re: Sizes of stack variables
Date: Mon, 3 Nov 2003 18:12:56 +0200 (EET)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1120.80.76.61.197.1067875976.squirrel@webmail.wired-net.gr>
References: <20031029203041.GA12880@whatever.local>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Received: from wired-net.gr (localhost.localdomain [127.0.0.1])
	by enigma.wired-net.gr (*.**.*/******) with SMTP id hA3GCuLS005331;
	Mon, 3 Nov 2003 18:12:56 +0200
In-Reply-To: <20031029203041.GA12880@whatever.local>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chuckw@ieee.org
Cc: linux-c-programming@vger.kernel.org

Hi the stack size depends on the optimization of the compiler ( gcc )
.Just read the stack frame that is used from the compiler.You can find
such info in http://gcc.gnu.org or sth similar.

Best regards,
Chris.



> Hey All,
>   I was just trying to minimize the size of a program the other day,
> and I noticed that the size of the varibles created on the stack is
> not necessarily the size they should be.  So, for instance, the
> following code:
>
> void main()
> {
>   char buffer[8];
>
>   printf("%s\n", buffer);
> }
>
> produces the following assembly:
>    ...
> 8  main:
> 9    pushl %ebp
> 10   movl  %esp, %ebp
> 11   subl  $24, %esp
> 12   andl  $-16, %esp
> 13   movl  $0, %eax
>      ...
>
> No problem right, the buffer variable is created on the stack, and
> I am assuming that the number 24 being subtracted from the stack pointer
> is the 8 bytes for the buffer + 16 bytes program overhead(environment,
> etc).
> Now, if I change the source to the following:
>
> void main()
> {
>   char buffer[16];
>
>   printf("%s\n", buffer);
> }
>
> produces the following assembly:
>    ...
>    8  main:
>    9    pushl %ebp
>    10   movl  %esp, %ebp
>    11   subl  $40, %esp
>    12   andl  $-16, %esp
>    13   movl  $0, %eax
>    ...
>
> Shouldn't the stack size only increase to 32 which is 16 bytes of overhead
> plus the 16 bytes for the variable?
>
> If someone has some insight into this I would be much abliged.
>
> Chuck
>
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

