From: James Stevenson <james@stev.org>
Subject: Re: getting ebp from another process ?
Date: 30 Sep 2002 21:38:43 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1033418323.1854.7.camel@god.stev.org>
References: <20020930195953.DB7C54001@sitemail.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020930195953.DB7C54001@sitemail.everyone.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: xjnfx@doityourself.com
Cc: sos22@cam.ac.uk, linux-c-programming@vger.kernel.org

On Mon, 2002-09-30 at 20:59, jnf wrote:
> im a little confused by what you mean from another process, meaning like - im not sure if you want it from a third process, or just mean another process from the debuggers point of view, but wouldnt
> unsigned long foo(void) { __asm__("movl %ebp, %eax"); }
> work?

its a little more complicated than that.
i am actually debugging kernel things in
http://user-mode-linux.sf.net/

which has a confusing method of working with
debuggers and does not keep a good copy of ebp around
but the process is already attached by a so called
debugger but really a system call interceptor.

its does not matter anymore i dont seem to need it now.
if i do in the future i will add a kernel patch to give it out in
/proc/<pid>/ebp or something.

	James

