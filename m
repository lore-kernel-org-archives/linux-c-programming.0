From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: Monitoring a program
Date: Mon, 1 Mar 2004 21:39:09 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000901c3ffff$8a57f770$ed64a8c0@descartes>
References: <183D9E9B.3D6733E9.0000FADF@aol.com>
Reply-To: "John T. Williams" <jtwilliams@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Llfrg@aol.com, linux-c-programming@vger.kernel.org

I'm not sure what you mean by every part of the execution.

however you could do a very simple program in that record the exicution time
of its child process.

----------------main.c-------------------------------
#include <sys/times.h>
#include <sys/param.h>
#include <wait.h>

char* prog = "/bin/bash";
char* arglist[] = {
 "bash",
 0
};


int main () {
 int pid, status;
 struct tms systime;
 time_t point[2];
 int elaps;
 int ktime;
 int utime;
 int ttime;
 int itime;

 time(&point[0]);
 if( (pid = fork()) == 0 ) {
  execv(prog, arglist);
  printf("execv error\n");
  _exit(0);
 }

 wait(&status);
 time(&point[1]);
 times(&systime);


 elaps = point[1] - point[0];
 ktime = systime.tms_cstime / HZ;
 utime = systime.tms_cutime / HZ;
 ttime = ktime + utime;
       itime = elaps - ttime;

 printf("total time for of exicution: %i\n", ttime);
 printf("time in kernel for process:  %i\n", ktime);
 printf("time in user space:          %i\n", utime);
 printf("idile time:                  %i\n", itime);
 printf("total elaps time:            %i\n", elaps);


}
-------------End main.c--------------------------------












----- Original Message ----- 
From: <Llfrg@aol.com>
To: ""John T. Williams"" <jtwilliams@vt.edu>
Sent: Monday, March 01, 2004 7:21 PM
Subject: Re: Monitoring a program


> Ok, but I would like to have specific information on every part of the
execution, not only the total time. The objective of all this is to have a
profiling tool that measures performance of parallel programs. I wish to
find out load imbalance on different processors at different times on the
execution of parallel programs. I intend to run the profiling program on
every node and then compare their statistics.
>
> Thanks,
> Leonardo.

