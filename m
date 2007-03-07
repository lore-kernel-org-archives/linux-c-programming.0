From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: execv fails with EFAULT
Date: Wed, 7 Mar 2007 16:58:28 +0000
Message-ID: <17902.61236.767765.91902@cerise.gclements.plus.com>
References: <45EEA7F8.5080908@sun.com>
	<6a00c8d50703070446s26ddb847uae5697ed797a2ff0@mail.gmail.com>
	<45EEBA9B.9030903@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <45EEBA9B.9030903@sun.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Cc: Steve Graegert <graegerts@gmail.com>, linux-c-programming@vger.kernel.org


Prasanta Sadhukhan wrote:

> >> When I tried the following program
> >> void test4()
> >> {
> >>     printf("doing execv\n");
> >>     if(execv("/bin/ls", "-l") == -1)
> >>         printf("exec failed with errno %d\n", errno);
> >>     else
> >>         printf("exec succeed\n");
> >> }
> >
> >
> > Prasanta,
> >
> > A NULL terminated array of arguments must be passed to execv(2) as the
> > prototype indicates: int execv(const char *path, char *const argv[]);
> >
> > For example:
> >
> > #include <unistd.h>
> >
> > char *cmd[] = { "ls", "-l", NULL };
> > int result = execv ("/bin/ls", cmd);
> >
> > An error of EFAULT usually means that an argument points to an illegal 
> > address.
> >
> >     \Steve
> 
> Thanks Steve... If I have a string like this sprintf(str, 
> "-Xparameter:%d %s, value, command"), how to make it NULL terminated. Is 
> this declaration char *cmd[] = {str, NULL} and invocation
> execv(path, cmd) correct?

Probably not. It's correct in that the second argument to execv() has
the correct type, but if you're trying to pass multiple arguments, it
won't work.

It's more likely that you want something like:

	char str[20];
	char *args[4];

	sprintf(str, "-Xparameter:%d", value);

	args[0] = path;
	args[1] = str;
	args[2] = command;
	args[3] = NULL;

	result = execv(path, args);

This assumes that "command" is meant to be a single argument, not a
list of arguments. If it's a list (e.g. with individual items
separated by spaces), you'll have to split it back into a list before
passing it to execv().

-- 
Glynn Clements <glynn@gclements.plus.com>
