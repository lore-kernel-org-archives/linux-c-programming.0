From: Ben Marsh <ben.marsh@bigpond.com>
Subject: Re: a 'wrapper'
Date: Sun, 30 Jun 2002 17:52:54 +1000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <62B425D4-8BFE-11D6-AB14-000A27B12CA4@bigpond.com>
References: <20020629144908.GU17216@lug-owl.de>
Mime-Version: 1.0 (Apple Message framework v482)
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020629144908.GU17216@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

<I have jumped in part way through since I just subscribed.>

On Sunday, June 30, 2002, at 12:49 AM, Jan-Benedict Glaw wrote:

> On Sat, 2002-06-29 05:25:02 -0500, xlp <xlp@emtel.net.co>
> wrote in message <20020629052348.A50622@nietzsche>:
>> hi, i have been trying to let certain process working on a remote 
>> machine in this way:
>> nohup ./a.out >> /dev/null &
>> but when i log off, the process dies.
>> Can i code a certain process that fork itself, call setsid() and run 
>> a.out with system() or exec() ?
>> How can i deal with this situation? I want that the executable object 
>> a.out forget about terminal control and do its work without care about 
>> sdtin/stdout/stderr.

As I understand it you can leave a process running on another machine 
after you disconnect by using nohup(1).  I can only assume that it 
didn't work because you try and take stdout and append to /dev/null.  
The output of your command ./a.out is taken and added to nohup.out (see 
man 1 nohup)

The other way that I have found that you could go is to make a.out a 
daemon.  This involves

1 Chdir to /
2 Close STDIN, STDOUT and STDERR.
3  Forking a new process
4 The parent exits and the child does setsid.


> You should never ever use system(), is's insecure. Use exec*(). However,
> you won't need that - try this:
>
> 	nohup ./a.out > /dev/null 2>&1 < /dev/null &

I believe that you should not need to use this command line.


> It probably dies because of a SIGPIPE if it attempts to read something
> from stdin or if it tries to write to stdout. You break this file
> descriptors in the moment you log off...

Now that might be it I guess.  Having the append >> on your commandline 
may cause this.  When I use nohup the process does not exit but I don't 
use '>> /dev/null'

