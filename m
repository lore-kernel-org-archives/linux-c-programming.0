From: Matthew Harrison <matth@3d-computers.co.uk>
Subject: named structure members
Date: Thu, 11 Sep 2003 12:07:42 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030911110742.GD6863@3d-computers.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YToU2i3Vx8H2dn7O"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--YToU2i3Vx8H2dn7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hi,
  another one for you gurus, i haven't found anything on this myself
as i don't really know what to call it where a search engine is
concerned.

i have the following code.

<snip>
for(i =3D 0; i < n_values; ++i)
        {
                strcpy(keyword, good_values[i]);

                switch (read_config_var(values_file, keyword, value))
                {
                        case 0:
                                strcpy(config.?, value);
                                break;
                        case -1:
                                printf("\nFile Error for [%s] \n", values_f=
ile);
                                break;
                        case -2:
                                printf("\nBad User Parm for [%s] \n", keywo=
rd);
                                break;
                        default:
                                printf("\nUnknown Error Occurred \n");
                                break;
                }
        }
</snip>

what i'm doing is stepping thru an array of different config options
calling the read_config_var on each one and checking the output.
if the output is good then i want to store the value in a member of
a structure. for example i want the config options to be stored like
this:

config.db_host =3D 'maiden.genestate.com'
config.db_user =3D 'root'

you get the idea. my question is how do i dynamically assign a name
to a structure member. I have good_values[i] which contains the
current config directive but if you look at line 8 of the example,
you can see the problem, how do i say config.good_values[i], when
good_values[i] is not itself a member.

sorry for not being able to explain this very well but you can see
what i mean.

thanks in advance

--=20
Mat Harrison
Technical Developer
3d Computer Systems Ltd.
matth@3d-computers.co.uk

--YToU2i3Vx8H2dn7O
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (OpenBSD)

iD8DBQE/YFd+mbMTrp/jhicRAtDpAJ9wnR+v2mmCX3CNqNELQ77mytdAjQCdEG1J
bOIFHEyeJOIFOLrXtBI83uE=
=Wien
-----END PGP SIGNATURE-----

--YToU2i3Vx8H2dn7O--
