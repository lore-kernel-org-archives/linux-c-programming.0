From: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Subject: Re: Graphs: Arbitrary Dijkstra's algorithm implementation
Date: Wed, 17 Dec 2003 12:04:02 -0600 (CST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0312171202080.27449-100000@ns.isi.ulatina.ac.cr>
References: <16351.54084.442280.424455@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16351.54084.442280.424455@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: b klein <b_klein1@yahoo.com>, linux-c-programming@vger.kernel.org

HI Glynn.

I thought You were out of linux-c-programming.

> > im a beginner here so please say if i do something off
> > topic.
> > i tried to set
> > #define     NODES   8
> > and then(i hope this is right) i changed the
> > constructor:
> > grafo(void) //inicializa la matriz de costos y los
> > > vectores temporales
> > >   {
> > >       //for (int i=1; i<=7; i++) was
> > > 	 //for (int j=1; j<=7; j++)
> > now
> >        for (int i=1; i<=NODES; i++) was
> >  	for (int j=1; j<=NODES; j++)
> >  	  costos[i][j]=10000;

> If costos has dimensions costos[NODES][NODES], the above is invalid;
> when i == NODES or j == NODES, you are exceeding the bounds of the
> array. If an array has size N, the valid indices range from 0 to N-1
> inclusive; N isn't a valid index

Fixed.
Still not working.

