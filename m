From: <Ganesh_Borse@Dell.com>
Subject: RE: SIGFPE captured repeatedly..
Date: Thu, 2 Sep 2004 17:18:57 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <BBE1167D4F12C74681106630ADE282B964A050@blrx2kmbgl303.blr.amer.dell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m_vkumaran@yahoo.com, linux-c-programming@vger.kernel.org

See 4th paragraph in Notes section in "man signal"

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of
Vijayekkumaran.M
Sent: Thursday, September 02, 2004 5:07 PM
To: linux-c-programming@vger.kernel.org
Subject: SIGFPE captured repeatedly..


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
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
