From: "MuthuKumar" <ramana_muthu@yahoo.co.in>
Subject: thread programming
Date: Fri, 2 Apr 2004 17:22:42 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <c4jk69$toj$1@sea.gmane.org>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hai All.

I have tried the basic thread program as

#include <stdio.h>
#include <pthread.h>
#include <errno.h>

void *fun()
{
        printf("Hai\n");
        pthread_exit((void *)8);
}

main()
{
pthread_t t[10];
int res,ret;
int i=0,loop=10;
for(i=0;i<loop;i++)
{
t[i]=(pthread_t)malloc(sizeof(pthread_t));
res=pthread_create(&t[i],NULL,fun,NULL);
ret=pthread_join(t[i],(void *)res);
free(t[i]);
}
}

Is it a good way of programming. Or any other effective to do this basic
program.

Thanks for the Reply!
--
Regards,
Muthukumar.



---
Status of a mail from <172.16.1.46 | 00-0B-CD-2A-98-69>
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.648 / Virus Database: 415 - Release Date: 3/31/2004



