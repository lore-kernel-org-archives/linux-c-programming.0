From: jnf <xjnfx@doityourself.com>
Subject: Re: exploitable code?
Date: Sun, 30 Jun 2002 21:52:22 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020701045222.F276B2756@sitemail.everyone.net>
Reply-To: xjnfx@doityourself.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

>The exit function may well be a "long jump" that uses the return value for 
>the function "main" as its target.  Therefore, when the exploiting code 
>overwrites the return address for "main" the "exit" call will use the 
>overwritten value.

every value i overwrite is pushed onto the stack and the next used again, the overwritten ret address is fine for main, but exit never returns, i just went through all of exit today and was hoping to find like
pop %eax
jmp %eax

or something to break out of exit, but i didnt find it, So perhaps i missed it, or missed something in strcpy, but exit never returns so that is the problem.

>
>Too bad people aren't required as a matter of course to look at the 
>assembler output of code from compilers anymore.  You learn a lot seeing 
>how your statements get translated to machine code.

if you only knew how much ive learned just getting to this point. I totally agree.


>Satch

j


_____________________________________________________________
Sign up for FREE email from DoItYourself.com at http://doityourself.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
