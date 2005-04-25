From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: HOME directory
Date: Mon, 25 Apr 2005 18:06:00 +0100
Message-ID: <17005.9080.214244.56172@gargle.gargle.HOWL>
References: <200504251826.36321.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200504251826.36321.hitoc_mail@yahoo.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: HIToC <hitoc_mail@yahoo.it>
Cc: linux-c-programming@vger.kernel.org


HIToC wrote:

> 	I am writing a piece of code that makes files, open directories in my
> HOME directory. All worked well until I changed the name of my HOME dir.
> To make the code portable I tried with use of '~' character:
> 
> 	const char*	filename = "~/file.txt";
> 	ofstream	 my_file(filename, ios::out);
> 
> but this solution does not work.
> Have you any suggestion to find the path of the current home directory or
> the current user name?

The "~" syntax is part of the shell; library functions won't expand
it. In the shell, "~/..." is equivalent to "$HOME/...".

If you want to respect $HOME (which is usually the case), use e.g.:

	const char *home = getenv("HOME");
	const char *file = "file.txt";
	char *path = alloca(strlen(home) + strlen(file) + 2);

	sprintf(path, "%s/%s", home, file);

	ofstream my_file(filename, ios::out);

If you want to always use the user's home directory from /etc/passwd
instead of $HOME (e.g. for setuid programs), use getpwuid(), e.g.:

	struct passwd *pw = getpwuid(getuid());
	if (!pw)
		fatal_error("user not listed in /etc/passwd");
	const char *home = pw->pw_dir;

	...

Similarly, the ~user syntax for a specific user's home directory is
implemented using getpwnam().

-- 
Glynn Clements <glynn@gclements.plus.com>
