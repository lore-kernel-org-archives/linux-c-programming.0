From: "Parvez Pathan" <parvezp@lycos.com>
Subject: Cannot capture SIGPIPE
Date: Wed, 04 Feb 2004 13:23:01 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <MNIBOEAJBKPBGIAA@mailcity.com>
Reply-To: parvezp@lycos.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Language: en
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

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
