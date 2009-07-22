From: Gedare Bloom <gedare@gwmail.gwu.edu>
Subject: Re: Problem with infinite loop in signal handler
Date: Wed, 22 Jul 2009 16:31:23 -0400
Message-ID: <9b6278b80907221331m39d4adf0oc6cd8057d9cd6565@mail.gmail.com>
References: <62c21b850907220942p60fd9362kcbd82158ce685dd8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <62c21b850907220942p60fd9362kcbd82158ce685dd8@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-2?Q?Mirski_Pawe=B3?= <mirskip87@gmail.com>
Cc: linux-c-programming@vger.kernel.org

The problem is that the thread looping in the signal handler has equal
priority to the 'main' thread, so that it is exhausting all of the
compute resources and the main thread is never scheduled.

You can correct this by giving your newly created thread a lower
priority (see below).  Good luck!

-G

--- orig.c	2009-07-22 16:28:44.000000000 -0400
+++ test.c	2009-07-22 16:28:02.000000000 -0400
@@ -1,5 +1,6 @@
 #include <signal.h>
 #include <stdio.h>
+#include <sched.h>

 void suspend(int sig) {
    printf("suspending\n");
@@ -28,6 +29,8 @@

    struct sigaction sa;
    pthread_t thread1;
+	struct sched_param sp;
+	int policy;

    sa.sa_handler =3D suspend;
    sa.sa_flags =3D SA_RESTART;
@@ -35,6 +38,9 @@
    sigaction(SIGUSR1, &sa, NULL);

    pthread_create(&thread1, 0, loop_func, 0);
+	pthread_getschedparam(thread1, &policy, &sp);
+	sp.sched_priority =3D sched_get_priority_min(policy);
+	pthread_setschedparam(thread1, policy, &sp);
    wait_some_time();

    pthread_kill(thread1, SIGUSR1);
@@ -43,4 +49,3 @@

    return 0;
 }
-


2009/7/22 Mirski Pawe=C5=82 <mirskip87@gmail.com>:
> Hi all,
> I have problem with handling signals in simple program. Program start=
s
> one thread (only task of this thread is printing "Hello World") and
> after while sends signal to this thread (signal handler is previously
> registered). In signal handler is infinite loop that should suspend
> thread forever. But it suspends whole application. I think this
> problem is related with printf function because when I replace it wit=
h
> with linux write sys function problem does not occures. And one more
> info: problem occures not always, but most of time; maybe somewhere
> there is a race condition.
> This is whole code of application:
>
> #include <signal.h>
> #include <stdio.h>
>
> void suspend(int sig) {
> =C2=A0 =C2=A0printf("suspending\n");
> =C2=A0 =C2=A0fflush(stdout);
> =C2=A0 =C2=A0while(1);
> }
>
>
> void* loop_func(void* arg) {
> =C2=A0 =C2=A0int i =3D 0;
> =C2=A0 =C2=A0while(1) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if(i % 10000 =3D=3D 0) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf("Hello World %d\n", i=
);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fflush(stdout);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0i++;
> =C2=A0 =C2=A0}
> }
>
> void wait_some_time() {
> =C2=A0 =C2=A0int i;
> =C2=A0 =C2=A0for(i =3D 0; i < 10000000; i++) { }
> }
>
> int main(void) {
>
> =C2=A0 =C2=A0struct sigaction sa;
> =C2=A0 =C2=A0pthread_t thread1;
>
> =C2=A0 =C2=A0sa.sa_handler =3D suspend;
> =C2=A0 =C2=A0sa.sa_flags =3D SA_RESTART;
> =C2=A0 =C2=A0sigemptyset(&sa.sa_mask);
> =C2=A0 =C2=A0sigaction(SIGUSR1, &sa, NULL);
>
> =C2=A0 =C2=A0pthread_create(&thread1, 0, loop_func, 0);
> =C2=A0 =C2=A0wait_some_time();
>
> =C2=A0 =C2=A0pthread_kill(thread1, SIGUSR1);
> =C2=A0 =C2=A0printf("Waiting for terminate...\n");
> =C2=A0 =C2=A0wait_some_time();
>
> =C2=A0 =C2=A0return 0;
> }
>
> Could any body tell me why this signal handler hangs whole
> application? It should hangs only one thread. It seems to be be a bug
> in linux kernel or maybe in C library. How can I solve this problem?
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
