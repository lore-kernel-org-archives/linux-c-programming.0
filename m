From: "romesh sahu" <r.sahu@zensar.com>
Subject: RE: Cannot capture SIGPIPE
Date: Wed, 4 Feb 2004 14:43:16 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <12DBF81D4944C546AF06D1A37A07A5C8019715FB@zenmail1.ind.zensar.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org
Cc: parvezp@lycos.com

oh i m sorry for my earlier mail...
i tried sending PIPE instead SIGPIPE...its the same thing happening...both SIGPIPE and PIPE work fine..the process is catching the signal and going to back_to_work and prints the "Not Quitting" message.

Regards,
Romesh

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of Parvez
Pathan
Sent: Wednesday, February 04, 2004 1:23 PM
To: linux-c-programming@vger.kernel.org
Subject: Cannot capture SIGPIPE


Hi All,
  I have  a server program which connect to clients c1 and c2. The server reads from c1 and writes to c2. Whenever c2 dies(or is killed) I get a SIGPIPE at the server. I have tried to capture the SIGPIPE but cant trap it. Some part of my code is as follows:

<code>
void cleanup (int x) { printf ("Quitting..."); exit(0); }
void back_to_work (int x) { printf ("Not Quitting..."); return; }

main ()
{
	signal (SIGINT, cleanup);
	signal (SIGPIPE, back_to_work);

	//rest of the program
}
</code>

The server is in a infinite loop. The server cannot capture a SIGPIPE given to it by the kill command (kill -PIPE <server pid>) also. Am I missing out anything??
Please help.

Thanks,
Parvez


____________________________________________________________
Get advanced SPAM filtering on Webmail or POP Mail ... Get Lycos Mail!
http://login.mail.lycos.com/r/referral?aid=27005
-
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
