From: Christian Stalp <stalp@imbei.uni-mainz.de>
Subject: feof fails
Date: Wed, 15 Sep 2004 11:39:48 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <B0003441729@hermes.imsd.uni-mainz.de>
Reply-To: stalp@imbei.uni-mainz.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hello together,
I have a simple problem. I opened a file with fopen and read from the f=
ile=20
with:
  while ( !feof( infile ) )
 {
   fgets( buffer, BUFFER_SIZE, infile );
   new_number =3D atoi ( buffer );
=2E....

The file is filled withe a stack of numbers, 7 charakters and each is=20
terminated by an '\n'.=20

My problem now is, that the last number is been read twice. What is the=
=20
problem?

Gruss Christian


--=20
Christian Stalp

Institut f=FCr Medizinische Biometrie, Epidemiologie und Informatik (IM=
BEI)
Obere Zahlbacher Stra=DFe 69
55131 Mainz
Tel.: 06131/ 17-6852

E-Mail: stalp@imbei.uni-mainz.de
Internet: www.imbei.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
