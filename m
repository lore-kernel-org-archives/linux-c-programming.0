From: Gunnar Larisch <gunmuc@googlemail.com>
Subject: Re: Problem with infinite loop in signal handler
Date: Sun, 26 Jul 2009 15:58:38 +0200
Message-ID: <20090726135838.GA5951@balu.adler.nest>
References: <62c21b850907220942p60fd9362kcbd82158ce685dd8@mail.gmail.com>
 <9b6278b80907221331m39d4adf0oc6cd8057d9cd6565@mail.gmail.com>
 <62c21b850907242234r5ec8f6f9tc8ccb2e412306312@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=w3Ahw7dfIJFJlUBbp33eq4K4Cs1tg6Z3yKHQYlCv/7Q=;
        b=Ld8sy2F1oAYIZjxNG6d+tzePZaPLJUitB3/hN+ig5hRiQ8btalEhRKwXweRk8xz+TN
         mnkEzIGmnAT+zKMfb01XfihSNnQfUhe+nEyUuakAub4n61G3Qhrw0hMZpKoQ0KPZ5yeI
         d9Rrt8t7iJ0kWcc4GjIuVRr2eSEkVPlDzVkhU=
Content-Disposition: inline
In-Reply-To: <62c21b850907242234r5ec8f6f9tc8ccb2e412306312@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mirski =?utf-8?B?UGF3ZcWC?= <mirskip87@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi Mirski,

your signal handler function:

> >> void suspend(int sig) {
> >> =A0 =A0printf("suspending\n");
> >> =A0 =A0fflush(stdout);
> >> =A0 =A0while(1);
> >> }

Have you also tried your programm without calling printf and fflush in =
the
signal handler? Do you know the manpage signal (7) ? There is a list of
Async-signal-safe functions.

Can you tell me, why you need an endless loop in the signal
handler?

Regards,
Gunnar
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
