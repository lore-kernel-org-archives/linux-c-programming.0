From: "Vijayekkumaran.M" <m_vkumaran@yahoo.com>
Subject: SIGFPE captured repeatedly..
Date: Thu, 2 Sep 2004 04:36:48 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040902113648.10036.qmail@web41108.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

I am trying to write a small program which handles
SIGFPE..
The problem is that the handler is called infinitely..

Could somebody please tell me what I am missing..?
Please find the program below..

"Red Hat Linux release 7.3 (Valhalla)
Kernel 2.4.18-3 on an i686
gcc version 2.96"

Regards
Vijay

/*********************************************/
#include <signal.h>
#include <stdio.h>

void sig_s(int signo)
{
 printf("Hai Division by zero:Floation point
exception\n");
 /*signal(SIGFPE,sig_s);*/
}

#define BUFFER_SIZE 1024

int main()
{
 int i,j,z;
 char Buffer[BUFFER_SIZE];
 int x;
 FILE* fp = fdopen(0,"r");
 signal(SIGFPE,sig_s);
 
 for(x=0;x<5;x++)
 {
  fflush(fp);
  i=0;j=0;
  printf("Accepted i = %d and j= %d \n",i,j);
  z = i/j;
  printf("Result = %d\n",z);
 }
 return 0;
}
/*********************************************/


		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - Send 10MB messages!
http://promotions.yahoo.com/new_mail 
