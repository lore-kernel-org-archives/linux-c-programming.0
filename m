From: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>
Subject: Re: Question!
Date: Thu, 4 Sep 2003 20:32:28 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030904193228.GA26061@lsd.di.uminho.pt>
References: <20030904175335.GA25820@lsd.di.uminho.pt> <000401c37314$2c440020$0b04a8c0@aca.org.ar>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000401c37314$2c440020$0b04a8c0@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mariano_moreyra@aca.org.ar
Cc: 'Jorge Opaso Pazos' <jopaso@trofeospazos.com>, linux-c-programming@vger.kernel.org

On Thu, Sep 04, 2003 at 03:41:36PM -0300, Mariano Moreyra wrote:
> The problem is that the child is waiting for the script to finish (the one
> that start mysqld) so the child sends a response to the client telling him
> that the script finished ok (or not).

Well, I don't know what safe_mysqld script is that. The one on my system
doesn't end.

Check that yours do, by running it on a normal console.

If it does end, then I have the following questions: are you closing the
socket after the pclose and/or exiting the child?

If so, then I guess your problem lies with popen. popen doesn't close
the other file descriptors, so the socket gets inherited. To see if that's
the true cause, start mysql through your interface and do a lsof -c mysql.

If the socket connection shows up, then you have to change your popen,
either by implementing it with pipe(2), fork(2), dup2(2), close(2), exec*
and _exit(2). Or by forking another child to do the close(sock); popen, etc.,
and use the exit status of that child for indication of success or failure.

Regards,
Luciano Rocha
