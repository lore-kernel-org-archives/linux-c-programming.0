From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Pipes and passwd programm problem
Date: Thu, 29 Mar 2007 04:35:33 +0100
Message-ID: <17931.13317.108466.580863@cerise.gclements.plus.com>
References: <460B276C.3090103@zg.t-com.hr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <460B276C.3090103@zg.t-com.hr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikola <root.admin1@zg.t-com.hr>
Cc: linux-c-programming@vger.kernel.org


Nikola wrote:

> I would like to interface with passwd program in Debian Linux using 
> pipes to be able to change password from a C program.
> 
> Problem is in reading output from passwd program.
> 
> I have observed interesting behavior with passwd program.
> 
> ---------------------------
> 
> [nikola@host][~]$ passwd
> Changing password for zip
> (current) UNIX password:
> [ENTER]
> passwd: Authentication failure
> [nikola@host][~]$
> 
> 
> [nikola@host][~]$ passwd 1> /dev/null
> (current) UNIX password:
> [ENTER]
> passwd: Authentication failure
> [nikola@host][~]$
> 
> 
> [nikola@host][~]$ passwd 2> /dev/null
> Changing password for zip
> [ENTER]
> [nikola@host][~]$
> 
> 
> ---------------------------
> 
> Program is using both STDOUT and STDERR for output.

> int read_chars(FILE *rstream){
>         char ch;
> 
>         while(!feof(rstream)){
>                 ch = fgetc(rstream);
>                 printf("%c",ch);
>         }
> 
>         fflush(NULL);
> 
>         return 0;
> }

This function reads until EOF, which is a problem for your usage of
it. See below.

>         pipe(rfds);
>         pipe(stdout_wfds);
>         pipe(stderr_wfds);

Do you need the stdout and stderr to be separate? You could create one
pipe and assign it to both stdout and stderr.

>         if( pid == 0 ){ // child
>                 close(rfds[1]);
>                 close(stdout_wfds[0]);
>                 close(stderr_wfds[0]);
> 
> 
>                 dup2(rfds[0],STDIN_FILENO);
>                 dup2(stdout_wfds[1],STDOUT_FILENO);
>                 dup2(stderr_wfds[1],STDERR_FILENO);

At this point, you should close std{out,err}_wfds[1] and rfds[0]. 
dup2() copies the descriptor; it doesn't close the source.

>                 execlp("passwd","passwd",0);
> 
>         } else { // parent

Again, you should close std{out,err}_wfds[1] and rfds[0] here.

>                 // PROBLEM !!!!!!!!!!!!!!!!!!!
>                 // this is supposed to read 2 lines of passwd output
>                 // but seems it doesn't work
>                 read_chars(rstream_out);
>                 read_chars(rstream_err);

These functions read until EOF. That won't happen so long as any
process has the write end open. The child will keep its copies open
until it terminates (which won't happen until you've sent at least the
oldpassword, and also the new password if the old password is
correct), and the parent is also holding copies.

More generally, scripting an interactive program such as passwd is
inherently fragile. Scripting the passwd program is especially
fragile, as it typically uses PAM, and so the exact behaviour is
highly variable.

-- 
Glynn Clements <glynn@gclements.plus.com>
