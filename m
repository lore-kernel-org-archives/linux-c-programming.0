From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: Re: parsing with fscanf().
Date: Thu, 12 Sep 2002 12:55:47 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0209121254590.309-100000@soochak.ncst.ernet.in>
References: <20020911230840.B1167@neutrino.particles.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020911230840.B1167@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elias Athanasopoulos <eathan@otenet.gr>
Cc: Glynn Clements <glynn.clements@virgin.net>, linux-c-programming@vger.kernel.org


Hello,

Is there any site which gives an extensive tutorial on lex/yacc?

with regards...

-- 

**************************************************************************

Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
Assistant Manager II                          (off) : 0091-022-2024641
National Centre for Software Technology   Fax       : 0091-022-2049573 
8th flr,Air India Build. Nariman Point,   E-Mail    : khalid@ncst.ernet.in 	
Mumbai 400021.

Homepage : http://soochak.ncst.ernet.in/~khalid			  	  

**************************************************************************

On Wed, 11 Sep 2002, Elias Athanasopoulos wrote:

> On Wed, Sep 11, 2002 at 08:36:04PM +0100, Glynn Clements wrote:
> > fscanf() is worthless when the data doesn't adhere to a rigid format. 
> > One of the main problems is that, even when it isn't entirely
> > successful, it consumes some of the data from the stream.
> > 
> > A better solution is to read whole lines (e.g. with fgets), then parse
> > it with sscanf(). That way, if sscanf() fails, you can try again with
> > the same data. E.g.
> > 
> > 	for (;;)
> > 	{
> > 		char buff[81];
> > 		fgets(buff, sizeof(buff), fp);
> > 		if (sscanf(buff, "%d %d %f", &i1, &i2, &f) == 3)
> > 			continue;
> > 		if (sscanf(buff, "%d %f", &i1, &f) == 2)
> > 			continue;
> > 		error();
> > 	}
> 
> Thank you. I was up to write something like that, but I wasn't sure and
> was ready to give up and go traditionaly with read(). ANW, thanks for
> the above code, it helps a lot. :-)
> 
> > If you ever need to write a real parser, learn lex/yacc.
> 
> Nah... it is for a short report, a project that I want to spend as less
> time as I can. 
> 
> Elias
> 
> 

