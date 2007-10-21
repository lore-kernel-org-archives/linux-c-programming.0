From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: threads and kernel
Date: Sun, 21 Oct 2007 19:23:48 +0200
Message-ID: <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>
References: <471B5276.9010800@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=vI713F6JIUkobX7ZTtvTqL3tgmhawNvffv+pjKdBtTw=;
        b=OIoSOGLHvErXFw4z4II89Qz6Qv/LzuB0In3NYWOS1Kx8aqWIameq31vdTJpc+3B75bFHtSKLrIdehyi0LIWZTLIOgceiotKFRIYv/+IK1JDSNVtb4vGAoDacVl6o8NU+TIWvsBYVz6WV9vsrN8tNtMAWDBnHKcFwj0Q+1vmyml4=
In-Reply-To: <471B5276.9010800@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hello Shriramana,

your questions can be answered in very great detail and fill whole
books (which has actually happened), so please forgive my brief
answers.

(Comments inline)

On 10/21/07, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Hello, my knowledgeable friends! :)
>
> 1.
>
> As I understand it, the kernel is always running and whenever an app
> asks for a system resource the kernel does the needful. However, in m=
y
> process tree I see no process named linux or kernel. I only see the i=
nit
> process at the root of the tree. Does the init process represent the =
kernel?

When the boot loader has finished loading the kernel image and invoked
startup_32() on x86 systems the kernel spawns the scheduler (PID 0)
and the init process (PID 1) separately.  The scheduler then takes
control over the system as soon as the kernel goes idle and init
starts the /etc/rc.d/rc.sysinit script.

Yes, there is no kernel process, but there are a couple of other
system processes: kflushd, kupdate, kpiod, kswapd, etc.

> 2.
>
> When an app does a system call, would some form of IPC between the
> process of that app and the kernel process (assuming there is one) be
> involved?

Code typically runs in two or more privilege levels.  Linux supports
two levels known as user  mode and kernel mode.  Higher privileged
code can perform operations which impact system performance and
stability like accessing hardware devices, changing the processor
state, enabling/disabling interrupts, etc.

System calls often make use of special CPU instructions that cause the
processor to transfer control to a higher privilege level allowing the
more privileged code to execute.

When a system call is invoked, the process which has invoked is being
interrupted and all the information needed to continue this process is
stored for later use.  Now, the process executes higher privileged
code that determines what to do next from examining the stack of the
less privileged code.  It contains information about the request to be
served by the kernel.  When it is finished, it control is returned to
the program, restoring the saved state and continuing program
execution.

The standard C library provides wrapper functions to make life easier
for developers as the semantic of system calls is system dependent.

> 3.
>
> When an application uses a library, the app and the library are
> processed in DIFFERENT threads in which of the following cases:
>
> 1. the library is statically linked
> 2. the library is dynamically linked
> 3. the library is loaded using dlopen
>
> My guess is "none of the above", am I right?

Runtime linking of libraries is done at the process level.

Dynamic applications, for example, consist of a dynamic executable and
one or more dynamic objects. As part of the initialization and
execution of a dynamic application, runtime linker  ld.so.1, performs
the following functions:

   1. analyze shared object dependencies,
   2. locate and map in these dependencies,
   3. calls initialization functions provided by the shared object,
   4. transfer control to application's main() function.

=46rom this moment on all threads created __within__ the process share
its address space.

As a side note: you can safely use dlopen()  to load shared libraries,
whether or not they depend on libpthread.so, as long as the main
program was initially threaded.  The other way round is dangerous and
mostly not allowed.

> These are NOT homework questions! :)

Yes, I know.  You are a well known member of this list.  No need to apo=
logize.

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
