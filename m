From: James Stevenson <james@stev.org>
Subject: Re: getting ebp from another process ?
Date: 29 Sep 2002 18:39:33 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1033321174.1676.28.camel@god.stev.org>
References: <1033298349.1725.24.camel@god.stev.org> 
	<20020929124614.GB415@cam.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020929124614.GB415@cam.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sos22@cam.ac.uk
Cc: linux-c-programming@vger.kernel.org


> > under linux is it possible to get ebp from another
> > process without attaching a debugger to it ?
> Depends on what you mean by attaching a debugger.  If you just want
> avoid starting an external program like gdb, you can do it with
> ptrace:
> 
> struct user_regs_struct regs_struct;
> 
> ptrace(PTRACE_ATTACH, target_pid, NULL, NULL);
> waitpid(target_pid, NULL, WUNTRACED);
> ptrace(PTRACE_GETREGS, target_pid, NULL, &regs_struct);
> target_ebp = regs_struct.ebp;

yeah this is where the problem lies. because there is
already another process using ptrace on the process i want the info
from.

i will probably just end up modifiing the host kernel
so i can get the values from /proc/<pid>/ebp


