From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: automate an interactive process
Date: Wed, 7 Jul 2004 09:18:10 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16619.45506.58570.693557@cerise.nosuchdomain.co.uk>
References: <1089177267.1118.5.camel@kaushal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1089177267.1118.5.camel@kaushal>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kaushal <kaushal@rocsys.com>
Cc: linux-c-programming@vger.kernel.org


kaushal wrote:

> 	Iam trying to automate the login program.That is I want "my process" to
> spawn login process and then provide it with the username and password
> without my interaction.
> 
> I know that I can use the "expect" program for it which is based on TCL.
> But I want to do this from within a C program.

Then you need to re-create the guts of "expect" in C.

Essentially, you need to obtain a pty, create a child process in a new
session, redirect stdin/stdout/stderr from the pty slave, then have it
execute /bin/login. The parent process reads the prompts from the pty
master and writes the appropriate input to it.

-- 
Glynn Clements <glynn.clements@virgin.net>
