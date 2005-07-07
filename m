From: Luiz Fernando Capitulino <lcapitulino@conectiva.com.br>
Subject: Re: process information
Date: Thu, 07 Jul 2005 09:09:54 -0300
Message-ID: <42CD1B92.1070806@conectiva.com.br>
References: <a3c4234105070613154993e652@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <a3c4234105070613154993e652@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Mat=EDas_Aguirre?= <matiasaguirre@gmail.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>

Hi Mat=EDas,

Mat=EDas Aguirre wrote:
> a little question, is there any way to get a process current children=
 count?

 Yes, there is. But I can only think in a 'brute force' way: you can sc=
an the
/proc file-system.

 Let's say you want to know how many children the X process has. You op=
en
each '/proc/PID/status' and read the 'Ppid' field. If it's equals X, yo=
u
count it.

 As I said, it's ugly, but I cannot think in another solution.

 You can try to read the code of 'pstree' program, but I guess it
scans the /proc file-system too.

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
