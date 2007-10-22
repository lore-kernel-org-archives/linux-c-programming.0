From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: threads and kernel
Date: Mon, 22 Oct 2007 15:41:36 +0200
Message-ID: <6a00c8d50710220641i27c58cc7l84753ff8323358cc@mail.gmail.com>
References: <471B5276.9010800@gmail.com>
	 <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>
	 <471C5757.3040501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=UlgWAquJ33W92iJ24Xw6/AWk/cJxsoa35OQ8fR9muaE=;
        b=K4+rhJx2MnI20iGLc3RSvjnJLLNNnB+h2iMDDijRqQWyOUvfMncOqbL0W/mFXIOS1nxm/wm6TXETQC2mnvs08p1wWczRu5jwGVL3YqFc9AvjQEzAskVPGAloRS5eT01GsCVXq57PDu9BwC9/0Csf+3a/zrY3cYeyxfscT4hCaYo=
In-Reply-To: <471C5757.3040501@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On 10/22/07, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Steve Graegert wrote:
> > your questions can be answered in very great detail and fill whole
> > books (which has actually happened), so please forgive my brief
> > answers.
>
> Brief answers are sufficient. Thank you. :)
>
> > and the init process (PID 1) separately.  The scheduler then takes
> > control over the system as soon as the kernel goes idle and init
> > starts the /etc/rc.d/rc.sysinit script.
>
> So would the kernel be "reawakened" by some external event occurring,=
 as
> Glynn wrote?

Yes, exactly.

> I am thinking like -- the kernel is a body of instructions,
> just like any other program. So like I do something (type "cp" at a
> terminal, for ex) to have the program called "cp" to be processed --
> that is, the instructions in it are executed. Similarly when a system
> call is made by any program, the instructions contained in the kernel
> would be executed. Is this understanding right?

That is basically correct.

> > When a system call is invoked, the process which has invoked is bei=
ng
> > interrupted and all the information needed to continue this process=
 is
> > stored for later use.  Now, the process executes higher privileged
> > code that determines what to do next from examining the stack of th=
e
> > less privileged code.  It contains information about the request to=
 be
> > served by the kernel.  When it is finished, it control is returned =
to
> > the program, restoring the saved state and continuing program
> > execution.
>
> So technically the kernel instructions would be processed "in" the sa=
me
> process and thread that makes the system call, albeit with different
> privelege, right? Or is the process *making the system call* totally
> "paused", as in a "wait" situation when one process waits for another=
 to
> finish?

Well, no.

Whenever a user program is invoked a new process is created.
Nevertheless, the system call is handled in the kernel's address space
which is made available by a "context switch" (int 0x80) from user
mode to kernel mode.

When a process requests the kernel to do something which is currently
impossible but that may become possible later, the process is put to
sleep and is woken up when the request is more likely to be satisfied.
One of the kernel mechanisms used for this is called a "wait queue".

When a userspace application makes a system call, the arguments are
passed via registers and the application executes "int 0x80" (x86)
instruction. This causes a trap into kernel mode and processor jumps
to system_call entry point in entry.S. What this does is:

   1. Save registers.
   2. Set %ds (data segment) and %es (extra segment) to KERNEL_DS,
allowing the references to be made in the kernel address space.
   3. If the value of %eax (the system call number supposed to serve
the request is stored here) is greater than NR_syscalls (max no. of
system calls, currently 256), fail with ENOSYS error.
   4. Call sys_call_table (initialized at boot up) with syscall_number
argument from %eax. This table (arch/i386/kernel/entry.S) points to
individual system call handlers which will find their arguments on the
stack.
   5. Enter the so called "system call return path" checking if a call
to schedule() is needed, checking for pending signals and if so
handling them.
   6. Check for errors

> Do I also understand right that the kernel resides in a special secti=
on
> of memory the boot loader puts it in? The core of the kernel (apart f=
rom
> dynamically loadable kernel modules) is the vmlinuz file sitting in m=
y
> /boot dir, right?

Short answer: yes.

Long answer: Linux actually implements a two stage boot process. In
the first stage, the BIOS loads the boot program (Initial Program
Loader) from the hard disk to the memory.  In the second stage, the
boot program loads the operating system kernel vmlinuz into memory and
uncompresses it, since vmlinuz is a compressed kernel image (protected
mode).

When the kernel loads into memory, it performs a memory test.  Most of
the kernel data structures are initialized statically. So it sets
aside a part of memory for kernel use. This part of the memory cannot
be used by any other processes. It also reports the total amount of
physical memory available and sets aside those for the user processes.

Hope that was helpful.

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
