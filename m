From: "Uday K Verma" <udayv@netsoftglobal.com>
Subject: RE: thread programming
Date: Fri, 2 Apr 2004 17:49:04 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <S263590AbUDBMTZ/20040402121925Z+476@vger.kernel.org>
References: <c4jk69$toj$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <c4jk69$toj$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'MuthuKumar' <ramana_muthu@yahoo.co.in>, linux-c-programming@vger.kernel.org

I seriously believe you need a C programming book before you delve into
threads. 

Uday K Verma 
//

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
Status of a mail from <172.16.1.46 | 00-0B-CD-2A-98-69> Checked by AVG
anti-virus system (http://www.grisoft.com).
Version: 6.0.648 / Virus Database: 415 - Release Date: 3/31/2004



-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
