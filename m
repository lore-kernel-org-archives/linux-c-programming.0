From: Edward Parrilla <eparrilla@comcast.net>
Subject: mapping client to port
Date: 07 Oct 2004 01:34:21 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1097130850.4086.838.camel@localhost.localdomain>
References: <20041006104403.96723.qmail@web52903.mail.yahoo.com>
	 <1097099245.4086.421.camel@localhost.localdomain>
	 <6.1.1.1.0.20041006171515.04d4c6b8@no.incoming.mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6.1.1.1.0.20041006171515.04d4c6b8@no.incoming.mail>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>

Hi all,
sorry again for bothering you:

I have the following entry to do:

myprog port1 port2 servname 
that will be executed from the client's command line.

where
port1 is the client's port
port2 is the server's port
and servname is the server to which I want to connect.

In order to associate port2 with servername I have to create a 
struct servent *serv;
struct socket_in *fin;

then associate it with 
fin.sin_port -->getservbyname(port2)

the question is how do to associate the port1 to the local host?

is it valid if I do:
fin.in_port = htons(atoi(port1))

Thanks in advance for your help
Edward



