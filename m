From: Andrej Gelenberg <andrej.gelenberg@udo.edu>
Subject: Re: float
Date: Tue, 11 Jan 2011 09:38:17 +0100
Message-ID: <4D2C16F9.4050607@udo.edu>
References: <AANLkTikyOX3yeh4Xo5vrax651djd_rkQuPy_vm30AZhM@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <AANLkTikyOX3yeh4Xo5vrax651djd_rkQuPy_vm30AZhM@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi,

you can not check if 2 float are equal, you should check if it in the range:

On 01/11/2011 08:38 AM, ratheesh k wrote:
> I could not understand  why it getting printed like this. Could any
> body tell me.
>
> #include<stdio.h>
>

#define ABS(x) ((x) < 0 ? -(x) : (x))
#define MAX(a, b) ((a) > (b) ? (a) : (b))
const float precision = 0.001f;

> int main()
> {
>          float f=0.0f;
>          int i;
>
>          for(i=0;i<10;i++)
>                  f = f + 0.1f;
>
            if ( ABS(f - 1.0f) < precision )
>                  printf("f is 1.0 \n");
>          else
>                  printf("f is NOT 1.0\n");
>
>          return 0;
> }

Here more to that topic: 
https://www.securecoding.cert.org/confluence/display/seccode/FLP35-C.+Take+granularity+into+account+when+comparing+floating+point+values

Here more about c pitfalls: 
https://www.securecoding.cert.org/confluence/display/seccode/CERT+C+Secure+Coding+Standard

Regards,
Andrej Gelenberg
