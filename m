From: Marius Nita <marius@cs.pdx.edu>
Subject: Re: Basic mp3 player
Date: Mon, 9 Dec 2002 15:04:35 -0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021209230435.GB26299@cs.pdx.edu>
References: <20021209122053.B1147@neutrino.particles.org> <Pine.LNX.4.44.0212091458170.12615-100000@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0212091458170.12615-100000@ns.isi.ulatina.ac.cr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: linux-c-programming@vger.kernel.org

On Mon, Dec 09, 2002 at 02:59:32PM -0600, Fabio Miranda Hamburger wrote:
> Dude, i dont want to do it from scrath, i need the code and add it to my
> proyect.
> for example call: plaympe(FILE);
> how a c programmer can use a audio device????

in order to play mp3 files you need a mp3 decoder. you most likely don't want
to write this on your own. there are quite a few good mp3 decoding libs out
there. try libmad, for example. for an example of how libmad is used to play
music, look at the mpg321 source.

so in short, google for libmad and mpg321.

> ---
> Fabio Andres Miranda
> Ingenieria de sistemas informaticos
> Universidad Latina - Costa Rica
> 
> 
> On Mon, 9 Dec 2002, Elias Athanasopoulos wrote:
> 
> > On Sun, Dec 08, 2002 at 01:08:31PM -0600, fabmirha@ns.isi.ulatina.ac.cr wrote:
> > > Hi, I am interested in coding a very thin, basic, small mp3 play in C for dos
> > > and linux.
> >
> > If you want to do it from scratch, i.e. you are interested in the algorithmic
> > part of the project, then you have to learn the MP3 encoding. It's not
> > trivial.
> >
> > I have no resources to suggest but you can find lots of via Google. Just
> > search for lossy compression, MP3 encoding/decoding, etc.
> >
> > Ciao!
> >  Elias
> >
> > --
> > http://gnewtellium.sourceforge.net			MP3 is not a crime.
> >
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
