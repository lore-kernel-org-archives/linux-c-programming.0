From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: script in c
Date: Mon, 8 Nov 2004 07:27:55 +0000
Message-ID: <16783.8187.683414.241864@cerise.gclements.plus.com>
References: <20041108065024.35087.qmail@web14001.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="UMhOlD4Zsl"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041108065024.35087.qmail@web14001.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--UMhOlD4Zsl
Content-Type: text/plain; charset=us-ascii
Content-Description: message body and .signature
Content-Transfer-Encoding: 7bit


> >            Is there a way by which I can exec a
> > shell script without
> > using the "system()" call?
> > Thanks in advance.
> 
> You can use exec*() family for this purpose.
> 
> man exec
> 
> Here is a little sample:
> 
> [mbaris@zion:/tmp/code_temp]$ cat exec.c
> #include <unistd.h>
> #include <string.h>
> #include <errno.h>
> 
> int main(void)
> {
>   if (execl("/bin/sh", "-c", "./script.sh", NULL)==-1)
>   {
>     printf("ERROR: %s\n", strerror(errno));
>   }
> 
>   return 0;
> }

A system() replacement is somewhat more complex than that.

If the process wants to continue executing after the script has
finished, you need to fork() a child process, have the child perform
the exec(), then wait() for the child to finish. You may also need to
change the signal handling while the child is executing (system()
ignores SIGINT and SIGQUIT and blocks SIGCHLD while the child process
runs).

A more complete example is attached.

-- 
Glynn Clements <glynn@gclements.plus.com>


--UMhOlD4Zsl
Content-Type: text/plain
Content-Description: process spawning example
Content-Disposition: inline;
	filename="spawn.c"
Content-Transfer-Encoding: 7bit

#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/wait.h>

int spawn(char *command, char **args)
{
	/* sample usage:
	 *	
	 *	char *args[3];
	 *	
	 *	args[0] = "sh";
	 *	args[1] = "/path/to/script";
	 *	args[2] = NULL;
	 *	spawn("/bin/sh", args);
	 */

	struct sigaction act, intr, quit;
	sigset_t block, oldmask;
	int status = -1;
	pid_t pid;

	sigemptyset(&act.sa_mask);
	act.sa_flags = SA_RESTART;

	act.sa_handler = SIG_IGN;
	if (sigaction(SIGINT, &act, &intr) < 0)
		goto error_1;
	if (sigaction(SIGQUIT, &act, &quit) < 0)
		goto error_2;

	sigemptyset(&block);
	sigaddset(&block, SIGCHLD);
	if (sigprocmask(SIG_BLOCK, &block, &oldmask) < 0)
		goto error_3;

	pid = fork();

	if (pid < 0)
	{
		fprintf(stderr, "unable to create a new process");
		goto error_4;
	}

	if (pid == 0)
	{
		sigaction(SIGINT, &intr, NULL);
		sigaction(SIGQUIT, &quit, NULL);

		execvp(command, args);
		/* if we reach this point, execvp() failed */
		fprintf(stderr, "unable to execute command");
		_exit(127);
	}
	else
	{
		pid_t n;

		do n = waitpid(pid, &status, 0);
		while (n == (pid_t) -1 && errno == EINTR);

		if (n != pid)
			status = -1;
	}

error_4:
	sigprocmask(SIG_SETMASK, &oldmask, NULL);
error_3:
	sigaction(SIGQUIT, &quit, NULL);
error_2:
	sigaction(SIGINT, &intr, NULL);
error_1:
	return status;
}

--UMhOlD4Zsl--
