From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: parsing with fscanf().
Date: Wed, 11 Sep 2002 23:08:40 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020911230840.B1167@neutrino.particles.org>
References: <20020911212428.A1167@neutrino.particles.org> <15743.39716.721664.139238@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15743.39716.721664.139238@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Wed, Sep 11, 2002 at 08:36:04PM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: Elias Athanasopoulos <eathan@otenet.gr>, linux-c-programming@vger.kernel.org

On Wed, Sep 11, 2002 at 08:36:04PM +0100, Glynn Clements wrote:
> fscanf() is worthless when the data doesn't adhere to a rigid format. 
> One of the main problems is that, even when it isn't entirely
> successful, it consumes some of the data from the stream.
> 
> A better solution is to read whole lines (e.g. with fgets), then parse
> it with sscanf(). That way, if sscanf() fails, you can try again with
> the same data. E.g.
> 
> 	for (;;)
> 	{
> 		char buff[81];
> 		fgets(buff, sizeof(buff), fp);
> 		if (sscanf(buff, "%d %d %f", &i1, &i2, &f) == 3)
> 			continue;
> 		if (sscanf(buff, "%d %f", &i1, &f) == 2)
> 			continue;
> 		error();
> 	}

Thank you. I was up to write something like that, but I wasn't sure and
was ready to give up and go traditionaly with read(). ANW, thanks for
the above code, it helps a lot. :-)

> If you ever need to write a real parser, learn lex/yacc.

Nah... it is for a short report, a project that I want to spend as less
time as I can. 

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
