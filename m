From: xlp <xlp@emtel.net.co>
Subject: New project
Date: Fri, 26 Jul 2002 06:41:56 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020726064156.C365@nietzsche.metrotel.net.co>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi, I am coding a new project that demands me advanced C programming, I am bored
of "Learn how to program in C" and those basic C tasks.
I decided to make my own projects, understand manual pages style, learn how
to make sucessfull web search, use irc channel and so on...
I am coding a project, that It's a like a telnetd with login features, it
becomes a daemon, listens on certain port, accepts connection, autenticate, and
execute a shell.
The problem is when authentication is successful, It execve() a /bin/sh
however, I want to define certain variable such as PATH, TERM, etc.
I want that when a client 'logs in', my daemon set certain variables (ej.
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin) and then
executes the shell, so the client has a presetted variables on his session.
You may think, Why dont you read his .cshrc ?, I dont want to read any file
on the system , I just want my daemon set everything and then executes the 
shell.
smthg like:
char *PATH="/bin:/sbin:/usr/bin:/usr/sbin";
char *TERM="vt100";
char *FOO="bar";

I read putenv() man, Does it have any relation?, I dont know who to put it
to work...

Thank you for any advice/help

bye.


