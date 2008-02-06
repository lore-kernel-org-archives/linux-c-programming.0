From: "Christian Stalp" <christian.stalp@gmx.de>
Subject: RE: sprintf with mips
Date: Wed, 06 Feb 2008 20:58:01 +0100
Message-ID: <20080206195801.58270@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

>How is insertvalues defined?

char insertvalues[256];
memset (insertvalues, 0x0, 256 );

Gruss Christian

--=20
Psssst! Schon vom neuen GMX MultiMessenger geh=F6rt?
Der kann`s mit allen: http://www.gmx.net/de/go/multimessenger
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
