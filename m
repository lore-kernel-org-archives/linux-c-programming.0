From: Suciu Flavius <suciuflavius@tiscali.de>
Subject: Re: Memory Allocation Problem
Date: Wed, 15 Sep 2004 08:35:41 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <ci8ne4$j4k$1@sea.gmane.org>
References: <20040915060237.55405.qmail@web52910.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040915060237.55405.qmail@web52910.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org
Cc: gcc-help@gcc.gnu.org

1450 * 1450 * 8 = 16 MEGA!!!!!!!!!
So, you need a 16 mega of stack which I think is a little too much  ;)

The solution is to malloc() but check if you have 16 mega of ram ;)


Ankit Jain wrote:
>       1 #include <stdio.h>
>       2 int main()
>       3 {
>       4    double a[1450][1450];
>       5
>       6    a[1449][0] = 999;
>       7    printf( "%lf\n", a[1449][0] );
>       8    return 1;
>       9 }
> 
> 
> it gives segementation fault
> 
> if i use malloc also it gives wrong result
> 
> what to do?
> 
> ankit
> 
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping" 
> your friends today! Download Messenger Now 
> http://uk.messenger.yahoo.com/download/index.html
> 

