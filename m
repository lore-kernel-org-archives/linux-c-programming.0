From: Steve Graegert <graegerts@gmail.com>
Subject: Re: should I use, getcwd() or *environ ?
Date: Sat, 5 Mar 2005 12:12:51 +0100
Message-ID: <6a00c8d505030503121038ff83@mail.gmail.com>
References: <Pine.LNX.4.21.0503042218420.2519-100000@hestia>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.21.0503042218420.2519-100000@hestia>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Fri, 4 Mar 2005 22:23:17 +0100 (CET), J. <mailing-lists@xs4all.nl> wrote:
> Friday, March 04 22:18:42
> 
> Hello,
> 
> I have to remember the working directory and save it in my program so that
> I can return to it later..
> 
> Which one is better/safer and why ? The environment var's or the
> getcwd() function fam... ?
> 

I usually take the following approach:

	int  fd_dir;
	char buf[PATH_MAX];
	
	if (getcwd(buf, sizeof(buf)) == NULL) {
		/* error handling */
	}
	
	/* open a directory for reading */
	if ((fd = open(buf, O_RDONLY)) < 0) {
		/* error handling*/
	}
	
	/* do all your work here and return to old dir */
	
	if (fchdir(fd_dir) < 0) {
		/* error handling */
	}

This makes sure, that you can process directories as you will and
return to the one you started by simply calling fchdir(). You see,
getcwd() is usefull and so is fchdir(). It's an easy and reliable way
to bookmark a direcory. Nevertheless, you will need a fallback if the
directory you bookmarked is changed meanwhile by another process. I
would not rely on environment variables, since this approach is
elegant while portable.

Hope this helps.


> --
> http://www.rdrs.net/
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Kind Regards

    \Steve
