From: =?iso-8859-1?q?Ankit=20Jain?= <ankitjain1580@yahoo.com>
Subject: Re: complex variable
Date: Mon, 6 Sep 2004 17:25:32 +0100 (BST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040906162532.22345.qmail@web52904.mail.yahoo.com>
References: <20040906134525.33692.qmail@web52908.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040906134525.33692.qmail@web52908.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

 
>       1 #include<stdlib.h>
>       2 #include<complex.h>
>       3 #include<stdio.h>
>       4
>       5 int main()
>       6 {
>       7         FILE *fp;
>       8         fp=fopen("test_data.dat","rb");
>       9         int N=32,i=0;
>      10         complex x,*in;
>      11         in=malloc(sizeof(complex)*N);
>      12         if (fread(in,16,32,fp) != 32)
>      13          printf("error in reading from file
> failed\n");
>      14         else{
>      15         for(i=0;i<N;i++)
>      16           printf("%lf\t",*(in+i+0));
>      17         }
>      18         return 0;
>      19 }
> 
> i am sorry but this code also gives the same error
> 
> error in reading from file failed
> 
> ankit

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
