From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: threads and kernel
Date: Mon, 22 Oct 2007 18:18:21 +0100
Message-ID: <18204.56157.399852.682918@cerise.gclements.plus.com>
References: <471B5276.9010800@gmail.com>
	<6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>
	<471C5757.3040501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <471C5757.3040501@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> > When a system call is invoked, the process which has invoked is being
> > interrupted and all the information needed to continue this process is
> > stored for later use.  Now, the process executes higher privileged
> > code that determines what to do next from examining the stack of the
> > less privileged code.  It contains information about the request to be
> > served by the kernel.  When it is finished, it control is returned to
> > the program, restoring the saved state and continuing program
> > execution.
> 
> So technically the kernel instructions would be processed "in" the same
> process and thread that makes the system call, albeit with different
> privelege, right? Or is the process *making the system call* totally
> "paused", as in a "wait" situation when one process waits for another to
> finish?

The kernel is a completely different "process" in so far as it has a
separate task descriptor, and thus a different memory layout etc.

The system call is executed in the same "flow" in that the INT-80
instruction causes the CPU to start executing kernel code; after the
system call has completed, control will eventually return to the
calling process at the instruction after the INT-80.

In that sense, it's similar to a function call, but the similarity
largely stops there.

-- 
Glynn Clements <glynn@gclements.plus.com>
