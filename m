From: "William N. Zanatta" <william@veritel.com.br>
Subject: Re: having probs with files > 2G
Date: Fri, 24 May 2002 12:14:06 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3CEE58BE.2030600@veritel.com.br>
References: <3CEE5113.1000702@eWave.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Ackermann <Thomas.Ackermann@eWave.at>
Cc: linux-c-programming@vger.kernel.org

Thomas Ackermann wrote:
> hi!
> i hope i'm not off topic with this, but, i'having problems with some 
> split-like program i'm writing at the moment.
> 
> when opening files > 2GB the program freezes when data is read from the 
> file the first time.
> had it already working before with a buffer size of (char)1 before but 
> that went really slow..
> 
> source code is attached, please help..
> 
> thx, thomas
> 
> 

You should use
   unsigned long long int var;

and

   the %llu modifier in your printf's and stuffs like that...

This illustrates your problem...
------------------------[ cut here ]---------------------------
#include <stdio.h>

int main() {


   unsigned long long int x = 0;
   unsigned int y = 0;
   x--;
   y--;

   printf("New Limit:    [%llu]\nActual Limit: [%u]\n", x,y/2);

   return(0);
}
------------------------[ cut here ]---------------------------

Of course you MUST NOT rely only in the %ull limit as you also have a 
limit in the filesystem but if you know how to deal with it, you will 
get everything working fine. =]

William

-- 
Perl combines all of the worst aspects of BASIC, C and line noise.
                 -- Keith Packard

