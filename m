From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Cannot capture SIGPIPE
Date: Wed, 4 Feb 2004 13:15:43 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16416.61567.185027.515162@cerise.nosuchdomain.co.uk>
References: <MNIBOEAJBKPBGIAA@mailcity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <MNIBOEAJBKPBGIAA@mailcity.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: parvezp@lycos.com
Cc: linux-c-programming@vger.kernel.org


Parvez Pathan wrote:

> I have a server program which connect to clients c1 and c2. The server
> reads from c1 and writes to c2. Whenever c2 dies(or is killed) I get a
> SIGPIPE at the server. I have tried to capture the SIGPIPE but cant
> trap it. Some part of my code is as follows:
> 
> <code>
> void cleanup (int x) { printf ("Quitting..."); exit(0); }
> void back_to_work (int x) { printf ("Not Quitting..."); return; }

This won't print at the point that the signal is received if stdout is
line buffered (which is the default). Add a newline or call fflush()
to force the output to be written.

However, printf() itself isn't necessarily safe to use within a signal
handler. It would be better to use write(), e.g.

	void back_to_work (int x) {
		const char msg[] = "Not Quitting...\n";
		write(STDOUT_FILENO, msg, strlen(msg));
	}

More generally, very few functions are safe to use within a signal
handler.

Where possible, a signal handler should just set a flag variable
(which must be declared "volatile"), with the real work being
performed outside of the handler when the flag is set, e.g.

	static volatile int sigpipe;

	void handle_sigpipe (int signo) { sigpipe = 1; }

	...

		for (;;)
		{
			if (sigpipe)
			{
				deal_with_sigpipe();
				sigpipe = 0;
			}
			...

-- 
Glynn Clements <glynn.clements@virgin.net>
