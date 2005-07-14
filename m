From: Daniel Bonekeeper <thehazard@gmail.com>
Subject: Re: LKM function call on kernel function call?
Date: Thu, 14 Jul 2005 09:59:01 -0700
Message-ID: <e1e1d5f405071409592890b1d7@mail.gmail.com>
References: <1458d9610507050123124d6cb@mail.gmail.com>
Reply-To: Daniel Bonekeeper <thehazard@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1458d9610507050123124d6cb@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: S <talk2sumit@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux prg <linux-c-programming@vger.kernel.org>

You can also look about some methods of "function redirection
hooks"... add some opcodes at the start of the "hooked function"
(something like to add a CALL or JMP pointing to the address of your
function). There are docs about this subject, but unfortunately I
couldn't find anything now (http://www.ouah.org/p59-0x08.txt is not
exactly what I'm talking about, it's talking about ELF redirection).
It's a dirty thing to do, and it's not intended to be done in any
production thing (in fact, it's a *hack*).

On 7/5/05, S <talk2sumit@gmail.com> wrote:
> Is it possible to code a loadable module having function1(), which
> would be called, everytime a particular function of the kernel is
> called? If not, atleast a way this could be done without re-compiling
> the whole kernel and rebooting the system?
> 
> Example:
> 
> My LKM:
> -------------
> 
> init_module() {
> ...
> }
> 
> function1() {
> ...
> }
> 
> cleanup_module() {
> ...
> }
> 
> 
> I want function1() to be called, everytime the function
> ide_do_rw_disk() of ide-disk.c is called. I do not want to re-compile
> the complete kernel to do this.
> 
> Thanks in advance,
> 
> Regards,
> S
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
# (perl -e "while (1) { print "\x90"; }") | dd of=/dev/evil
