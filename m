From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Newbie Questions
Date: Tue, 9 Apr 2002 23:14:59 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15539.26595.394984.499696@cerise.nosuchdomain.co.uk>
References: <f7.19630fb1.29e4b99b@aol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <f7.19630fb1.29e4b99b@aol.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gyzmobro@aol.com
Cc: linux-c-programming@vger.kernel.org


Gyzmobro@aol.com wrote:

> Linux Free Mail has been down so I haven't had a chance to respond to this 
> thread and am now forced to use a proprietary email system. I hope I haven't 
> missed parts of this thread and I don't have the last email, but here I go:
> 
> >From what you've said, I would have to write a while loop that goes through
> the file one line at a time and checks to see if it's
> at the EOF through an if statement. How would I make
> the program go through the file line by line? Is this 
> if statement right:?
> 
> char c_check_eof[10];
> 
> if(fgets(c_check_eof, 10, fp) == "EOF")
> {
>  break;
> }

No. It should be:

	char line[80];	/* large enough to hold one line of input */

	...

	for (;;) {
		if (!fgets(line, sizeof(line), fp))
			break;

		/* if we get here, "line" holds one line of input */
		...
	}

-- 
Glynn Clements <glynn.clements@virgin.net>
