From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: named structure members
Date: Fri, 12 Sep 2003 10:52:54 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000701c37935$2ab5f020$0b04a8c0@aca.org.ar>
References: <20030912134709.GA5893@3d-computers.co.uk>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030912134709.GA5893@3d-computers.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Matthew Harrison' <matth@3d-computers.co.uk>
Cc: linux-c-programming@vger.kernel.org

It seems like there is no attached version :)


-----Mensaje original-----
De: Matthew Harrison [mailto:matth@3d-computers.co.uk]
Enviado el: Viernes, 12 de Septiembre de 2003 10:47
Para: Mariano Moreyra
CC: linux-c-programming@vger.kernel.org
Asunto: Re: named structure members


well it's all changed a bit now. i have been learning how to use gdb
and as a result have managed to replace the strcpy's and other bit that
cause segfaults. The app now runs cleanly but i am running into trouble
with my config-file-reading function. it was not my function, i copied
it off the web so i might just write myself a quick one.

attached is a version that should not segfault and only stops working
because the configfile isn't read properly.

what part if the configure script did you have trouble with.

thanks

On Fri, Sep 12, 2003 at 10:22:40AM -0300, Mariano Moreyra wrote:
> Hi Matthew,
> First of all, I couldn't install the Inventory. I don't know why the
> configure script throws me an error.
> But looking at the sources:
>  - Like I said yesterday, if you define db_host as a "char *db_host "
> instead of
>    "char db_host[NN]" you have to alloc some memory to that string be=
fore
> the strcpy
>
> But you told me that you had it defined like "char db_host[NN]" and
already
> had that segfault...am I right??
>
> -----Mensaje original-----
> De: linux-c-programming-owner@vger.kernel.org
> [mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Matthe=
w
> Harrison
> Enviado el: Jueves, 11 de Septiembre de 2003 14:13
> Para: linux-c-programming@vger.kernel.org
> Asunto: Re: named structure members
>
>
> i am going thru all these suggestions at a slow rate, but it's time
> to finish work now so I won't be able to reply from home.
>
> please don't think i'm ignoring you, i am very grateful.
>
> On Thu, Sep 11, 2003 at 06:52:13PM +0200, Jan-Benedict Glaw wrote:
> > On Thu, 2003-09-11 16:50:05 +0100, Glynn Clements
> <glynn.clements@virgin.net>
> > wrote in message <16224.39341.204427.234601@cerise.nosuchdomain.co.=
uk>:
> > > Matthew Harrison wrote:
> > > > here is the struct that i want my config to go into:
> > > There are a number of ways which you could improve upon this, but
> > > there isn't anything along the lines of:
> > >
> > > 	config.<something involving "keyword"> =3D value;
> > >
> > > Structure fields have to be specified explicitly; you can't "inde=
x" a
> > > structure in the manner of an associative array.
> > >
> > > One possible solution is:
> > >
> > > enum cfg_option {
> > > 	cfg_db_host,
> > > 	cfg_db_name,
> > > 	cfg_db_pass,
> > > 	cfg_db_user,
> > > 	CFG_COUNT
> > > };
> > [...]
> > Another approach is to use a union (containing any possible things,=
 in
> > your case only char pointers) inside a struct (which also contains =
a
> > char name[] and an int type). Build up an array with these structs,=
 one
> > for each config option.
> >
> > Then have a function which gets on option name as well as an option
> > value which searches throuch all ->name's of your array and assigns=
 the
> > (properly converted) value to the proper union type.
> >
> > To access these options, use multiple access functions (ie.
> >
> > int get_int(char *option)
> >
> > ) which also searches through the array and returns the int part of=
 the
> > union.
> >
> > MfG, JBG
> >
> > --
> >    Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
> >    "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Ge=
gen
> Krieg
> >     fuer einen Freien Staat voll Freier B=FCrger" | im Internet! | =
  im
> Irak!
> >       ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM =
|
TCPA));
>
>
>
> --
> Mat Harrison
> Technical Developer
> 3d Computer Systems Ltd.
> matth@3d-computers.co.uk
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
Mat Harrison
Technical Developer
3d Computer Systems Ltd.
matth@3d-computers.co.uk

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
