From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Program execution
Date: Tue, 16 Aug 2005 17:16:09 +0200
Message-ID: <6a00c8d5050816081662861713@mail.gmail.com>
References: <20050816_143050_024141.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050816_143050_024141.r_zaca@ig.com.br>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: r_zaca <r_zaca@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

On 8/16/05, r_zaca <r_zaca@ig.com.br> wrote:
>   Hello all,
> 
>   I have a program that just stops execution and I can't see what is really
> going on. Does anyone know how this kind of problem shoud be solved. I've
> already read something about core dump memory, but I don't know how to make
> it, or instruct my program to do that. Can anyone help me?

When a (UNIX) program exits abnormally it usally has received a signal
and probably has, depending on the signal (SIGSEGV, for example),
written a core dump.  You can then examine the core dump by running
gdb:

        $ gdb myapp core.1234

gdb usually jumps straight to the line where the crash occured.

If your program does not generate a core dump you can force it to do
so by calling abort().  A better solution is to provide an error
handler that automatically writes a core dump.

 
Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
