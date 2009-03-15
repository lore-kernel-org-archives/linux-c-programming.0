From: Tiago Maluta <maluta_tiago@yahoo.com.br>
Subject: Re: How does one get the description of an errno value
Date: Sun, 15 Mar 2009 10:43:06 +0000
Message-ID: <49BCDBBA.3000209@yahoo.com.br>
References: <gpim9l$dia$1@ger.gmane.org> <6a00c8d50903150420ke10afcfs7c78a11355c5957a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50903150420ke10afcfs7c78a11355c5957a@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: Angel Tsankov <fn42551@fmi.uni-sofia.bg>, linux-c-programming@vger.kernel.org

Steve,

> The following code snippet should do it.  It basically sets errno
> manually and outputs the associated error message.
> 
> --- BEGIN ---
> 
> #define _ALL_SOURCE
> 
> #include <stdio.h>
> #include <errno.h> /* for _MAX_ERRNO */
> 

I've searched in headers on /usr/include for MAX_ERRNO but not found.
Where MAX_ERRNO is defined?

A *very* simple workaround was check for "Unknown" word, so I tried:

int main(void) {
	int i=0;
	extern int errno;
	char str[128];

	while (strncmp(str,"Unknown",7)) {
		sprintf(str,"%s",strerror(i));
		fprintf(stderr, "%3d", i);
		errno = i;
		perror(" ");
		i++;
	}

	return (0);
}


But there is "Unknown" between valid error messages.
I think there is a better way to do it....


Best regards,

--tm

