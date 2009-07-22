From: =?ISO-8859-2?Q?Mirski_Pawe=B3?= <mirskip87@gmail.com>
Subject: Problem with infinite loop in signal handler
Date: Wed, 22 Jul 2009 18:42:45 +0200
Message-ID: <62c21b850907220942p60fd9362kcbd82158ce685dd8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=kuLPafx3HN8Pl1A1pngC/dEDFmCyCBvgwSUcWW9DuUs=;
        b=YK45lXahMG3N3JgecSPAHNfKJudxGcGxuZwzLZ1xfUy3lJceMKt1s05N224H51vljU
         KrxFS5KXUj2amQj2k5QZR7BpErJ4p8nBdf09CNkd4PVOTk7nQkESx4g9+rNWrodLFbBH
         9HGOwf8ByebtzdjW3hgkhU36Vo6H/ZhJkwCgc=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all,
I have problem with handling signals in simple program. Program starts
one thread (only task of this thread is printing "Hello World") and
after while sends signal to this thread (signal handler is previously
registered). In signal handler is infinite loop that should suspend
thread forever. But it suspends whole application. I think this
problem is related with printf function because when I replace it with
with linux write sys function problem does not occures. And one more
info: problem occures not always, but most of time; maybe somewhere
there is a race condition.
This is whole code of application:

#include <signal.h>
#include <stdio.h>

void suspend(int sig) {
    printf("suspending\n");
    fflush(stdout);
    while(1);
}


void* loop_func(void* arg) {
    int i = 0;
    while(1) {
        if(i % 10000 == 0) {
            printf("Hello World %d\n", i);
            fflush(stdout);
        }
        i++;
    }
}

void wait_some_time() {
    int i;
    for(i = 0; i < 10000000; i++) { }
}

int main(void) {

    struct sigaction sa;
    pthread_t thread1;

    sa.sa_handler = suspend;
    sa.sa_flags = SA_RESTART;
    sigemptyset(&sa.sa_mask);
    sigaction(SIGUSR1, &sa, NULL);

    pthread_create(&thread1, 0, loop_func, 0);
    wait_some_time();

    pthread_kill(thread1, SIGUSR1);
    printf("Waiting for terminate...\n");
    wait_some_time();

    return 0;
}

Could any body tell me why this signal handler hangs whole
application? It should hangs only one thread. It seems to be be a bug
in linux kernel or maybe in C library. How can I solve this problem?
