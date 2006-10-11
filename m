From: "Markus Rechberger" <mrechberger@gmail.com>
Subject: Re: Turning PC monitor on/off
Date: Wed, 11 Oct 2006 12:20:45 +0200
Message-ID: <d9def9db0610110320u2b270563t22ed5af8290e5cc1@mail.gmail.com>
References: <f68850780610102304g35ea4fa6pb4bf2a0db9b14668@mail.gmail.com>
	 <1160554317.4000.3.camel@localhost.localdomain>
	 <f68850780610110226v38ff4650w94a53129b7f7ec0e@mail.gmail.com>
	 <452CC11C.7040309@computer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <452CC11C.7040309@computer.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Per Jessen <per@computer.org>
Cc: C programming list <linux-c-programming@vger.kernel.org>

Hi,

first of all it might be useful how DPMS works,
http://webpages.charter.net/dperr/dpms.htm

Instead of using X you could try to use some kind of Vesa feature.
Maybe your bios has a revealed interface in Linux for that feature too

Markus

On 10/11/06, Per Jessen <per@computer.org> wrote:
> Raseel Bhagat wrote:
> > Hi
> >
> > On 10/11/06, Henry Margies <henry.margies@gmx.de> wrote:
> >> Maybe it also helps to look at the sources of xset program  of X11.
> >>
> >> xset dpms force off
> >>
> >> Turns off the monitor (until you press a key or so).
> >
> > But what if I'm not on the X-window ?
> > As in, I'm running this program from console, or one of the virtual
> > terminals ?
>
> You said you wanted to look at the code and xset is probably a good
> example.  Whether it'll also work from the commandline with no active X
> system, that's for you to find out :-)
>
>
> /Per Jessen, Zurich
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Markus Rechberger
