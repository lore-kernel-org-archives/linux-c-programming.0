From: Hossein Mobahi <hmobahi@yahoo.com>
Subject: Re: Pointer
Date: Wed, 18 Aug 2004 15:05:15 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040818220515.52030.qmail@web12702.mail.yahoo.com>
References: <20040818_210521_080945.r_zaca@ig.com.br>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040818_210521_080945.r_zaca@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-c-programming@vger.kernel.org

Hi

You must not only determine the address, but also the
data type. In fact, a vaule in a memory location can
have a different types and its correct interpretation
is not possible unless its type in known. Here is an
example for integer type:

main()
{
  int *x ;
  ...
  ...
  x=3D(int *) 0x1234 ; // Set the pointer
  *x=3D1 ; // Set its content (integer)
}

Hope it helps

--Hossein

--- Ronaldo Zacarias Afonso <r_zaca@ig.com.br> wrote:

>   Hello everyone,=20
>=20
>   This is a newbie=B4s question, but if someone could
> help me!=20
>   How can I assign an address value to a pointer,
> for example: I need a=20
> pointer that points to address 0x12345, so I can
> manipulate the content of=20
> that address.=20
>   Is it possible?=20
>   Can anybody help me?=20
>=20
>   Thanks!=20
>=20
>
___________________________________________________________________________=
______
> Quer mais velocidade?
> S=F3 com o acesso Aditivado iG, a velocidade que voc=EA
> quer na hora que voc=EA precisa.
> Clique aqui: http://www.acessoaditivado.ig.com.br
>=20
>=20



	=09
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - Send 10MB messages!
http://promotions.yahoo.com/new_mail=20
-
To unsubscribe from this list: send the line "unsubscribe linux-c-programmi=
ng" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
