From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: How to execute a process in background by exec functions?
Date: Thu, 8 Apr 2004 09:56:43 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16501.5067.740319.286901@cerise.nosuchdomain.co.uk>
References: <002001c41d2c$18e27f80$de01a8c0@qnessmphibiki>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <002001c41d2c$18e27f80$de01a8c0@qnessmphibiki>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wen Guangcheng <wen.guangcheng@cnt.sp.qnes.nec.co.jp>
Cc: linux-c-programming@vger.kernel.org


Wen Guangcheng wrote:

> I am trying to execute a process in background by exec functions.
> But it failed when I call the function of execv by
> execv("/home/wen/daemon &", NULL);
> The error is ENOENT(No such file or directory).  

That's because you don't have an executable called "daemon &" in
/home/wen.

> Would anyone tell me how to do it?

For the record, system() works roughly like this:

	int system(const char *command)
	{
		pid_t pid;
		int status;
	
		pid = fork();
	
		if (pid < 0)
			return -1;
	
		if (pid == 0)
		{
			execl("/bin/sh", "sh", "-c", command, 0);
			_exit(127);
		}
	
		if (waitpid(pid, &status, 0) < 0)
			return -1;
	
		return status;
	}

[The actual system() function also changes the signal handling and
checks for errors; for simplicity, these have been omitted from the
above code.]

First, it calls fork() to create a new process. The child process
calls one of the exec*() functions to execute the shell, with the
command as an argument (note: the various exec*() functions shouldn't
return; if they succeed, the specified program is run in place of your
program). The parent process calls one of the wait*() functions to
wait for the child process to terminate.

If you want to run a specific program directly (rather than via the
shell), you would just run that program in place of /bin/sh, e.g.:

	execl("/home/wen/daemon", "daemon", NULL);

Note that you have to specify argv[0] explicitly.

If you want that program to run in the background, the solution is
simply to omit the call to wait (or waitpid, etc) from the parent.

Also, note that features such as command pipelines, redirection, use
of the "~" syntax for the home directory etc are all provided by the
shell. You can't use shell syntax (e.g. "prog1 | prog2",
"prog <infile >outfile", "prog ~/file" etc) in the strings which are
passed to the exec*() functions unless you are actually executing the
shell (as system() does).

-- 
Glynn Clements <glynn.clements@virgin.net>
