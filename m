From: =?iso-8859-1?q?Ankit=20Jain?= <ankitjain1580@yahoo.com>
Subject: Re: Memory Allocation Problem
Date: Wed, 15 Sep 2004 07:34:47 +0100 (BST)
Sender: gcc-help-owner@gcc.gnu.org
Message-ID: <20040915063447.74013.qmail@web52904.mail.yahoo.com>
References: <4147E06B.4030303@redpinesignals.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <gcc-help-return-17892-gcc-help=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
In-Reply-To: <4147E06B.4030303@redpinesignals.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sriharsha Vedurmudi <sriharsha.v@redpinesignals.com>, gcc <gcc-help@gcc.gnu.org>, linux prg <linux-c-programming@vger.kernel.org>

 --- Sriharsha Vedurmudi
<sriharsha.v@redpinesignals.com> wrote: 
> 
> Ankit Jain wrote:
> 
> >      1 #include <stdio.h>
> >      2 int main()
> >      3 {
> >      4    double a[1450][1450];
> >      5
> >      6    a[1449][0] = 999;
> >      7    printf( "%lf\n", a[1449][0] );
> >      8    return 1;
> >      9 }
> >

well i am sorry its return 0 only

i have 128 mb RAM. it gives segmentation fault while
running

i tried it on 512 MB Ram also it gives segemntation
fault. around 400 MB of Ram was free when i tried to
run that program

thanks 
ankit
> >
> >it gives segementation fault
> >  
> >
> I tried, but it ran well. Except ofcourse, I changed
> "return 1" to 
> "return 0" (you dont want to return an error from
> Main)
> 
> >if i use malloc also it gives wrong result
> >
> >what to do?
> >  
> >
> I guess your system is lacking the memory required
> to allocate 1450 * 
> 1450 * 4 bytes on stack. Try making it static.
> 
> -Harsha.
> 
> >ankit
> >
>
>________________________________________________________________________
> >Yahoo! Messenger - Communicate instantly..."Ping" 
> >your friends today! Download Messenger Now 
> >http://uk.messenger.yahoo.com/download/index.html
> >  
> >
>  

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
