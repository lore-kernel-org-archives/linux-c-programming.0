From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: struct passwd usage
Date: Thu, 1 May 2003 01:55:41 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16048.28813.203668.916383@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.44.0304301445001.29006-100000@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0304301445001.29006-100000@ns.isi.ulatina.ac.cr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: linux-c-programming@vger.kernel.org


Fabio Miranda Hamburger wrote:

> what is wrong with this code:
> 
> main(){
> struct passwd *pwd;
> char *user;
> puts("username:");
> pwd=getpwnam(user);

The variable "user" points to a random memory location at this point. 
getpwnam() expects its argument to point at a valid string, which is
the username for which to retrieve the passwd entry.

> puts(pwd->pw_name);
> }

If you meant to prompt for the username, you need to do something like
this:

int main(void)
{
	struct passwd *pwd;
	char user[64];

	puts("username:");
	gets(user);
	pwd=getpwnam(user);
	puts(pwd->pw_name);

	return 0;
}

Except that you should add error checking, use fgets() instead of
gets() etc.

-- 
Glynn Clements <glynn.clements@virgin.net>
