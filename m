From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: timer->result
Date: Tue, 28 Sep 2004 15:59:24 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E30661138539@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Ankit Jain' <ankitjain1580@yahoo.com>, linux prg <linux-c-programming@vger.kernel.org>

Ankit wrote:

> #include<stdio.h>
> #include<sys/time.h>
> #include<time.h>

> int main(void)
> {
>         struct timeval t1,t2,result;
>         gettimeofday(&t1,NULL);
>         usleep(500);
>         gettimeofday(&t2,NULL);
>         timersub(&t2,&t1,&result);
>         printf("%ld",result.tv_usec);
>}
>now technically i feel it should display 500
>microsecond even not accurate then also it should show
>near by 500 or less than 600 microsecond atleast.

Why?

A quick glance at the man page for usleep reveals:

"BUGS

 Probably not acurate on many machines down to the 
 microsecond.  Count on precision only to -4 or maybe
 -3.
"

You may want to try using  `nanosleep', but first read
the man-page, paying close attention to the BUGS section.

Also the first sentence from the DESCRIPTION section is 
particularly informative:

"nanosleep delays the exection of the program for at 
 least the time specified in *req."


Something else to consider.  Linux is a multi-tasking operating 
system, meaning that while your process is sleeping it is swapped 
out an another process executed.  As an example, consider the 
following program:

#include <time.h>
#include <stdio.h>
#include <sys/time.h>
#include <unistd.h>

/* this program must be linked with librt */

int main(int argc, char** argv)
{
   long              timediff;
   struct timespec   tpstart;
   struct timespec   tpend;
   struct timeval    tpsleep;

   tpsleep.tv_sec = 0;
   tpsleep.tv_usec = 100;

   clock_gettime(CLOCK_REALTIME, &tpstart);

   select(0, NULL, NULL, NULL, &tpsleep);

   clock_gettime(CLOCK_REALTIME, &tpend);

   timediff = MILLION*(tpend.tv_sec - tpstart.tv_sec) + 
                      (tpend.tv_nsec - tpend.tv_nsec) / 1000;

   printf("Select took %ld micorseconds\n", timediff);
}

On my system this returned the following values:

Select took 1444 micorseconds
Select took 467 micorseconds
Select took 15983 micorseconds
Select took 14589 micorseconds
Select took 8730 micorseconds
Select took 21619 micorseconds
Select took 13304 micorseconds
Select took 8764 micorseconds
Select took 21604 micorseconds
Select took 7117 micorseconds

Look at the large differences in the reported time.  I would suspect that 
for the large differences another process was swapped in and ran for its 
alotted `quanta'.  Maybe if this process was switched to a higher priority
the timing values would be different.

Just out of curosity? what are you trying to do?

George


   
