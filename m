From: "Colovic (ext_evosoft) Aleksandar" 
	<aleksandar.colovic.external@siemens.com>
Subject: RE: Cannot capture SIGPIPE
Date: Wed, 4 Feb 2004 15:12:19 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <856404FAF3EDB94BB597F6316C5569B90EFED0@erlf440a.erlf.siemens.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

good comment from Glynn. But I would additionaly declare the global variable
sigpipe as:

static volatile sig_atomic_t sigpipe;

... to be on the safe side.
In this example (as coded) it think it isn't necessary.

Aleksandar Colovic

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of Glynn
Clements
Sent: Mittwoch, 4. Februar 2004 14:16
To: parvezp@lycos.com
Cc: linux-c-programming@vger.kernel.org
Subject: Re: Cannot capture SIGPIPE



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
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
