From: Hemant Mohan <hemantm@pune.tcs.co.in>
Subject: Re: Blocking malloc
Date: Fri, 12 Apr 2002 17:42:27 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OFAFF88BC7.76BF951B-ON65256B99.0042F7D4@pune.tcs.co.in>
References: <OFB9F55B95.377592BA-ON65256B98.00203191@pune.tcs.co.in> <3CB53B3D.7CA9ABFB@cs.unt.edu>
Reply-To: hemantm@pune.tcs.co.in
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3CB53B3D.7CA9ABFB@cs.unt.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: mehran@cs.unt.edu
Cc: linux-c-programming@vger.kernel.org

Using strace I got some clue.

strace output shows a Segmentation fault when malloc is called. That me=
ans=20
that the stack size is smaller than what is required, and kernel is una=
ble to=20
extend the stack size. As I am not trapping any signals in my thread so=
 it I=20
am unable to trace it otherwise.

Is there any way I can calulate the stack size required. Currently I am=
=20
letting the system decide the stack size. Is it possible to change the =
stack=20
size of the  thread dynamically during runtime.

Thanks,
Hemant

On Thursday 11 April 2002 12:59, mehran@cs.unt.edu wrote:
> Hemant Mohan wrote: Hi,
>
> I am stuck up in problem where the malloc is blocking.
> I am programming in a multithreaded environment, using gcc-3.0.3 unde=
r
> linux.
> The thread related functions are from a user created library.
> ....
>
> Hemant
> =A0Do you actually exit (as thread_exit()), and then thread_join(). H=
ere is
> the code I suggest:
> main()
> {
> =A0=A0=A0 /* If you're using some sort of POSIX thread then the code =
is slightly
> different than what you have
> =A0=A0=A0=A0=A0=A0 nonetheless these are things normally in the a pos=
ix thread program.
> */
> =A0=A0=A0 pthread_t thread1;
> =A0=A0=A0 ....
> =A0=A0=A0 pthread_create (&thread1,function1, ...);
>
> =A0=A0=A0 pthread_join(thread1);
> =A0=A0=A0 ....
> =A0=A0=A0 pthread_exit(0); /* not actually needed, just for the sake =
of thread
> programming style */
> }
>
> void* function1(...)
> {
> =A0=A0=A0 pthread_t thread2;
> =A0=A0=A0 ...
> =A0=A0=A0 pthread_create(&thread2,function2, ...);
> =A0=A0=A0 pthread_join(thread2);
> =A0=A0=A0 pthread_exit(0);
> }
>
> void* function2(...)
> {
> =A0=A0=A0 char* x =3D NULL;
> =A0=A0=A0 printf("First print\n");
> =A0=A0=A0 if((x =3D malloc(100*sizeof(char))) =3D=3D NULL)
> =A0=A0=A0 {
> =A0=A0=A0=A0=A0=A0=A0=A0 printf("second printf, malloc error\n");
> =A0=A0=A0=A0=A0=A0=A0=A0 fflush(stdout);
> =A0=A0=A0=A0=A0=A0=A0=A0 perror("malloc error");
> =A0=A0=A0 }
> =A0=A0=A0 printf("third printf\n");
> =A0=A0=A0 fflush(stdout);
> =A0=A0=A0 ....
> =A0=A0=A0 pthread_exit(0);
> }
> You can however create detached threads, then you need to change the
> attributes of threads. This needs a little more care to set the attri=
bute
> of thread and so on. I believe your main goal is to get a simple thre=
ad
> program to work and above fragment suffices.
> By the way, there is no sense of parallelism in above code though. If=
 you
> are after parallelising the code then just create both threads in the=
 main
> (back to back), and join with them back to back.
> So long,
>
> Mehran
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
