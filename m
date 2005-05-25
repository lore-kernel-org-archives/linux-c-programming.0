From: "K. Anantha Kiran" <ananth@cse.iitk.ac.in>
Subject: kerel level threads
Date: Wed, 25 May 2005 12:38:23 +0530
Message-ID: <42942467.9060805@cse.iitk.ac.in>
References: <20050524034750.70100.qmail@web51307.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050524034750.70100.qmail@web51307.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi all,
    Point me to appropiate group if this question doesnt fit here.
    Does pthread_create() create kernel level threads?
    I have created two threads A and B. Thread A was written to print 
some statement in an infinite loop, while Thread B was written to be 
blocked for some time(I have used sleep system call to block Thread B). 
If at all pthread_create() creates user level threads, Blocking of 
Thread B will also make Thread A to be blocked.  But  in my output, 
Thread A was continously printing even when Thread B was blocked.  My 
observation is that either both of the threads be Kernel level threads 
or pthread library has given wrapper functions for blocking calls(for 
example, sleep system call in our case) which stop all of the threads to 
be blocked.  I read in text books that pthread libray is for creating 
user level threads(threads about which kernel is not aware of).

       I coudnt find the source for pthread library to clarify above 
doubts. Please help me in this.

Regards,
Ananth
----------------------------
My program:

#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
// this function continously prints messages
// in order to show its execution
void* f (void* a) {
    while (1)
        printf ("f():\n");
    return NULL;
}
// this functin sleeps for some time
void* g (void* b) {
    printf ("g():\n");
    sleep (1);
    printf ("g(): sleeping over\n");
    return NULL;
}
int main (void) {
    pthread_t thread1,thread2;
    //creating thread to print messages
    if (pthread_create (&thread1, NULL, (void*)f, NULL)) {
        perror("pthread_create():");
        pthread_exit(NULL);
    }
    // creating thread to sleep(or block) for a while
    if (pthread_create (&thread2, NULL, (void*)g, NULL)) {
        perror("pthread_create():");
        pthread_exit(NULL);
    }
    printf ("main thread pid %d\n", getpid());
    pthread_exit(NULL);
}
