From: Matthew Harrison <matth@3d-computers.co.uk>
Subject: Re: named structure members
Date: Thu, 11 Sep 2003 15:26:42 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030911142642.GD14403@3d-computers.co.uk>
References: <20030911110742.GD6863@3d-computers.co.uk> <000401c3786d$8cfc01c0$0b04a8c0@aca.org.ar>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000401c3786d$8cfc01c0$0b04a8c0@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
To: Mariano Moreyra <moremari@aca.org.ar>
Cc: linux-c-programming@vger.kernel.org


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

this is getting very complex.

here is the struct that i want my config to go into:

<snip>
typedef struct _CFG_struct
{
        char *db_host;
	char *db_name;
	char *db_pass;
	char *db_user;
}CFG;
</snip>

and I am doing the following (pseudo code)

<snip>
for(i =3D 0; i <=3D array_of_config_items; i++)
{
	keyword =3D array_of_config_items[i];

	while (read_config_file !=3D EOF)
	{
		check_return_value;
		if keyword =3D 'item1'
		{
			item1 =3D value;
		}
		elsif keyword =3D 'item2'
		{
			item2 =3D value;
		}
		and_so_on();
	}
}
</snip>

i can sort it now with the multiple if's but now it segfaults on
a strcpy for some reason and i'm still learning how to use gdb.

On Thu, Sep 11, 2003 at 11:03:59AM -0300, Mariano Moreyra wrote:
> > what i'm doing is stepping thru an array of different config options
> > calling the read_config_var on each one and checking the output.
> > if the output is good then i want to store the value in a member of
> > a structure. for example i want the config options to be stored like
> > this:
>=20
> > config.db_host =3D 'maiden.genestate.com'
> > config.db_user =3D 'root'
>=20
> > you get the idea. my question is how do i dynamically assign a name
> > to a structure member. I have good_values[i] which contains the
> > current config directive but if you look at line 8 of the example,
> > you can see the problem, how do i say config.good_values[i], when
> > good_values[i] is not itself a member.
>=20
> I think that I get the idea ...
> But are you sure that is that what you want??
> I mean, the idea is that in your config option you could have any config
> directives (or keys) and values??
> How you will handle that options later without knowing from the begining
> what options you could have??
> Anyway...I think that you could do is create your structure like this:
>=20
>  typedef struct {
> 	char key[255];
> 	cahr value[255];
>  } t_config;
>=20
>  t_config config[20];   // Change 20 and 255 to adapt to your needs
>=20
>=20
>  so your code would look like this:
>=20
> for(i =3D 0; i < n_values; ++i)
>         {
>                 strcpy(keyword, good_values[i]);
>=20
>                 switch (read_config_var(values_file, keyword, value))
>                 {
>                         case 0:
>                                 strcpy(config[i].key, keyword);
> 					  strcpy(config[i].value, value);
>                                 break;
>                         case -1:
>                                 printf("\nFile Error for [%s] \n",
> values_file);
>                                 break;
>                         case -2:
>                                 printf("\nBad User Parm for [%s] \n",
> keyword);
>                                 break;
>                         default:
>                                 printf("\nUnknown Error Occurred \n");
>                                 break;
>                 }
>         }
>=20
>=20
> I'm not sure if is that what you want...and if I really understood your
> problem...
> So, let me know if this mail sucks! :)
>=20
> --=20
> Mariano Moreyra <mariano_moreyra@aca.org.ar>

--=20
Mat Harrison
Technical Developer
3d Computer Systems Ltd.
matth@3d-computers.co.uk

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (OpenBSD)

iD8DBQE/YIYhmbMTrp/jhicRAoJdAJ9mZuNgcTtNY9eRbBINHhlZvhRSaACdEr+V
dr1v3djV9bivG5D5uELvplc=
=GCeH
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
