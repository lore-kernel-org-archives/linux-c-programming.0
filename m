From: Richard Sammet <richard.sammet@sit.fraunhofer.de>
Subject: Re: how to find the end of piped data?
Date: Tue, 14 Sep 2004 10:45:38 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4146AFB2.7050900@sit.fraunhofer.de>
References: <41458643.7060907@sit.fraunhofer.de> <200409140106.08674.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200409140106.08674.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: eric@cisu.net
Cc: linux-c-programming@vger.kernel.org

k, thx, it works fine...

e-axe

Eric Bambach wrote:
> Yea, heres a small program I wrote that works exactly the same way. W=
Ith piped=20
> data. It just scans STDIN to match to a pattern in the input stream. =
If it=20
> finds it, it pipes to /dev/null, if not, it pipes to stdout. Notice t=
he=20
> read()/write() combo with a buffer. This is MUCH faster than getchar(=
)=20
> method. Hope it helps.
>=20
> int read_message(char *buffer){
>   int len;
>   len =3D read(STDIN_FILENO,buffer,BUFFERSIZE-1);
>   if (len < 0){
>     perror("Read Error");
>     exit(EXIT_NOMATCH);
>   }
>   return len;

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=46raunhofer-Institut f=FCr Sichere Informations-Technologie (SIT)

Richard Sammet
Tel.: +49 6151 869 60027
Email: richard.sammet@sit.fraunhofer.de

main(){int
y=3D0,x;while(y!=3D6){x=3D(y=3D=3D0)?101:((y=3D=3D1)?45:((y=3D=3D2)?97:=
((y=3D=3D3)?120:((y=3D=3D4)?101:10))));putchar(x);y++;}}
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
