From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: what causes SIGTERMs?
Date: Thu, 10 Jul 2003 03:12:41 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16140.52121.385331.351810@cerise.nosuchdomain.co.uk>
References: <00be01c34553$57ea97a0$caba0ba4@uwe.ac.uk>
	<16138.54505.701672.164306@cerise.nosuchdomain.co.uk>
	<012101c3462f$ec43a810$caba0ba4@uwe.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <012101c3462f$ec43a810$caba0ba4@uwe.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthew Studley <matthew.studley@uwe.ac.uk>
Cc: linux-c-programming@vger.kernel.org


Matthew Studley wrote:

> thanks for the help regarding linux signals... very useful!
> 
> I have written this little test program, which I then send a SIGTERM using
> another process.
> (I've been testing this under the current stable release of Debian)
> 
> I notice that, while siginfo_t.si_signo seems to have a meaningful value,
> all other fields e.g. si_pid are ZERO !

Odd; it works for me (RedHat 6.2, Linux 2.4.21, glibc 2.1.3):

	i = 15
	signo is 15
	calling pid is 4855
	calling uid is 500
	errno : 0
	code : 0

-- 
Glynn Clements <glynn.clements@virgin.net>
