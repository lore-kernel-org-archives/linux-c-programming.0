From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: parsing with fscanf().
Date: Wed, 11 Sep 2002 20:36:04 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15743.39716.721664.139238@cerise.nosuchdomain.co.uk>
References: <20020911212428.A1167@neutrino.particles.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020911212428.A1167@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elias Athanasopoulos <eathan@otenet.gr>
Cc: linux-c-programming@vger.kernel.org


Elias Athanasopoulos wrote:

> A really newbie question, but I have no time for research (my deadline
> is counted in hours).
> 
> I have to parse a text file, which has been exported from MS Excel (I
> have no access to this thingie) using TABs as delimeters. The text
> is like:
> 
> 4	3	2.0
> 5		1.2
> 4	3	2.4
> 
> I use fscanf() to insert the data to my structures, but the "gap" (between
> 5 and 1.2) breaks the sequence. fscanf() places the 3rd column to the 2nd
> field in my structure.
> 
> Is there a trivial way to bypass the problem using fscanf() or I have to do 
> the parsing using read()?

fscanf() is worthless when the data doesn't adhere to a rigid format. 
One of the main problems is that, even when it isn't entirely
successful, it consumes some of the data from the stream.

A better solution is to read whole lines (e.g. with fgets), then parse
it with sscanf(). That way, if sscanf() fails, you can try again with
the same data. E.g.

	for (;;)
	{
		char buff[81];
		fgets(buff, sizeof(buff), fp);
		if (sscanf(buff, "%d %d %f", &i1, &i2, &f) == 3)
			continue;
		if (sscanf(buff, "%d %f", &i1, &f) == 2)
			continue;
		error();
	}

If you ever need to write a real parser, learn lex/yacc.

-- 
Glynn Clements <glynn.clements@virgin.net>
