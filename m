From: "Suma Choudhary" <sumac@myw.ltindia.com>
Subject: Re: fork + signal
Date: Fri, 29 Jul 2005 13:25:25 +0530
Message-ID: <s2ea2e62.091@EMAIL>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: amit_dang@intersolutions.stpn.soft.net, linux-c-programming@vger.kernel.org

hi all
The parent process gets a message from FIFO . There was one more signal(when a card is inserted) whose signal handler opens the FIFO(O_WRONLY)to msg to itself while  it has not opened it for reading (busy somewhere else)........so a deadlock!
Thanks for the help otherwise I wud never have read (and re -read) for the FIFO man pages !

regards
suma
ps:check the pseudo code here ........hope I've tracked down the problem right!

The code of parent will be:
main()
{
register signal handlers;
 for(;;)
 {
    open(fifo);
    wait for a msg;
    close(fifo);
    spawn_process;/*was here when the process was opening fifo in signal handler*/
    
  }
}
signal_handler()
{
  open(fifo,O_WRONLY);/*blocked here */
  write(the msg );
  close(fifo);
}
>>> "Amit Dang" <amit_dang@intersolutions.stpn.soft.net> 07/29/05 10:13 AM >>>
It seems that the main process has not yet finished with the processing of
"insert card" and it was interrupted by SIGCHLD (as pointed out by San Ron
Michael Khu). I am assuming your code to be something like this

Main Process:
{
    CardInserted()
    {
        SpawnChild();
        /*Rest of the processing */
        ....
    }
}

Chlid Process:
{
    CardRemoved()
    {
        /* Processing */

    }
    /* Kill itself */
}

I have few questions (assuming the above code structure):
1 ) After child has detected Card Removal, is CardInserted() function
required to be complete its execution?
2 ) Can SpawnChild() be the last statement of CardInserted() function?
3 ) Is there any kind of locking being used in CardInserted() function?
4 ) Can CardInserted() function be called multiple times simultaneously?

It would be better if you can share the code.

Regards,
Amit Dang
----- Original Message ----- 
From: "Ron Michael Khu" <ronkhu@ntsp.nec.co.jp>
To: "Suma Choudhary" <sumac@myw.ltindia.com>; "linux-c-programming"
<linux-c-programming@vger.kernel.org>
Sent: Friday, July 29, 2005 8:33 AM
Subject: Re: fork + signal


> state-machine processing problems?
>
> perhaps the mother process was not yet finished performing the function
> for processing the "card insertion message"
> when the child process raised a SIGCHLD... perhaps a system call or a
> task done by the parent process was interrupted when the SIGCHLD
> was received by the signal handler..
>
> aside from doing a "fork" (and an "exec"), what are other tasks are done
> whenever a card insertion message is received??
>
> can u show some code? both for the parent and child processes
>
>
>
> Suma Choudhary wrote:
>
> >Sorry for being so vague!
> >OK the situation is like this:
> >I've a process which after receiving a card insertion message  spawns
another process.
> >Now when the insertion and removal of card is done at a fast rate, the
spawning of the child stops after certain time:-(
> >This when checked with a slower rate works fine.
> >
> >When the card is removed the child process detects it and kills itself.
> >THe parent gets a SIGCHLD and "waits" on the child.
> >
> >Do u see any problem here......should I disable the SIGCHLD before
spawning the child?
> >
> >
> >Thanks for taking the time to consider it.
> >
> >Regards
> >suma
> >
> >
> >
> >>>>r_zaca <r_zaca@ig.com.br> 07/28/05 22:03 PM >>>
> >>>>
> >>>>
> > Suma,
> >
> > How could a child process send a signal if it is not already created?
> >
> >
> >
> >>hi all
> >>I have this doubt of what happens when a process is still on the way >of
> >>forking(+ maybe exec further) a child and there comes a sigchld >signal.
> >>(Of course assuming that theres a signal handler for the sigchld
>signal.)
> >>
> >>
> >
> >
> >
> >>hopeful of getting an answer
> >>regards
> >>suma
> >>
> >>
> >
> >-
> >To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> >the body of a message to majordomo@vger.kernel.org
> >More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >
> >
> >
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

