From: Mehran Rezaei <mehran@cs.unt.edu>
Subject: timing
Date: Wed, 01 May 2002 11:51:22 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <aap6j9$9uv$2@main.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: C news group <linux-c-programming@vger.kernel.org>, gcc news group <linux-gcc@vger.kernel.org>

Hello dear all,
For the sake of performance analysis of some programs, I am using
clock() function call. I am running the programs on a linux box (Redhat
7.2, and my machine is i686).
However, I am not getting the correct results as I expected. Perhaps I
miss something necessary for using timing function calls.
Here is a code fragment that I am testing:
/***************************************************************/
#include <sys/types.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <assert.h>
#define TEST 8
main(){
    int i=1;
    int size=5*8000;
    void *pBreak,*newBreak;
    time_t time1,time2;
    clock_t start,finish,elapsed;
    start=clock();
    time(&time1);
    sleep(10);
    1 << i;
    for(i=0;i<100;i++){
        printf("%x %d\n",-TEST,(1 << i));
        if (1 << i == 8192) break;
    }
    printf("%d \n",size >> i);
    i=brk(pBreak);
    assert(i == 0);
    newBreak=sbrk(1024);
    finish=clock();
    elapsed=finish-start;
    time(&time2);
    printf("Exec Time from clock()    =
%f\n,(double)(finish-start)/(double)CLOCKS_PER_SEC);
    printf("Exec Time from difftime() = %lf\n",difftime(time2,time1));
}
/*****************************************************************************/

To my understanding both printfs should at least show 10 seconds
(because of "sleep(10)"). But they do not.
Note that I am not looking for so called Wall-Clock (total program
execution), for which I can use system calls. I should stick to a
function call that enables me to monitor the execution time of only some
of the functions in my programs (for my specific purpose).
Do you see any problem with my simple program? Is there anyway that I
can get perhaps better resolution on CPU time or elapsed time?
Your help and concern is appreciated.
So long,

Mehran

