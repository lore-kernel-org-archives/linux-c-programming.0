From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Graphs: Arbitrary Dijkstra's algorithm implementation
Date: Wed, 17 Dec 2003 03:53:40 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16351.54084.442280.424455@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.44.0312151149040.15956-200000@ns.isi.ulatina.ac.cr>
	<20031216204607.11876.qmail@web41315.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20031216204607.11876.qmail@web41315.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: b klein <b_klein1@yahoo.com>
Cc: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>, linux-c-programming@vger.kernel.org


b klein wrote:

> im a beginner here so please say if i do something off
> topic.
> i tried to set 
> #define     NODES   8
> and then(i hope this is right) i changed the
> constructor:
> grafo(void) //inicializa la matriz de costos y los
> > vectores temporales
> >   {
> >       //for (int i=1; i<=7; i++) was
> > 	 //for (int j=1; j<=7; j++)
> now 
>        for (int i=1; i<=NODES; i++) was
>  	for (int j=1; j<=NODES; j++)
>  	  costos[i][j]=10000;

If costos has dimensions costos[NODES][NODES], the above is invalid;
when i == NODES or j == NODES, you are exceeding the bounds of the
array. If an array has size N, the valid indices range from 0 to N-1
inclusive; N isn't a valid index.

-- 
Glynn Clements <glynn.clements@virgin.net>
