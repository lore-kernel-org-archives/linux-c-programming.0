From: "J." <mailing-lists@xs4all.nl>
Subject: Re: getlogin(), prints ((NULL)) solved.. thnkx.. glen.
Date: Thu, 13 Mar 2003 01:18:39 +0100 (CET)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0303130054060.15029-100000@hestia>
References: <15983.48975.608147.30390@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <15983.48975.608147.30390@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, 12 Mar 2003, Glynn Clements wrote:

> 
> Jeroen Reynders. wrote:
> 
> > But, Everytime when I execute the following C code (bottom) from within a
> > shell loop as in:
> > 
> > while : ; do ./program ; done
> > 
> > it prints: ((NULL))
> > 
> > But when I excute it in the normal way:
> > ./program
> > It prints perfectly ok: myusername
> > 
> > C Code.
> > #include <stdio.h>
> > #include <unistd.h>
> > #include <sys/types.h>
> > 
> > int main(void) {
> >  char *username = NULL;
> > 
> >  username = getlogin();
> >  /* for(;;) */
> >   printf("%s\n", username);
> > 
> >  return 0;
> > }
> > 
> > When I call the printf from a for loop in the native C code it also
> > starts to print ((NULL)) after a couple of loops.
> 
> Odd; for me, it's consistent: it either always prints "glynn" or
> always prints "(null)".

Cool thankx for trying...

> But is getlogin() (i.e. the name from the utmp entry for the
> controlling tty) really the information that you want? Or would you be
> better off with:
> 
> 	struct passwd *pw = getpwuid(getuid());
> 	pw ? pw->pw_name : "<none>"
> 
> ?
> 
> Bear in mind that not all processes have a controlling terminal, and
> even for those that do, there may not be an associated utmp entry.

I havent thought of that one, it's indeed a good one to remember...

I have searched all the documentation I could find this evening and
eventually going back to the getlogin() manual page. It seems that I have
overlooked the `BUGS' section in the end of the manual page.

BUGS
    Unfortunately, it is often rather easy to fool getlogin().  Sometimes
    it does not work at all, because some program messed up the utmp
    file. Often, it gives only the first 8 characters of the login
    name. The user currently logged in on the controlling tty of our
    program need not be the user who started it.  Avoid getlogin() for
    security-related purposes.

Hmmm... Again a type of lesson I am not going to forgett easily ... :)

Anyway I solved the problem the way you suggested, the following works
fine on my system.

#include <pwd.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main(void) {
 uid_t uid;
 struct passwd *pw;

 uid = getuid();

 pw = getpwuid(uid);
 printf("my name is: %s\n", pw->pw_name);

 return 0;
}

Thank you for helping me out. 

> -- 
> Glynn Clements <glynn.clements@virgin.net>

Jeroen Reynders

