From: Tony Clarke <tony.clarke@palamon.ie>
Subject: Re: Port 786 (Concert??)
Date: Tue, 26 Aug 2003 16:53:04 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F4B8260.5070502@palamon.ie>
References: <Pine.LNX.4.44.0212161043290.4841-100000@ns.isi.ulatina.ac.cr> <3C482174.6040302@singmail.com> <3F4B7F33.3050905@fi.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F4B7F33.3050905@fi.uba.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Cc: linux-c-programming@vger.kernel.org

Dar=EDo Mariani wrote:

> Hello:
>   I found on one of my server the TCP socket 786 open. After googling=
=20
> half an hour I only found that it is used by a service called concert=
,=20
> but nothing else. So two question:
>
> 1) What is this service?
> 2) Is there a way to know which process is using it?
>
As root run or a user with sufficent privileges

run "netstat -tanp"

the p option lists the process



***********************************************************************=
*******
The information in this e-mail is confidential and may be legally privi=
leged.
It is intended solely for the addressee.  Access to this e-mail by anyo=
ne else
is unauthorised.  If you are not the intended recipient, any disclosure=
,
copying, distribution, or any action taken or omitted to be taken in re=
liance
on it, is prohibited and may be unlawful.
Please note that emails to, from and within RT=C9 may be subject to the=
 Freedom
of Information Act 1997 and may be liable to disclosure.
***********************************************************************=
*******
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
