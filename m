From: "Bruno. N. F. Pacheco" <brunonfp@fastmail.fm>
Subject: Re: New project
Date: Fri, 26 Jul 2002 11:14:00 -0300 (BRT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.20.0207261112260.204-100000@hexa.org>
References: <20020726064156.C365@nietzsche.metrotel.net.co>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020726064156.C365@nietzsche.metrotel.net.co>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Are you sure you read execve(2) man page? You just have to pass your env
variables in the last arguments, something like:

char *argz[] = {
    "/bin/sh",
    NULL
};

char *envz[] = {
    "PATH=/bin:/sbin:/usr/bin:/usr/sbin",
    "TERM=v100",
    "FOO=bar",
    NULL
};

execve(argz[0], argz, envz);

	-- Bruno N. F. Pacheco

On Fri, 26 Jul 2002, xlp wrote:

> Hi, I am coding a new project that demands me advanced C programming, I am bored
> of "Learn how to program in C" and those basic C tasks.
> I decided to make my own projects, understand manual pages style, learn how
> to make sucessfull web search, use irc channel and so on...
> I am coding a project, that It's a like a telnetd with login features, it
> becomes a daemon, listens on certain port, accepts connection, autenticate, and
> execute a shell.
> The problem is when authentication is successful, It execve() a /bin/sh
> however, I want to define certain variable such as PATH, TERM, etc.
> I want that when a client 'logs in', my daemon set certain variables (ej.
> PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin) and then
> executes the shell, so the client has a presetted variables on his session.
> You may think, Why dont you read his .cshrc ?, I dont want to read any file
> on the system , I just want my daemon set everything and then executes the 
> shell.
> smthg like:
> char *PATH="/bin:/sbin:/usr/bin:/usr/sbin";
> char *TERM="vt100";
> char *FOO="bar";
> 
> I read putenv() man, Does it have any relation?, I dont know who to put it
> to work...
> 
> Thank you for any advice/help
> 
> bye.
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

