From: Jad Saklawi <Jad@Saklawi.info>
Subject: Re: what causes SIGTERMs?
Date: Wed,  9 Jul 2003 12:16:46 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1057778206.3f0c6a1e9a54b@webmail.namezero.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,
check out on http://www.advancedlinuxprogramming.com/alp-folder
i think it is in chapter 3 of the book, all about signals.

why not try out using http://syscalltrack.sourceforge.net and see what is 
causing the signal
                                              Greets, Jad
Quoting Matthew Studley <matthew.studley@uwe.ac.uk>:

> Hi all
> 
> thanks for the help regarding linux signals... very useful!
> 
> I have written this little test program, which I then send a SIGTERM using
> another process.
> (I've been testing this under the current stable release of Debian)
> 
> I notice that, while siginfo_t.si_signo seems to have a meaningful value,
> all other fields e.g. si_pid are ZERO !
> 
> Does anybody have any ideas about this?
> 
> cheers Matt
> 
> ============================================
> 
> 
> #include <signal.h>
> #include <stdio.h>
> 
> /*- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> */
> void myHandler(int i, siginfo_t *info, void *v){
>   printf("i = %d\n", i);
>   printf("signo is %d\n", info->si_signo);
>   printf("calling pid is %d\n", info->si_pid);
>   printf("calling uid is %d\n", info->si_uid);
>   printf("errno : %d\n", info->si_errno);
>   printf("code : %d\n", info->si_code);
>   fflush(stdout);
> }
> /*- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> */
> int main(void){
>   int i;
>   struct sigaction mySigaction;
> 
>   mySigaction.sa_sigaction = (myHandler);
>   sigemptyset (&mySigaction.sa_mask);
>   mySigaction.sa_flags = SA_SIGINFO;      //SA_RESTART | SA_SIGINFO;
>   if(sigaction(SIGTERM, &mySigaction, NULL) < 0) {
>   perror("ERROR: registering Handler Function\n");
>   exit(1);
>   }
> 
>   while(1){
>     // do nothing.
>   }
> }
> /*- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> */
> 
> ========
> >
> > Matthew Studley wrote:
> >
> > > I wonder whether you could help me?  I have a problem; I'm running an
> > > application I've written in C under Slackware 7.1  Occasionally it
> receives
> > > a SIGTERM.
> > >
> > > * In what circumstances do processes get sent a SIGTERM?
> >
> > If something raises it with kill(). Note that SIGTERM is the default
> > signal sent by the kill and killall commands.
> >
> > > * Am I correct that this is unlikely to be issued in response to a bug
> in my
> > > code?
> >
> > Correct. SIGTERM isn't sent synchronously (i.e. in response to the
> > actions of the process which receives it).
> >
> > > * How can I find which process is issuing the SIGTERM against my code?
> >
> > Install a signal handler using sigaction() with the SA_SIGINFO flag;
> > the sending process ID will be in the si_pid field of the siginfo_t
> > structure. Other fields of that structure may also contain useful
> > information.
> >
> > --
> > Glynn Clements <glynn.clements@virgin.net>
> >
> >
> 
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 



