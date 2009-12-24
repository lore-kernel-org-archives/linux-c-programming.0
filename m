From: Randi Botse <nightdecoder@gmail.com>
Subject: thread: reentrant question
Date: Thu, 24 Dec 2009 13:41:30 -0500
Message-ID: <34e1241d0912241041v60c031a2kc31fdb3b4ebbd317@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=PwYWgfEe0l4SGQKI3KgUlaV6kmPpwSmZEcdS96fy8C0=;
        b=H/gDeSGLshnMO9QT1MJxQs2hQJBzTwVQeUSRhPk/3fVYjY1/MVyU5rtOOuWXt/hZ/v
         LefPZcxSARqjAq6TUjIqWyu7+EMiOhlgpZirA5z2FiT/XP3e5bAxCzxBJrvQTRSCXysh
         F8fv90deo2+AW+RQ0Rjjkc825aHc2/mNl2dwM=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi all,

I'm now learning thread reentrancy on Linux, so i write simple codes
for demonstration:

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void *func(void *data)
{
    char *ptr;

    ptr = malloc(8);
    printf("thread%i -> ptr at: %p\n", *(int*) data, ptr);
    free(ptr);
    return NULL;
}

#define NTHREAD 5

int main(void)
{
    pthread_t thread[NTHREAD];
    int i;

    for (i = 0; i < NTHREAD; i++)
        if (pthread_create(&thread[i], NULL, func, (void*) &i))
            return -1;
    for (i = 0; i < NTHREAD; i++)
        pthread_join(thread[i], NULL);
    return 0;
}


I know the func() function is not reentrant, worst printf() debugging
told me that's each thread pointer to character (ptr) may has same
address, like this output:

thread1 -> ptr at: 0x9a80128
thread1 -> ptr at: 0x9a80138
thread2 -> ptr at: 0x9a801d8
thread4 -> ptr at: 0x9a801d8
thread4 -> ptr at: 0x9a801d8

I try to modify the func() by not free ptr to be:

void *func(void *data)
{
    char *ptr;

    ptr = malloc(8);
    printf("thread%i -> ptr at: %p\n", *(int*) data, ptr);
    /* free(ptr); */
    return NULL;
}

And the result is i always got different address of each thread's ptr, such as:

thread0 -> ptr at: 0x8db2098
thread1 -> ptr at: 0x8db2138
thread2 -> ptr at: 0x8db21d8
thread3 -> ptr at: 0x8db2278
thread4 -> ptr at: 0x8db2318

Can you explain me why this happen? how about my printf() debugging
method? it's works for this demonstration?
Thanks before.

              - Randi
