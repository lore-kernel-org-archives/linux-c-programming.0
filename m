From: canbaby <canbaby@21cn.com>
Subject: Re: Pointer to int
Date: Thu, 22 Jul 2004 13:21:25 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40FF4ED5.4020208@21cn.com>
References: <20040721_211129_060718.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040721_211129_060718.r_zaca@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ronaldo Zacarias Afonso <r_zaca@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

Ronaldo Zacarias Afonso wrote:

>  Hello everybody,=20
>
>  I'm iniciating in the C programming language and there are some thin=
gs=20
>that I realy need to understand, so the question is:=20
>
>  In the code:=20
>
>  int i;=20
>  struct some_struct *ptr;=20
>
>  ptr =3D &some_other_struct;=20
>
>  i =3D (int) ptr;=20
>
>
>  1) Is the last sentence a valid one?=20
>  2) If it is, what is realy happening?=20
>
>note - It seems very stranger to me. A struct pointer being "transform=
ed"=20
>into a int variable.=20
>
>  Thanks.=20
>
>
>______________________________________________________________________=
___________
>Quer mais velocidade?
>S=F3 com o acesso Aditivado iG, a velocidade que voc=EA quer na hora q=
ue voc=EA precisa.
>Clique aqui: http://www.acessoaditivado.ig.com.br
>
> =20
>
yes,it's a validate one.
now the var i have the the some_other_struct address value,you could=20
reconstruct the struct like this:
struct some_struct *newstruct =3D (struct some_struct *)i;
then freely use the newstruct.
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
