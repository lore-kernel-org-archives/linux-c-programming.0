From: =?iso-8859-1?Q?Carlos_Fern=E1ndez?= <cfernandez@myalert.com>
Subject: Re: parsing with fscanf().
Date: Thu, 12 Sep 2002 14:21:58 +0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <003601c25a2d$1717d060$305311ac@bangkok1>
References: <Pine.LNX.4.33.0209121254590.309-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>, Elias Athanasopoulos <eathan@otenet.gr>
Cc: Glynn Clements <glynn.clements@virgin.net>, linux-c-programming@vger.kernel.org

http://epaperpress.com/lexandyacc/

(happens to be the first result on google, btw)

----- Original Message -----
From: "Mohammed Khalid Ansari" <khalid@ncst.ernet.in>
To: "Elias Athanasopoulos" <eathan@otenet.gr>
Cc: "Glynn Clements" <glynn.clements@virgin.net>;
<linux-c-programming@vger.kernel.org>
Sent: Thursday, September 12, 2002 2:25 PM
Subject: Re: parsing with fscanf().


>
> Hello,
>
> Is there any site which gives an extensive tutorial on lex/yacc?
>
> with regards...
>
> --
>
> **************************************************************************
>
> Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
> Assistant Manager II                          (off) : 0091-022-2024641
> National Centre for Software Technology   Fax       : 0091-022-2049573
> 8th flr,Air India Build. Nariman Point,   E-Mail    : khalid@ncst.ernet.in
> Mumbai 400021.
>
> Homepage : http://soochak.ncst.ernet.in/~khalid
>
> **************************************************************************
>
> On Wed, 11 Sep 2002, Elias Athanasopoulos wrote:
>
> > On Wed, Sep 11, 2002 at 08:36:04PM +0100, Glynn Clements wrote:
> > > fscanf() is worthless when the data doesn't adhere to a rigid format.
> > > One of the main problems is that, even when it isn't entirely
> > > successful, it consumes some of the data from the stream.
> > >
> > > A better solution is to read whole lines (e.g. with fgets), then parse
> > > it with sscanf(). That way, if sscanf() fails, you can try again with
> > > the same data. E.g.
> > >
> > > for (;;)
> > > {
> > > char buff[81];
> > > fgets(buff, sizeof(buff), fp);
> > > if (sscanf(buff, "%d %d %f", &i1, &i2, &f) == 3)
> > > continue;
> > > if (sscanf(buff, "%d %f", &i1, &f) == 2)
> > > continue;
> > > error();
> > > }
> >
> > Thank you. I was up to write something like that, but I wasn't sure and
> > was ready to give up and go traditionaly with read(). ANW, thanks for
> > the above code, it helps a lot. :-)
> >
> > > If you ever need to write a real parser, learn lex/yacc.
> >
> > Nah... it is for a short report, a project that I want to spend as less
> > time as I can.
> >
> > Elias
> >
> >
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

