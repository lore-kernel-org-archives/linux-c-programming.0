From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: difference w.r.t time
Date: Mon, 27 Sep 2004 08:42:18 +0100 (BST)
Sender: gcc-help-owner@gcc.gnu.org
Message-ID: <20040927074218.3327.qmail@web52901.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <gcc-help-return-18047-gcc-help=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>
Cc: gcc <gcc-help@gcc.gnu.org>

i want to know why these programs dont give the same
output

i am trying to do benchmarking. 1st program is using
malloc and another array

i am not taking the allocations into account. i am
just looking for for loop

i dont understand why they show diff. time

thanks

ankit
******************************************
PROGRAM 1

#include<stdlib.h>
#include<stdio.h>
#include<sys/time.h>
#define NR 4096 
#define NC 4096 
#define N  NR*NC

int main()
{
   unsigned long i,j,k,d=2;
   double cont2=0,cont1=0,mean=0;
   struct timeval start,end; 
   double *a;//,*a1;
   a1=malloc(sizeof(double)*N);

   k=0;
   for (i = 0; i < NR; i++)
     {
       for (j = 0; j < NC; j++)
         {
          *(a+i+j) = k;
           mean = mean+*(a+i+j);
         }
     }
    mean = mean/( (float)NR*(float) NC);
	gettimeofday(&start,NULL);

/* here is the 2d contrast module*/

   for (i = 0; i<(NR-d); i++)
      {
       for (j = 0; j<(NC-d); j++)
         {
          cont2  = cont2
+(*(a+i+d+j)-*(a+i+j))*(*(a+i+d+j)-*(a+i+j))+
                       
+(*(a+i+j+d)-*(a+i+j))*(*(a+i+j+d)-*(a+i+j));
         }
      } 
       cont2 = cont2/(mean*mean);
       printf("contrast :(2D) %f\n", cont2);

	gettimeofday(&end,NULL);
	printf("Time :%ld ",(-start.tv_sec + end.tv_sec));

return 0;
}


*********************************************
Program 2

#include<stdlib.h>
#include<stdio.h>

#define NR 4096
#define NC 4096
#define N  (NR*NC)

int main()
{
   unsigned long i,j,k,d=2;
   double cont2=0,cont1=0,mean=0;
   double a[NR][NC]={},a1[N]={};
  struct timeval start,end;
   k=0;
   for (i = 0; i < NR; i++)
     {
       for (j = 0; j < NC; j++)
        {
          a[i][j] = k;
          mean = mean+a[i][j];
	}
     }
    mean = mean/( (float)NR*(float) NC);
   gettimeofday(&start,NULL);
// here is the 2d contrast module

    for (i = 0; i<(NR-d); i++)
      {
       for (j = 0; j<(NC-d); j++)
         {
          cont2  = cont2
+(a[i+d][j]-a[i][j])*(a[i+d][j]-a[i][j])+
                       
+(a[i][j+d]-a[i][j])*(a[i][j+d]-a[i][j]);
         }
      } 
       cont2 = cont2/(mean*mean);
       printf("contrast :(2D) %f\n", cont2);

gettimeofday(&end,NULL);
printf("Time :%ld",end.tv_sec - start.tv_sec);
return 0;
}


________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
