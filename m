From: Steve Graegert <graegerts@gmail.com>
Subject: Re: ophan child process to take standard input
Date: Mon, 5 Sep 2005 07:33:35 +0200
Message-ID: <6a00c8d505090422337beed9a0@mail.gmail.com>
References: <dfffk2$fp8$1@sea.gmane.org>
Reply-To: graegerts@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfffk2$fp8$1@sea.gmane.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Karol Banczyk <car-los@tlen.pl>
Cc: linux-c-programming@vger.kernel.org

On 9/4/05, Karol Banczyk <car-los@tlen.pl> wrote:
> Hello,
>        I'm solving an exercise from my school. Not to go into details - the
> task is to create a initiating process which in turn starts three new
> processes  and then finishes its work. The three processes are to
> communicate with pipes. There's no problem till this stage. But there's
> the catch. The first of the three processes has to get its input from
> the standard input and this works only as long as the parent
> (initiating) process is alive. When the parent finishes the standard
> input goes back to bash and the orphaned processes are adopted by the
> init process having no access to stdin.

This is what I would expect.  As long as the parent is running child
processes are attached to the process group's controlling terminal and
will be detached automatically when the parent is terminated.

Normally, the parent should wait (waitpid) for its childs to prevent
them of becoming orphans.  Are you waiting for them?

It would be easier to help if you would let us know what the exercise is.  


Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
