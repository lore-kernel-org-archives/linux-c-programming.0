From: Ronaldo Zacarias Afonso <r_zaca@ig.com.br>
Subject: Re: Bitfields
Date: Wed, 1 Dec 2004 08:59:25 -0200
Message-ID: <20041201_105925_044724.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1101898765"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1101898765
Content-Type: text/plain; charset="iso-8859-1"
Content-description: Mail message body
Content-Transfer-Encoding: quoted-printable
Content-disposition: inline

  Hi Jagadeesh,=20

  "bit field" is a way that let you define a varible to be less than a byte=
=20
in size. For example: 3 bits.=20
  It is used as structs.=20

struct nibble {=20
     unsigned int n0: 4;=20
     unsigned int n1: 4;=20
     unsigned int n2: 4;=20
     unsigned int n3: 4;=20
};=20

  In this way you have declared four variables, each with a size of four=20
bits.=20





>Hi all,=20
> What is a bitfield? How is it used in C??=20
>=20
>TIA=20
>=20
>--=20
>With regards,=20
>=20
>Jagadeesh Bhaskar P=20
>=20
>-=20
>To unsubscribe from this list: send the line "unsubscribe=20
>linux-c-programming" in=20
>the body of a message to majordomo@vger.kernel.org=20
>More majordomo info at http://vger.kernel.org/majordomo-info.html=20
>=20
>----------=20

___________________________________________________________________________=
______
Quer mais velocidade?
S=F3 com o acesso Aditivado iG, a velocidade que voc=EA quer na hora que vo=
c=EA precisa.
Clique aqui: http://www.acessoaditivado.ig.com.br


--Message-Boundary-by-Mail-Sender-1101898765--

