From: Tomas Janousek <tomi@nomi.cz>
Subject: Re: Significance of using + before function calls.
Date: Wed, 15 Mar 2006 21:34:03 +0100
Message-ID: <dv9tnr$oee$1@sea.gmane.org>
References: <44180FBC.50703@wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <44180FBC.50703@wipro.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello,

Vamsi napsal(a):
> Can somebody clarify wht does that + signify??

It suppresses the warning about ignored returned value returned by=20
splint, for example.

--=20
=2E---------    Tom=E1=9A Janou=9Aek   a.k.a. Liskni_si    ---------.
: NOMI team, developer, http://tomi.nomi.cz/   tomi@nomi.cz :
' JID:liskni_si@jabber.cz, ICQ#161807083, tel:+420608876277 '

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
