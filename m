From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Runtime memory organization for a process
Date: Fri, 24 Mar 2006 14:10:48 +0100
Message-ID: <6a00c8d50603240510x3da819dck76ab142447d08e8f@mail.gmail.com>
References: <3ce33f6c0603240444m39ffb49bk7540a291a0959ade@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3ce33f6c0603240444m39ffb49bk7540a291a0959ade@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 3/24/06, Shrikanth Ramanath <shriek.007@gmail.com> wrote:
> If I run a executable for a process ( say I have written a simple c
> program and then compiled it to create a a.out executable), so on the
> bash console I run ./a.out, now my query is can I use GDB and find out
> variable stored in stack , heap, say more refined I want to see the
> bss , global storage area for a process using gdb  ... how can I do
> that ??

To attach to an already running process, enter "attach <PID>" in gdb,
to specifiy a target to debug, enter "gdb a.out" on the console.

To view the current stack, enter "stacktrace" or "stacktrace n" to
return only n innermost stack frames.  You can examine a stack frame
by entering "frame n" where n is either a frame number or an address;
use frame up/down to jump up and down the stack.  You may also want to
try "info stack [n]" to view more info about the local variables among
other things.

To examine use "info heap".

I recommend reading the official gdb manual for more infos and
details. <http://physics.usask.ca/~angie/ep414/labmanual/GNUdoc/gdb/gdb_toc.html>.

	\Steve
