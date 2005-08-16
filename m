From: Markus Rechberger <mrechberger@gmail.com>
Subject: Re: Program execution
Date: Tue, 16 Aug 2005 16:48:34 +0200
Message-ID: <d9def9db0508160748102e34ed@mail.gmail.com>
References: <20050816_143050_024141.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050816_143050_024141.r_zaca@ig.com.br>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: r_zaca <r_zaca@ig.com.br>, linux-c-programming@vger.kernel.org

Hello,

first enable coredumps
# ulimit -c unlimited
# ./yourfaultyapp

open another shell and kill the process using kill -SIGSEGV then it
should say core dumped (also compile your application with -g .. there
are a few other debugging options but that one might already help you)

afterwards run your application with gdb (should look like the following line)

# gdb ./yourfaultyapp coredumpfile
> bt // for a backtrace, last functions which got called and so
> frame #<framenumber> // inspect a frame
> list // show the sourcecode which is connected to that frame

hope this helps,
Markus

On 8/16/05, r_zaca <r_zaca@ig.com.br> wrote:
>   Hello all,
> 
>   I have a program that just stops execution and I can't see what is really
> going on. Does anyone know how this kind of problem shoud be solved. I've
> already read something about core dump memory, but I don't know how to make
> it, or instruct my program to do that. Can anyone help me?
> 
> p.s.) My program runs on a Linux machine.
> 
>   Thanks.
> 
> 


-- 
Markus Rechberger

http://www.wikiservice.at/dse/wiki.cgi?MarkusRechberger
