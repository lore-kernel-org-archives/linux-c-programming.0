From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: Re: exploitable code?
Date: Sun, 30 Jun 2002 21:44:12 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.1.0.14.0.20020630214141.00a96040@fluent2.pyramid.net>
References: <20020701033859.B54653ECC@sitemail.everyone.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020701033859.B54653ECC@sitemail.everyone.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: xjnfx@doityourself.com, linux-c-programming@vger.kernel.org

At 08:38 PM 6/30/02 -0700, jnf wrote:
>hi, ive got a question, is this code exploitable?
>
>int main(int argc, char **argv) {
>char buf[256];
>
>strcpy(buf,argv[1]);
>exit(1);
>}
>
>everything i read says yes, but i cant seem to get it. I don't see any way 
>of overwriting esp for ret, so as far as i can tell i must go into the 
>exit function, and exit comes before leave, so i cant land to arb. code. 
>So am I just dumb, or am I playing with code that isnt exploitable?
>
>fyi, this isnt an actual program but a program created for educational 
>purposes.
>thx

The exit function may well be a "long jump" that uses the return value for 
the function "main" as its target.  Therefore, when the exploiting code 
overwrites the return address for "main" the "exit" call will use the 
overwritten value.

Too bad people aren't required as a matter of course to look at the 
assembler output of code from compilers anymore.  You learn a lot seeing 
how your statements get translated to machine code.

Satch

