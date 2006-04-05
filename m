From: Niklaus <niklaus@gmail.com>
Subject: Re: What means "\xc7\x44\x24\x18\xda\xff\xff\xff\xe8" ?
Date: Wed, 5 Apr 2006 10:02:19 +0530
Message-ID: <85e0e3140604042132k443932dcs4eacc7b5954152cf@mail.gmail.com>
References: <6ff3e7140604042030v7c3aee9epec79c398c3d256d0@mail.gmail.com>
	 <17459.16807.734975.510348@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17459.16807.734975.510348@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 
Cc: openbsd shen <openbsd.shen@gmail.com>, linux-c-programming <linux-c-programming@vger.kernel.org>

On 4/5/06, Glynn Clements <glynn@gclements.plus.com> wrote:
>
> openbsd shen wrote:
>
> > In a get_sct() function, it have some lines:
> >
> > pt =3D (char *) memmem(p+7, SCLEN-(p-code)-7,
> > "\xc7\x44\x24\x18\xda\xff\xff\xff\xe8", 9);
> > if (!pt)
> >      return 0;
> >
> >
> > when run here, it always return 0, so I want to know what means the
> > "\xc7\x44\x24\x18\xda\xff\xff\xff\xe8" ?
>
> It's just the string of bytes being searched for, specified as a C
> string literal using hexadecimal codes.
Since the characters are not printable he has given it the values of
ascii characters in hexadecimal. It always returns NULL , maybe
because the text you are running it on doesn't have that string. Try
running it on the string containing =C7D$=DA=FF=FF=FF=E8
It will not return NULL.

Just look into man memmem

#include<stdio.h>
#include<string.h>

#include<stdio.h>

int main()
{
                char *s=3D"\xc7\x44\x24\x18\xda\xff\xff\xff\xe8";
                char *s1=3D"\x4e\x49\x4b";
                char s2[]=3D"Niklaus";
                char s3[]=3D"IINIKlaus";
                char s4[]=3D"Hi=C7D$=DA=FF=FF=FF=E8Hiya";
                printf("%s\n",s);
                printf("%s\n",s1);
                printf("%s\n", memmem(s2,sizeof(s2),s1,3));
                printf("%s\n", memmem(s3,sizeof(s3),s1,3));
                printf("%s\n", memmem(s4,sizeof(s4),s,3));
                return 0;
}

~

>
> --
> Glynn Clements <glynn@gclements.plus.com>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
