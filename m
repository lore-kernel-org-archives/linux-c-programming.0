From: Kurt Wall <kwall@kurtwerks.com>
Subject: Re: Signal on Ctrl-C
Date: Tue, 7 May 2002 21:43:03 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020507214303.H15207@marta>
References: <02050222174801.01065@localhost.localdomain> <3CD1B00C.71CB2F38@fi.uba.ar> <3CD83493.F2C50ADC@fi.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3CD83493.F2C50ADC@fi.uba.ar>; from dmarian@fi.uba.ar on Tue, May 07, 2002 at 05:09:55PM -0300
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Scribbling feverishly on May 07, Dar=EDo Mariani managed to emit:
> Hello:
>   Wich is the UNIX signal emited when you press Ctrl-C on a console
> application?
>   Thanks for your help,

SIGINT.

$ man 7 signal

reveals all. See also

$ kill -l

Kurt
--=20
When does summertime come to Minnesota, you ask?  Well, last year, I
think it was a Tuesday.
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
