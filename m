From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: complex variable
Date: Wed, 8 Sep 2004 11:59:48 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <chml6d$kri$1@sea.gmane.org>
References: <E3E30069B061524E90BCEE4417E30661138525@monm207.monmouth.army.mil>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

"Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil> wrote
in message
news:E3E30069B061524E90BCEE4417E30661138525@monm207.monmouth.army.mil...
> #include<stdlib.h>
> #include<complex.h>
> #include<stdio.h>
> #include<errno.h>
>
> int main()
> {
>     FILE* fp=NULL;

The extra initialization to NULL is useless, as JBG points out, as a few
other ones (i, in) and even some unused variables (x)

>     char  szName[] = "test_data.dat";

This is quite inefficient : declaring a local initialized array will produce
equivalent code to:

  char szName[sizeof("test_data.dat")];
  memcpy(szName, "test_data.dat", sizeof("test_data.dat"));

Whereas declaring a const char* fileName = "test_data.dat" will likely get
optimized by the compiler as not even storing the address into a local
variable.

>
>     if(NULL != (fp = fopen(szName, "rb")))

This style is really ugly!  there is really no advantage at combining the
assignment and the test:
   fp = fopen(fileName, "rb");
   if (fp != NULL) {

>     {
>         int N=32, i=0;
>         complex x, *in = NULL;

Are you sure about the complex type implementation ?
Are the real and imaginary parts float, double, of even long double ?
Reading them in bulk from the file is definitely not advisable, because of
this and because of byte ordering issues.

>   if(NULL != (in=malloc(sizeof(complex)*N)))

N as the uppercase name implies seems to be a constant in this code...
why not make it a const outside this block and declare in as a local array
instead of allocating it off the heap.

>         {
>             if(N == fread(in, sizeof(complex), N, fp))
>             {
>                 for(i=0; i< N; i++)
>                     printf("%lf\t", in[i]);

What does this mean ?
C99 makes no difference between %f and %lf
I'm not sure what passing a complex to printf will actually do.  Most lilely
not what you want and definitely not portable.

>             }
>             else
>             {
>                 fprintf(stderr, "Read failed. error: %d\n%s\n", errno,
> strerror(errno));
>             }
>         }
>         else
>         {
>             fprintf(stderr, "Failed to allocate space for buffer\n");
>         }
>     }
>     else
>     {
>         fprintf(stderr, "Failed to open %s. Error %d\n%s\n",
>                 szName, errno, strerror(errno));
>     }
>
>     return 0;
> }

Cheers,

Chqrlie.



