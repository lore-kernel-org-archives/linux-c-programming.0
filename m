From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: threads and kernel
Date: Mon, 22 Oct 2007 13:25:03 +0530
Message-ID: <471C5757.3040501@gmail.com>
References: <471B5276.9010800@gmail.com> <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Steve Graegert wrote:
> your questions can be answered in very great detail and fill whole
> books (which has actually happened), so please forgive my brief
> answers.

Brief answers are sufficient. Thank you. :)

> and the init process (PID 1) separately.  The scheduler then takes
> control over the system as soon as the kernel goes idle and init
> starts the /etc/rc.d/rc.sysinit script.

So would the kernel be "reawakened" by some external event occurring, as
Glynn wrote? I am thinking like -- the kernel is a body of instructions,
just like any other program. So like I do something (type "cp" at a
terminal, for ex) to have the program called "cp" to be processed --
that is, the instructions in it are executed. Similarly when a system
call is made by any program, the instructions contained in the kernel
would be executed. Is this understanding right?

> When a system call is invoked, the process which has invoked is being
> interrupted and all the information needed to continue this process is
> stored for later use.  Now, the process executes higher privileged
> code that determines what to do next from examining the stack of the
> less privileged code.  It contains information about the request to be
> served by the kernel.  When it is finished, it control is returned to
> the program, restoring the saved state and continuing program
> execution.

So technically the kernel instructions would be processed "in" the same
process and thread that makes the system call, albeit with different
privelege, right? Or is the process *making the system call* totally
"paused", as in a "wait" situation when one process waits for another to
finish?

Do I also understand right that the kernel resides in a special section 
of memory the boot loader puts it in? The core of the kernel (apart from 
dynamically loadable kernel modules) is the vmlinuz file sitting in my 
/boot dir, right?

> Yes, I know.  You are a well known member of this list.  No need to apologize.

Oh thanks -- that was very nice of you to say. I only thought -- these
are probably very basic questions for my friends here, and so may seem
like homework questions. :)

Have a nice day, all! :)

Shriramana Sharma.

