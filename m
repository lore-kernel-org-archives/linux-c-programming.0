From: jnf <xjnfx@doityourself.com>
Subject: Re: getting ebp from another process ?
Date: Mon, 30 Sep 2002 12:59:38 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020930195953.DB7C54001@sitemail.everyone.net>
Reply-To: xjnfx@doityourself.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Stevenson <james@stev.org>, sos22@cam.ac.uk
Cc: linux-c-programming@vger.kernel.org

im a little confused by what you mean from another process, meaning like - im not sure if you want it from a third process, or just mean another process from the debuggers point of view, but wouldnt
unsigned long foo(void) { __asm__("movl %ebp, %eax"); }
work?

>
>> > under linux is it possible to get ebp from another
>> > process without attaching a debugger to it ?
>> Depends on what you mean by attaching a debugger.  If you just want
>> avoid starting an external program like gdb, you can do it with
>> ptrace:
>> 
>> struct user_regs_struct regs_struct;
>> 
>> ptrace(PTRACE_ATTACH, target_pid, NULL, NULL);
>> waitpid(target_pid, NULL, WUNTRACED);
>> ptrace(PTRACE_GETREGS, target_pid, NULL, &regs_struct);
>> target_ebp = regs_struct.ebp;
>
>yeah this is where the problem lies. because there is
>already another process using ptrace on the process i want the info
>from.
>
>i will probably just end up modifiing the host kernel
>so i can get the values from /proc/<pid>/ebp
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

_____________________________________________________________
Sign up for FREE email from DoItYourself.com at http://doityourself.com

_____________________________________________________________
Select your own custom email address for FREE! Get you@yourchoice.com w/No Ads, 6MB, POP & more! http://www.everyone.net/selectmail?campaign=tag
