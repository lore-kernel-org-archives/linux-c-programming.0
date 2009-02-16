From: ben <brouits@free.fr>
Subject: Re: warning: =?UTF-8?B?4oCYc3RydWN0IOKAmSBkZWNsYXJlZCBpbnNpZGUgcA==?=
 =?UTF-8?B?YXJhbWV0ZXIgbGlzdA==?=
Date: Mon, 16 Feb 2009 18:03:26 +0100
Message-ID: <49999C5E.1000401@free.fr>
References: <875251.26275.qm@web63406.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <875251.26275.qm@web63406.mail.re1.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-c-programming@vger.kernel.org

=46undu a =C3=A9crit :
> i'm running ubuntu 8.04 with gcc-4.2=20
> and i'm getting=20
>=20
> mb_con.h:43: warning: =E2=80=98struct query_resp=E2=80=99 declared in=
side parameter list
> mb_con.h:43: warning: its scope is only this definition or declaratio=
n, which is probably not what you want
> here's a snippet of how .h file looks
>=20
> struct query_resp_type
> {
>   int type;
> } query_resp;
you defined here _both a type and a variable_.
this should not be done inside a .h file...

maybe you expected to redefine a type, and forgot to 'typedef' ?
=3D=3D
struct query_resp_type {
  int type;
};

typedef struct query_resp_type query_resp;
=3D=3D
after such a typedef, you will be able to use type 'query_resp'
(note that 'struct' is not part of the type name)

> void send_req(struct query_resp* resp);
wrong. type 'struct query_resp' does not exist.
but 'struct query_resp_type' does.
>=20
>=20
> what i don't understand is why this warning when i have declared the =
struct before the function in the header.
typo issue.

> what am i missing ?
see above
> thanks in advance !
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
