From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: exploitable code?
Date: Mon, 1 Jul 2002 07:45:10 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15647.64118.221277.377880@cerise.nosuchdomain.co.uk>
References: <20020701033859.B54653ECC@sitemail.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020701033859.B54653ECC@sitemail.everyone.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: xjnfx@doityourself.com
Cc: linux-c-programming@vger.kernel.org


jnf wrote:

> hi, ive got a question, is this code exploitable?
> 
> int main(int argc, char **argv) {
> char buf[256];
> 
> strcpy(buf,argv[1]);
> exit(1);
> }

Possibly.

> everything i read says yes, but i cant seem to get it. I don't see any
> way of overwriting esp for ret, so as far as i can tell i must go into
> the exit function, and exit comes before leave, so i cant land to arb. 
> code. So am I just dumb, or am I playing with code that isnt
> exploitable?

You have no idea what may be stored on the stack above main()'s stack
frame. It's quite possible that it contains data which will be used by
the run-time's termination code.

From the perspective of writing secure code, the solution is simply to
ensure that the buffer can't be overrun. From the perspective of
writing an exploit, you would need to understand the workings of the
run-time against which the program was linked.

-- 
Glynn Clements <glynn.clements@virgin.net>
