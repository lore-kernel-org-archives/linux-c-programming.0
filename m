From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: const char * vs char[]
Date: Tue, 23 Mar 2004 11:52:12 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000f01c410e6$6d7197e0$0c81640a@aca.org.ar>
References: <20040323151902.000048da.cialdi@firenze.net>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040323151902.000048da.cialdi@firenze.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Massimiliano Cialdi' <cialdi@firenze.net>, 'linux-c-programming' <linux-c-programming@vger.kernel.org>

No... "char*" and "char []" are synonyms.
But in this case, you were having a warning because you were passing a
"const char *" to a function that expected a "char *" so the warning was
about the "const" qualifier.
If you have a code like this you wont have any warning at all

#include <stdio.h>
char *str = "pippo";    <---- Note there is no "const" quailfier anymore
int main(void)
{
  void stampa(char s[]);
  stampa(str);
  return 0;
}
void stampa(char s[])
{
 printf("%s\n", s);
}

So, "char[]" and "char*" are synonyms indeed.


-----Mensaje original-----
De: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de
Massimiliano Cialdi
Enviado el: Martes, 23 de Marzo de 2004 11:19
Para: linux-c-programming
Asunto: Re: const char * vs char[]


On Tue, 23 Mar 2004 10:44:36 -0300
"Mariano Moreyra" <moremari@aca.org.ar> wrote:

> I think that the problem is not a difference between "char*" and
> "char[]" The problem is that stampa is receiving a "char[]" and you
> are passing a"const char*" as the arg.
> The "qualifiers from pointer targer type" refers to the "const" part
> of the"const char*" declaration I belive.
> If you declare stampa like this:
>
> void stampa(const char s[]);
>
> you won't have this warning anymore.
so what is a synonym of char[]? Maybe "char (const *)"?

thanks
--
Massimiliano Cialdi
cialdi@firenze.net
m.cialdi@oksys.it
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

