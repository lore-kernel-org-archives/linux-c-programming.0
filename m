From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: should I use, getcwd() or *environ ?
Date: Sun, 6 Mar 2005 10:19:48 +0000
Message-ID: <16938.55620.259003.476736@gargle.gargle.HOWL>
References: <Pine.LNX.4.21.0503042218420.2519-100000@hestia>
	<6a00c8d505030503121038ff83@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <6a00c8d505030503121038ff83@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Steve Graegert wrote:

> > I have to remember the working directory and save it in my program so that
> > I can return to it later..
> > 
> > Which one is better/safer and why ? The environment var's or the
> > getcwd() function fam... ?
> 
> I usually take the following approach:
> 
> 	int  fd_dir;
> 	char buf[PATH_MAX];
> 	
> 	if (getcwd(buf, sizeof(buf)) == NULL) {
> 		/* error handling */
> 	}
> 	
> 	/* open a directory for reading */
> 	if ((fd = open(buf, O_RDONLY)) < 0) {
> 		/* error handling*/
> 	}

With this approach, you may as well skip the getcwd() and just use
open(".", ...) to get a descriptor for the cwd.

Also the behaviour of using a descriptor and fchdir() versus using
getcwd() and chdir() differs if the directory is moved or renamed
while the program is running.

-- 
Glynn Clements <glynn@gclements.plus.com>
