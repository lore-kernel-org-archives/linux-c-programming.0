From: Alvarez Alberto-AALVARB1 <AALVARB1@motorola.com>
Subject: threaded program turns into "forked"
Date: Thu, 13 Mar 2003 17:14:45 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <75B979779CA1D311808400508B6F40FF073E2003@zes06exm01.madrid.ecid.cig.mot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hi all,
	a work mate has a program which creates up to 5 threads:

	( this is done at the "main" module)
		 for (i=3D0;i<numeroSM;i++)
		  {
		     rc=3Dthr_create(NULL,NULL,RecogerCDRs,(void *)i,NULL,&hilo);
		  }

		but, "sometimes" (horrible expression) a child turns up: new process =
(new pid), whose parent id and command is the former process.
		 AFAIK, thread creation can't "fork" a program.

		The only data i know is that the second process starts 1 second after=
 the first, which could easily occur while thread creation.=20
		Just in case it's important, we're working with a socket per thread.

		Does anyone know whether thread creation could be the reason?

		TIA

Alberto =C1lvarez Besada

Tlf.:        +34 914002155
e-mail.:   aalvarb1@motorola.com
           =20

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
