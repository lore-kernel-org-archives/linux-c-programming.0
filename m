From: Jeff Woods <kazrak+kernel@cesmail.net>
Subject: Re: convert INT to CHAR but print's BEEP...
Date: Wed, 12 Nov 2003 22:36:48 -0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.2.1.1.0.20031112211508.02f5c098@no.incoming.mail>
References: <20031110173743.GA975@velka.phys.uoa.gr> <Pine.LNX.4.21.0311120519210.31743-100000@hestia>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0311120519210.31743-100000@hestia>
References: <20031110173743.GA975@velka.phys.uoa.gr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org

At 11/12/2003 05:35 AM +0100, J. wrote:
>Hello, I have kind of a problem with converting an int to a char. The 
>get_rand_str() function returns an string build of random charaters with a 
>max length of int `MAX'.

I'm sure there are faster algorithms, but how about something simple like:

#include <stdlib.h>

typedef unsigned char   U8;
typedef unsigned short  U16;

/* Set <buf_len> bytes at <buf> to random values from <low> to <high>. */
void set_rand_buf(char *buf, size_t buf_len, U8 low, U8 high) {
     U8 range = high - low + 1;
     while (buf_len--)
         *buf++ = low + (U8)((range*rand())/(RAND_MAX+1.0));
}

/* Sample calls */

#include <assert.h>

int main(void) {
     char        buf[80];
     size_t      k;

EXAMPLE_1:
     /* Completely fill buf with random data; may include embedded nulls */
     set_rand_buf(buf, sizeof buf, 0, 255);
     for (k = 0; k < sizeof buf; k++)
         printf("byte[%3d]=%3hu\n", k, (U16)buf[k]);

EXAMPLE_2:
     set_rand_buf(buf, 50, '0', '9');    /* Get 50 random ASCII digits. */
     buf[50] = 0;        /* Null-terminate the string. */
     printf("50 digits: %s\n", buf);

EXAMPLE_3:
     set_rand_buf(buf, 26, 'a', 'z');    /* Get 26 random lower-case 
letters. */
     buf[26] = 0;        /* Null-terminate the string. */
     printf("26 letters: %s\n", buf);

EXAMPLE_4:
#DEFINE LEN 27
     /* Get LEN random hex digits in ASCII */
     assert(LEN < sizeof buf);
     set_rand_buf(buf, LEN, 0, 15);      /* First get LEN hex values */
     {   /* Convert hex values from binary to ASCII */
         char *ptr = buf + LEN;
         while (ptr-- > buf)
             *ptr = (*ptr >= 10) ? ('a' - 10 + *ptr) : ('0' + *ptr);
     }
     buf[LEN] = 0;       /* Null-terminate as a string. */
     printf("hex digits %s\n", buf);


     return 0;   /* No-error program exit */
}

P.S.  The above code has never been compiled, so there may be all kinds of 
typos or other errors present.

--
Jeff Woods <kazrak+kernel@cesmail.net> 


