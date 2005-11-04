From: Lawrence Bowie <thesource@ldb-jab.org>
Subject: Re: exec question
Date: Fri, 04 Nov 2005 12:09:21 -0500
Message-ID: <436B95C1.5050006@ldb-jab.org>
References: <436AECF0.5090109@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <436AECF0.5090109@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ework0 <ework0@gmail.com>
Cc: linux-c-programming@vger.kernel.org

I believe this is what you want, right?

In the future, you will get a much more expedient response by posting to
the newsgroup, comp.unix.programmer. :) Just an FYI .. not trying to
scare you away.



#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int
main(int argc, char *argv[])
{
	/* In using execlp you better be sure PATH is set properly and
	 * also in ceratin situations it might be a security risk.
	 */
	/* Uncomment below if you want an example with arguments */
        //if (execlp("cat", "cat", "/etc/hosts", (char *)0) < 0)
        if (execlp("df", "df", (char *)NULL) < 0)
                fprintf(stderr, "\nCannot exec!\n");

        exit(0);
}

ework0 wrote:
> Hello,
> 
> How can I execute a program (without the full path, just the name) using
> exec's system calls within a C program? ej: buf[]={"uname",NULL};
> 
> Thanks for a brief example,
> 
> ework0
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
