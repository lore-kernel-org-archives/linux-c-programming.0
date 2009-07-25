From: =?ISO-8859-2?Q?Mirski_Pawe=B3?= <mirskip87@gmail.com>
Subject: Re: Problem with infinite loop in signal handler
Date: Sat, 25 Jul 2009 07:34:11 +0200
Message-ID: <62c21b850907242234r5ec8f6f9tc8ccb2e412306312@mail.gmail.com>
References: <62c21b850907220942p60fd9362kcbd82158ce685dd8@mail.gmail.com>
	 <9b6278b80907221331m39d4adf0oc6cd8057d9cd6565@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=D97RjQ6BJ05oV5dy4CYnfZARAWkafQh/DGQd2u/u/JA=;
        b=ua1iP58iOYkMHFefTCXXyjj9DCqtwRj5G9lqbrYSRRtKRm4aJCz9VHtI3rxUDGb80d
         VQC98Cog8NPA9urN97FtCcDouqlA8xANnPMdrYxYV0mh8RdulKeU9TI+gsJsTv74lSWC
         Z9vKrf04rOiJwYtPHr4ej4As0rGG+Xw+ypEe4=
In-Reply-To: <9b6278b80907221331m39d4adf0oc6cd8057d9cd6565@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

I have found another problem, but your solution can improve situation I=
 think.
When I have removed printf after pthread_kill program works. I thinks
scenario is:
1. Signal arrives when printf still works
2. Printf (or system) has locked some structeres associated with stream
3. Then thread1 is suspended so printf will never return and never
unlock theese structures
4. In main thread printf blocks on stdout stream.

To check my concept I have used fprintf to stderr and it does't blocks
main thread. Only prints to stdout does.
What are you thinking about this concept?

W dniu 22 lipca 2009 22:31 u=BFytkownik Gedare Bloom
<gedare@gwmail.gwu.edu> napisa=B3:
> The problem is that the thread looping in the signal handler has equa=
l
> priority to the 'main' thread, so that it is exhausting all of the
> compute resources and the main thread is never scheduled.
>
> You can correct this by giving your newly created thread a lower
> priority (see below). =A0Good luck!
>
> -G
>
> --- orig.c =A0 =A0 =A02009-07-22 16:28:44.000000000 -0400
> +++ test.c =A0 =A0 =A02009-07-22 16:28:02.000000000 -0400
> @@ -1,5 +1,6 @@
> =A0#include <signal.h>
> =A0#include <stdio.h>
> +#include <sched.h>
>
> =A0void suspend(int sig) {
> =A0 =A0printf("suspending\n");
> @@ -28,6 +29,8 @@
>
> =A0 =A0struct sigaction sa;
> =A0 =A0pthread_t thread1;
> + =A0 =A0 =A0 struct sched_param sp;
> + =A0 =A0 =A0 int policy;
>
> =A0 =A0sa.sa_handler =3D suspend;
> =A0 =A0sa.sa_flags =3D SA_RESTART;
> @@ -35,6 +38,9 @@
> =A0 =A0sigaction(SIGUSR1, &sa, NULL);
>
> =A0 =A0pthread_create(&thread1, 0, loop_func, 0);
> + =A0 =A0 =A0 pthread_getschedparam(thread1, &policy, &sp);
> + =A0 =A0 =A0 sp.sched_priority =3D sched_get_priority_min(policy);
> + =A0 =A0 =A0 pthread_setschedparam(thread1, policy, &sp);
> =A0 =A0wait_some_time();
>
> =A0 =A0pthread_kill(thread1, SIGUSR1);
> @@ -43,4 +49,3 @@
>
> =A0 =A0return 0;
> =A0}
> -
>
>
> 2009/7/22 Mirski Pawe=B3 <mirskip87@gmail.com>:
>> Hi all,
>> I have problem with handling signals in simple program. Program star=
ts
>> one thread (only task of this thread is printing "Hello World") and
>> after while sends signal to this thread (signal handler is previousl=
y
>> registered). In signal handler is infinite loop that should suspend
>> thread forever. But it suspends whole application. I think this
>> problem is related with printf function because when I replace it wi=
th
>> with linux write sys function problem does not occures. And one more
>> info: problem occures not always, but most of time; maybe somewhere
>> there is a race condition.
>> This is whole code of application:
>>
>> #include <signal.h>
>> #include <stdio.h>
>>
>> void suspend(int sig) {
>> =A0 =A0printf("suspending\n");
>> =A0 =A0fflush(stdout);
>> =A0 =A0while(1);
>> }
>>
>>
>> void* loop_func(void* arg) {
>> =A0 =A0int i =3D 0;
>> =A0 =A0while(1) {
>> =A0 =A0 =A0 =A0if(i % 10000 =3D=3D 0) {
>> =A0 =A0 =A0 =A0 =A0 =A0printf("Hello World %d\n", i);
>> =A0 =A0 =A0 =A0 =A0 =A0fflush(stdout);
>> =A0 =A0 =A0 =A0}
>> =A0 =A0 =A0 =A0i++;
>> =A0 =A0}
>> }
>>
>> void wait_some_time() {
>> =A0 =A0int i;
>> =A0 =A0for(i =3D 0; i < 10000000; i++) { }
>> }
>>
>> int main(void) {
>>
>> =A0 =A0struct sigaction sa;
>> =A0 =A0pthread_t thread1;
>>
>> =A0 =A0sa.sa_handler =3D suspend;
>> =A0 =A0sa.sa_flags =3D SA_RESTART;
>> =A0 =A0sigemptyset(&sa.sa_mask);
>> =A0 =A0sigaction(SIGUSR1, &sa, NULL);
>>
>> =A0 =A0pthread_create(&thread1, 0, loop_func, 0);
>> =A0 =A0wait_some_time();
>>
>> =A0 =A0pthread_kill(thread1, SIGUSR1);
>> =A0 =A0printf("Waiting for terminate...\n");
>> =A0 =A0wait_some_time();
>>
>> =A0 =A0return 0;
>> }
>>
>> Could any body tell me why this signal handler hangs whole
>> application? It should hangs only one thread. It seems to be be a bu=
g
>> in linux kernel or maybe in C library. How can I solve this problem?
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-c-pr=
ogramming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
