From: Richard Sammet <richard.sammet@sit.fraunhofer.de>
Subject: how to find the end of piped data?
Date: Mon, 13 Sep 2004 13:36:35 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <41458643.7060907@sit.fraunhofer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

hey list,

i wrote a small tool which gets data over a pipe from other tools (like=
:=20
cat stuff | mytool).

how can i find the end of this data stream?

at the moment im looking for a newline to see if the input is finished,=
=20
but thats not practicable.

this is the rutine for getting the data:

      75 void scanin()
      76 {
      77    int tmpcnt=3D0;
      78
      79    while(sizeof(tmpkey) && tmpkey[tmpcnt-1] !=3D 10)
      80    {
      81       tmpkey[tmpcnt]=3Dgetchar();
      82       tmpcnt++;
      83    }
      84 }

im looking for a flag like EOF but EndOfStream or something like this? =
;)

anybody any idea?

e-axe

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
