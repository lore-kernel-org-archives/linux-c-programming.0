From: Fekete Gabor <feketga@delfin.unideb.hu>
Subject: RE: using the same port with two sockets
Date: Fri, 26 Sep 2003 17:28:04 +0200 (DFT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.A41.4.20.0309261726590.21426-100000@delfin.unideb.hu>
References: <001d01c383f2$3571ca80$bac7f082@campus.luth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <001d01c383f2$3571ca80$bac7f082@campus.luth.se>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: 
Cc: 'linux-c-programming' <linux-c-programming@vger.kernel.org>



On Fri, 26 Sep 2003, [iso-8859-1] Patrik J=F6nsson wrote:

> One possible way should be to have a master process wich recieves the=
 data,
> looks the source IP:port pair up in a table and starts a new process =
if it
> is not found, and otherwise uses some IPC (like pipes) mean to forwar=
d it to
> the right process, the processes could then use another pipe to send =
replies
> to the other host.
>=20
yeah, and that's what i will do, though not with pipes.
thanks


-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
