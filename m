From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Subject: Interprocess communication through stdin
Date: Wed, 21 May 2003 12:05:51 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3ECB95CF.3010508@fi.uba.ar>
References: <3EAD78F1.9050408@fi.uba.ar> <16045.46253.955065.525478@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; 
To: linux-c-programming@vger.kernel.org

Hello:
   I'm implementing  a program that spawns a child process. I was
wondering if instead of creating a pipe for interprocess communication
is there any way to send data to the child by its stdin. The problem is
that this child process is a program that accepts input from the stdin
and I do not want modify it or have a named pipe redirected to its stdi=
n.
   Thanks,
             Dar=EDo



-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
