From: "Daniel" <uval@rz.uni-karlsruhe.de>
Subject: Re: Check serial port buffer
Date: Fri, 10 May 2002 11:07:37 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <002a01c1f802$21939e30$544615ac@stud.unikarlsruhe.de>
References: <3CC9462B.9050401@xnet.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


----- Original Message -----
From: "Iorga Alin" <aiorga@xnet.ro>
Newsgroups: ka.lists.linux.c.programming
Sent: Friday, April 26, 2002 2:17 PM
Subject: Check serial port buffer


> Can anyoune tell me how can I check the first byte of the serial port
> buffer without removing it from the buffer?
>
> thank you
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --------------------------------------------------------------------------
-----
>    Achtung: diese Newsgruppe ist eine unidirektional gegatete
Mailingliste.
>      Antworten nur per Mail an die im Reply-To-Header angegebene Adresse.
>                    Fragen zum Gateway -> newsmaster@inka.de.
> --------------------------------------------------------------------------
----

doesn't ungetch() work ?

