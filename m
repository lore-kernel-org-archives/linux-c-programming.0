From: Fundu <fundu_1999@yahoo.com>
Subject: =?utf-8?B?UmU6IHdhcm5pbmc6IOKAmHN0cnVjdCDigJkgZGVjbGFyZWQgaW5zaWRlIHBh?=
 =?utf-8?B?cmFtZXRlciBsaXN0?=
Date: Mon, 16 Feb 2009 18:30:23 -0800 (PST)
Message-ID: <632748.38812.qm@web63402.mail.re1.yahoo.com>
References: <49999C5E.1000401@free.fr>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <49999C5E.1000401@free.fr>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-c-programming@vger.kernel.org, ben <brouits@free.fr>

thanks Ben !


--- On Mon, 2/16/09, ben <brouits@free.fr> wrote:

> From: ben <brouits@free.fr>
> Subject: Re: warning: =E2=80=98struct =E2=80=99 declared inside param=
eter list
> To: linux-c-programming@vger.kernel.org
> Date: Monday, February 16, 2009, 9:03 AM
> Fundu a =C3=A9crit :
> > i'm running ubuntu 8.04 with gcc-4.2=20
> > and i'm getting=20
> >=20
> > mb_con.h:43: warning: =E2=80=98struct query_resp=E2=80=99 declared
> inside parameter list
> > mb_con.h:43: warning: its scope is only this
> definition or declaration, which is probably not what you
> want
> > here's a snippet of how .h file looks
> >=20
> > struct query_resp_type
> > {
> >   int type;
> > } query_resp;
> you defined here _both a type and a variable_.
> this should not be done inside a .h file...
>=20
> maybe you expected to redefine a type, and forgot to
> 'typedef' ?
> =3D=3D
> struct query_resp_type {
>   int type;
> };
>=20
> typedef struct query_resp_type query_resp;
> =3D=3D
> after such a typedef, you will be able to use type
> 'query_resp'
> (note that 'struct' is not part of the type name)
>=20
> > void send_req(struct query_resp* resp);
> wrong. type 'struct query_resp' does not exist.
> but 'struct query_resp_type' does.
> >=20
> >=20
> > what i don't understand is why this warning when i
> have declared the struct before the function in the header.
> typo issue.
>=20
> > what am i missing ?
> see above
> > thanks in advance !
> >=20
> --
> To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at=20
> http://vger.kernel.org/majordomo-info.html


     =20
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
