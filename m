From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: enum types and casting
Date: Fri, 4 May 2007 14:18:35 +0200
Message-ID: <6a00c8d50705040518o2712d37cw8db39d80a20f3b4e@mail.gmail.com>
References: <46342FCA.1090400@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=OdWJgInc7zduB4YX8SRCqqraGVUnJiKkwclObE+zMcPK30kHZPQ8Kv7MQdVPnY/1+rPoq3mOHuH0nDnhTyXCE2RRabNA5v6sSnO3Du9UB4HCseeap+l3ooum2FshEU1qWeJeO5gUzUnzsKcsFy/9MMlFHXIL/W8PT/EwHK2kArA=
In-Reply-To: <46342FCA.1090400@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On 4/29/07, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Hello. Just now I learnt that enums can be very usefully used as type=
s,
> and was experimenting some with it. The following questions arose.
>
> 1. Are enums allowed as types only in C++ and not in C? gcc rejects
> using an enum as a type whereas g++ accepts it.

As Leslie pointed out, you will have to declare variables of type
enumwith the enum keyword.

> 2.
>
> Consider:
>
> enum BODY { SUN, MOON, STAR } ;
> enum PLANET { EARTH, VENUS, MARS, PLUTO } ;
>
> int main ( void )
> {
>         BODY body ;
>         // body =3D 1 ;         // gives error
>         // body =3D EARTH ;     // gives error
>         body =3D (BODY) 1 ;     // does not give error. expected.
>         body =3D (BODY) EARTH ; // does not give error. expected.
>         body =3D 3 ;            // does not give error. unexpected.
>         body =3D (BODY) PLUTO ; // does not give error. unexpected.
> }
>
> When the target enum of the cast contains no name that has the same
> integer value as the value being casted, how does g++ accept the cast=
?
> Is this expected behaviour or a bug?

=46rom the historical perspective, enums are implicitly converted to an
integral value whenever needed. And there __always__ is an integral
value to represent any enum value.  That's why assignments of integers
to variables of type enum are perfectly legal. So, for example, when
you compare two enum values, they are both converted to an integer.

However, assignment of an int to an enum variable leads to undefined
behavior if the enum is not large enough to store the integral value.
So, allowing the assignment of any integer, without casting, to a
variable of enum type, would be worse than the opposite.

To convert an integral type to an enumeration, use the following semant=
ic:

enum TEST { zero =3D 0, one, two };
int i1 =3D 2;
test t1 =3D static_cast<TEST> (i1); // t1 =3D=3D two

The same is true for casts between different enum types.

	\Steve

--

Steve Gr=E4gert <steve@graegert.com>
Jabber    xmpp://graegerts@jabber.org
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
