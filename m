From: "Srinivas G." <srinivasg@esntechnologies.co.in>
Subject: Unable set the priority for a pthread through pthread_setschedparam
Date: Tue, 3 Feb 2009 10:18:34 +0530
Message-ID: <F5BA82141F7AA94885B9643C77EEA5F2103C73@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Dear All,

I have written a small thread program in C using the pthreads. I am able
to set the threads priority with pthread_setschedparam API when I login
as ROOT. If I login as a normal user other than ROOT, then the API
returns the error number 1 (EPERM). 

Please let me know whether a normal user can set the pthreads priority
with pthread_setschedparam API or not.

Here is the sample code for testing.

/* 
 * Creates two threads, one printing 10 "a"s, 
 * the other printing 10 "b"s.
 * Illustrates: thread creation, thread joining. 
 */

#include <stddef.h>
#include <stdio.h>
#include <unistd.h>
#include "pthread.h"
#include <errno.h>

void * process(void * arg)
{
  int i;
  fprintf(stderr, "Starting process %s\n", (char *) arg);
  for (i = 0; i < 10; i++) {
    write(1, (char *) arg, 1);
  }
  fprintf(stderr,"\n");

  return NULL;
}

int main()
{
  int retcode;
  pthread_t th_a, th_b;
  void * retval;
  struct sched_param sp;
  int esnRetVal = 0;
  pthread_attr_t attr;

  pthread_attr_init(&attr);
  pthread_attr_setinheritsched(&attr, PTHREAD_INHERIT_SCHED);
 
  retcode = pthread_create(&th_a, &attr, process, "a");
  if (retcode != 0) fprintf(stderr, "create a failed %d\n", retcode);

  sp.sched_priority = 30;
  esnRetVal = pthread_setschedparam(th_a, SCHED_RR, &sp);
  if(esnRetVal != 0)
  {
     printf("Failed to set the pthread sched param! esnRetVal = %d errno
= %d\n", esnRetVal, errno);
     return -1;
  } 

  retcode = pthread_create(&th_b, NULL, process, "b");
  if (retcode != 0) fprintf(stderr, "create b failed %d\n", retcode);

  retcode = pthread_join(th_a, &retval);
  if (retcode != 0) fprintf(stderr, "join a failed %d\n", retcode);

  retcode = pthread_join(th_b, &retval);
  if (retcode != 0) fprintf(stderr, "join b failed %d\n", retcode);

  return 0;
}

Thanks in advance.

With Regards,
Srinivas G
