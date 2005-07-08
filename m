From: Luiz Fernando Capitulino <lcapitulino@conectiva.com.br>
Subject: Re: process information
Date: Fri, 08 Jul 2005 16:48:42 -0300
Message-ID: <42CED89A.2070906@conectiva.com.br>
References: <a3c4234105070613154993e652@mail.gmail.com>	 <42CD1B92.1070806@conectiva.com.br> <a3c4234105070709267129a646@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <a3c4234105070709267129a646@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Mat=EDas_Aguirre?= <matiasaguirre@gmail.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>

Mat=EDas,

Mat=EDas Aguirre wrote:

[...]

> So, i'm traying to make a little trick, a first process that create
> the shmem and makes a fork, this new son lunch the server, but now I
> need to know when the server dies so my process can finish and
> deallocate the shmem.

I guess I didn't get the problem here, can't you use SIGCHLD?

> Sorry, but my english is very bad... :)

I did understand you just perfectly, your english isn't worst
than mine.


-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
