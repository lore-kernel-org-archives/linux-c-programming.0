From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: complex variable
Date: Tue, 7 Sep 2004 11:37:06 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E30661138525@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
Hi,

In addition to the previously given suggestions, I would suggest checking
the return 
value of fopen (it can fail), as well as printing out the error codes.  For
example,
I would recode the above as (note - this is uncompiled/tested code but is
should
give an example of what I mean):

#include<stdlib.h>
#include<complex.h>
#include<stdio.h>
#include<errno.h>

int main()
{
    FILE* fp=NULL;
    char  szName[] = "test_data.dat";

    if(NULL != (fp = fopen(szName, "rb")))
    {
        int N=32, i=0;
        complex x, *in = NULL;
	  if(NULL != (in=malloc(sizeof(complex)*N)))
        {
            if(N == fread(in, sizeof(complex), N, fp))
            {
                for(i=0; i< N; i++)
                    printf("%lf\t", in[i]);
            }
            else
            {
                fprintf(stderr, "Read failed. error: %d\n%s\n", errno,
strerror(errno));
            }
        }
        else
        {
            fprintf(stderr, "Failed to allocate space for buffer\n");
        }
    }
    else
    {
        fprintf(stderr, "Failed to open %s. Error %d\n%s\n", 
                szName, errno, strerror(errno));
    }

    return 0;
}   
