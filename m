From: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>
Subject: Re: Question!
Date: Thu, 4 Sep 2003 15:01:25 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030904140125.GA24691@lsd.di.uminho.pt>
References: <000601c37247$f40f6540$0b04a8c0@aca.org.ar>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000601c37247$f40f6540$0b04a8c0@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mariano_moreyra@aca.org.ar
Cc: linux-c-programming@vger.kernel.org

On Wed, Sep 03, 2003 at 03:19:44PM -0300, Mariano Moreyra wrote:
> Hi!!
> First...I'd like to know if there is any kind of digest on this list to see
> old submited messages.
> 
> Now...I have a little problem.
> I have a process that is listening for incoming connections on a socket.
> That process waits for a command and then
> forks a child to run a bash script.
> The problems is:
> 	- When the bash script runs the safe_mysql script to run MySql engine, it's
> like the child process never ends.
> 	  And because of that, the parent can't close the connection with the
> client socket.
> 	- But if the bash script doesn't run the safe_mysql script...the child
> process dies successfully and everything end
> 	  Ok
> 
Hola,

Your problem should be the socket inherited by the child that will run
the script. I suppose the child doesn't need it, does it?

So, close it and redirect /dev/null to stdin, stdout and stderr:
if ((fork() == 0) { /* child */
	int fd;
	close(sock);
	fd = open("/dev/null", O_RDONLY);
	if (fd != 0) {
		dup2(fd, 0);
		close(fd);
	}
	fd = open("/dev/null", O_WRONLY);
	if (fd != 1) {
		dup2(fd, 1);
		close(fd);
	}
	fd = open("/dev/null", O_WRONLY);
	if (fd != 2) {
		dup2(fd, 2);
		close(fd);
	}
	execl("/usr/bin/safe_mysqld", "safe_mysqld", 0);
	_exit(1);
}

Regards,
Luciano Rocha
