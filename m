From: Jon Mayo <jon.mayo@gmail.com>
Subject: Re: pass a local variable to a function
Date: Thu, 26 Mar 2009 02:49:21 -0700
Message-ID: <e694f9e00903260249o53c93165pc352197329f3abfc@mail.gmail.com>
References: <56b13acf0903250921w1934942bma7280055c97a9db3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=l38be6LtfO63EWLcXBcZCXNxHDmwSFxqa4vtpjn0Y7E=;
        b=tNhYACR2fMEQhV8Tzclx74dZ2cQdhBn17h+aWVE0lznxrVhFe8Tj3O03H6XRSNhorP
         /fWrnBF6I35ORh9U/aFcrx13QXASo3alYzawROxT1oSy9N4i7OEEp0gZtDWaSs6025+8
         JaZ4C8GjU4lKFjJWjWBmKfafZRjmFQf0xWyNA=
In-Reply-To: <56b13acf0903250921w1934942bma7280055c97a9db3@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?5piO5Lqu?= <longapple@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Wed, Mar 25, 2009 at 9:21 AM, =E6=98=8E=E4=BA=AE <longapple@gmail.co=
m> wrote:
> Hi guys,
>
> This is my first email in this list, any help is much appreciated.
> As I know, it's not allowed to pass a local variable to a function,
> because the stack where local variable resides will be reused by othe=
r
> functions.
> eg:
> =C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0 #include <stdio.h>
> =C2=A0=C2=A0=C2=A0=C2=A0 2
> =C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0 char *fetch();
> =C2=A0=C2=A0=C2=A0=C2=A0 4
> =C2=A0=C2=A0=C2=A0=C2=A0 5=C2=A0 int main(int argc, char *argv[]){
> =C2=A0=C2=A0=C2=A0=C2=A0 6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 char *string;
> =C2=A0=C2=A0=C2=A0=C2=A0 7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 string =3D fetch();
> =C2=A0=C2=A0=C2=A0=C2=A0 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 printf("%s\n", string);
> =C2=A0=C2=A0=C2=A0=C2=A0 9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 exit(0);
> =C2=A0=C2=A0=C2=A0 10=C2=A0 }
> =C2=A0=C2=A0=C2=A0 11
> =C2=A0=C2=A0=C2=A0 12=C2=A0 char *fetch(){
> =C2=A0=C2=A0=C2=A0 13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 char string[10];
> =C2=A0=C2=A0=C2=A0 14 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 scanf("%s", string);
> =C2=A0=C2=A0=C2=A0 15 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return string;
> =C2=A0=C2=A0=C2=A0 16=C2=A0 }
>
> When the application is executed, after input "a", it will produce
> unknown characters, like "8=C5=A0=C3=A8=C2=BF=C3=B4=C3=BFO". Which is=
 like what I expect
>
> However, if I change line 13 to:
> =C2=A0=C2=A0=C2=A0 13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 char string[1024];
>
> When I type "a", it echos "a", which is out of my expectation
>
> Why does it behave like this?
>
> Thanks in advance,
> longapple

The data for string[] is being destroyed by the call to printf (first
thing you call after fetch). On your particular system making it 1024
puts it out of reach of printf's call frame. your stack is probably
growing downwards, so the call frame of printf is ending up near the
end of what string[] used to be. If you fill your string[] with memset
of 'a' and leave not null terminated, you can easily see the point
where your data ends and the next function starts to clobber you.

--=20
Jon Mayo
<jon.mayo@gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
