From: Matthew Harrison <matth@3d-computers.co.uk>
Subject: Re: named structure members
Date: Thu, 11 Sep 2003 16:28:18 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030911152818.GF14403@3d-computers.co.uk>
References: <20030911142642.GD14403@3d-computers.co.uk> <000901c37872$ccc9fbe0$0b04a8c0@aca.org.ar>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rWhLK7VZz0iBluhq"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000901c37872$ccc9fbe0$0b04a8c0@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
To: Mariano Moreyra <moremari@aca.org.ar>
Cc: linux-c-programming@vger.kernel.org


--rWhLK7VZz0iBluhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2003 at 11:41:34AM -0300, Mariano Moreyra wrote:
> Ok... I understood that what you wanted was to name your structure members
> dynamically.
> But if you will only have those for members, that's a good approach
> Now, are you allocating memory for your strings before doing a strcpy??
> Because you defined your members like char pointers, you have to dynamica=
lly
> allocate some memory form them before use.
> You could define your members like arrays instead of char pointers (i.e c=
har
> db_host[256])
>

actually that was one of the things i tried to get rid of the segfault.

i used to have the struct below like:

typedef struct _CFG_struct
{
	char db_host[32];
	...
}

but then i changed it to the below option while trying to debug.

>=20
> ------
>=20
> this is getting very complex.
>=20
> here is the struct that i want my config to go into:
>=20
> <snip>
> typedef struct _CFG_struct
> {
>        char *db_host;
>        char *db_name;
>        char *db_pass;
>        char *db_user;
> }CFG;
> </snip>
>=20
> and I am doing the following (pseudo code)
>=20
> <snip>
> for(i =3D 0; i <=3D array_of_config_items; i++)
> {
> 	keyword =3D array_of_config_items[i];
>=20
> 	while (read_config_file !=3D EOF)
> 	{
> 		check_return_value;
> 		if keyword =3D 'item1'
> 		{
> 			item1 =3D value;
> 		}
> 		elsif keyword =3D 'item2'
> 		{
> 			item2 =3D value;
> 		}
> 		and_so_on();
> 	}
> }
> </snip>
>=20
> i can sort it now with the multiple if's but now it segfaults on
> a strcpy for some reason and i'm still learning how to use gdb.
>=20
> On Thu, Sep 11, 2003 at 11:03:59AM -0300, Mariano Moreyra wrote:
> > > what i'm doing is stepping thru an array of different config options
> > > calling the read_config_var on each one and checking the output.
> > > if the output is good then i want to store the value in a member of
> > > a structure. for example i want the config options to be stored like
> > > this:
> >
> > > config.db_host =3D 'maiden.genestate.com'
> > > config.db_user =3D 'root'
> >
> > > you get the idea. my question is how do i dynamically assign a name
> > > to a structure member. I have good_values[i] which contains the
> > > current config directive but if you look at line 8 of the example,
> > > you can see the problem, how do i say config.good_values[i], when
> > > good_values[i] is not itself a member.
> >
> > I think that I get the idea ...
> > But are you sure that is that what you want??
> > I mean, the idea is that in your config option you could have any config
> > directives (or keys) and values??
> > How you will handle that options later without knowing from the begining
> > what options you could have??
> > Anyway...I think that you could do is create your structure like this:
> >
> >  typedef struct {
> > 	char key[255];
> > 	cahr value[255];
> >  } t_config;
> >
> >  t_config config[20];   // Change 20 and 255 to adapt to your needs
> >
> >
> >  so your code would look like this:
> >
> > for(i =3D 0; i < n_values; ++i)
> >         {
> >                 strcpy(keyword, good_values[i]);
> >
> >                 switch (read_config_var(values_file, keyword, value))
> >                 {
> >                         case 0:
> >                                 strcpy(config[i].key, keyword);
> > 					  strcpy(config[i].value, value);
> >                                 break;
> >                         case -1:
> >                                 printf("\nFile Error for [%s] \n",
> > values_file);
> >                                 break;
> >                         case -2:
> >                                 printf("\nBad User Parm for [%s] \n",
> > keyword);
> >                                 break;
> >                         default:
> >                                 printf("\nUnknown Error Occurred \n");
> >                                 break;
> >                 }
> >         }
> >
> >
> > I'm not sure if is that what you want...and if I really understood your
> > problem...
> > So, let me know if this mail sucks! :)
> >
> > --
> > Mariano Moreyra <mariano_moreyra@aca.org.ar>
>=20
> --=20
> Mat Harrison
> Technical Developer
> 3d Computer Systems Ltd.
> matth@3d-computers.co.uk

--=20
Mat Harrison
Technical Developer
3d Computer Systems Ltd.
matth@3d-computers.co.uk

--rWhLK7VZz0iBluhq
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (OpenBSD)

iD8DBQE/YJSSmbMTrp/jhicRAi29AJwO/hm1Jhc+/yCUZtIorkFuXjWMOACghZX3
/kS6o0K1Z2u6hEtdNPlB2+g=
=Uode
-----END PGP SIGNATURE-----

--rWhLK7VZz0iBluhq--
