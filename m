From: Damir Cosic <damir@fatpipeinc.com>
Subject: Re: Debugging a Process ...
Date: Fri, 25 Oct 2002 17:39:56 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021025233955.GA2186@snowbird.fatpipeinc.com>
References: <3DB86A25.5000109@uv.unitec.edu>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3DB86A25.5000109@uv.unitec.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org



* find out PID of the process (man pidof)

* call gdb with name of the program you want to debug as an argument

* in gdb type `attach PID'


On Oct 10/24/02 15:46, Ivan Deras wrote:
> I want to know how to debug a process in Linux, i know that in Windows i 
> can use Windows-API to attach a debugger process to the debugged 
> process, but in Linux i don't know ...
