From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: INADDR_ANY
Date: Tue, 15 Jul 2003 15:36:10 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16148.4442.650372.788264@cerise.nosuchdomain.co.uk>
References: <20030715120742.94906.qmail@web12403.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030715120742.94906.qmail@web12403.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lejanson Go <lejanson@yahoo.com>
Cc: linux-c-programming@vger.kernel.org


Lejanson Go wrote:

> my other email ad is a member of this list but im 
> just confuse so i use this email ad instead to ask
> some questions.
> 
> i have a question regarding network programming.
> my program connects to a server using INADDR_ANY
> as the host address.
> 
> does the macro INADDR_ANY points to loopback
> interface?

No. INADDR_ANY is just zero. The normal use of this macro is binding
server sockets, when you need to bind to a specific port (with bind())
but don't wish to bind to a specific address (i.e. you wish to accept
connections on any local IP address). E.g.

	struct sockaddr_in addr;
	int sock;

	sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);

	addr.sin_family = AF_INET;
	addr.sin_port = htons(port);
	addr.sin_addr.s_addr = INADDR_ANY;
	bind(sock, (struct sockaddr *) &addr, sizeof(addr));

	listen(sock, 0);

INADDR_ANY isn't meaningful in most other contexts, e.g. in the
address passed to connect().

-- 
Glynn Clements <glynn.clements@virgin.net>
