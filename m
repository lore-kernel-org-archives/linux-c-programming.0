From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re:
Date: Tue, 14 Sep 2004 23:26:03 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <41470D8B.3040604@hq.ntsp.nec.co.jp>
References: <20040913111103.77851.qmail@web52901.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040913111103.77851.qmail@web52901.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: gcc <gcc-help@gcc.gnu.org>, linux prg <linux-c-programming@vger.kernel.org>

here 's an example of static and dynamic allocation...
(my prev example was only about single dimensional arrays...)

a 2dimensional array of  4450 x 4450
(change the dimension to 1450 x 1450 if  u find the
first size to be too big)

TEST.C
#include <stdio.h>
int main()
{
  double a[4450][4450];

  a[4449][0] = 999;
  printf( "%lf\n", a[4449][0] );
  return 1;
}


TEST2.c
#include <stdio.h>
int main()
{
  double **a;
  int i;

  a = (double**) calloc( 4450, sizeof(double*) );
  for ( i=0; i <1450; i++ )
  {
    a[i] = (double*) calloc( 4450, sizeof(double) );
  }

  a[4449][0]=999;
  printf( "%lf\n", a[4449][0] );
  return 1;
}




Ankit Jain wrote:

>hi
>
>well i am fixed up in a new problem
>
>i am using a array of size 1024*1024
>
>it gives segmentation fault
>
>it works with 512*512
>
>my menory size is 128 mb and 512 swap
>
>i have enough memory space and using gcc 3.2 v
>
>may be i need to increase the memory size
>
>how to do that?
>
>ankit
>
>________________________________________________________________________
>Yahoo! Messenger - Communicate instantly..."Ping" 
>your friends today! Download Messenger Now 
>http://uk.messenger.yahoo.com/download/index.html
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>

