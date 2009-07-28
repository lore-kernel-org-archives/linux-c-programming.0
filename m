From: =?ISO-8859-2?Q?Mirski_Pawe=B3?= <mirskip87@gmail.com>
Subject: Re: Problem with infinite loop in signal handler
Date: Tue, 28 Jul 2009 08:45:42 +0200
Message-ID: <62c21b850907272345s34829764m41763d41e54c65a@mail.gmail.com>
References: <62c21b850907220942p60fd9362kcbd82158ce685dd8@mail.gmail.com>
	 <9b6278b80907221331m39d4adf0oc6cd8057d9cd6565@mail.gmail.com>
	 <62c21b850907242234r5ec8f6f9tc8ccb2e412306312@mail.gmail.com>
	 <20090726135838.GA5951@balu.adler.nest>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=ZZuEgv4xwf2lEBhjXLIVdqgkP6o8SGUr8RHOTep4hkI=;
        b=cOM4+EPgNZZnitsaANa2YhfvYnuogNqeOQz1S5ZCOK8OMasjsrUnlwMxDnAGhl4GaA
         tEpsUZgrxIisxJ3Z6ojnBAe7wKn69p/oO2BlFDc5J3EuhfjUKey9qaR80aGO7/kOiL75
         SxjzQJMnBsFKmqPZcRv97Cz4ex9zzLW7I9A+k=
In-Reply-To: <20090726135838.GA5951@balu.adler.nest>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hello,
Not exactly infinite loop but sigsuspend. Infinite loop was only
example to show the problem. Without printf in sig handler problem
also occures.
I am writing simple stop-the-world garbage collector so I need this
construction to stop (almost)all threads in application. I think only
solution for this problem is not using any stream that client
application may use.
Thanks for help anyway :)

W dniu 26 lipca 2009 15:58 u=BFytkownik Gunnar Larisch
<gunmuc@googlemail.com> napisa=B3:
> Hi Mirski,
>
> your signal handler function:
>
>> >> void suspend(int sig) {
>> >> =A0 =A0printf("suspending\n");
>> >> =A0 =A0fflush(stdout);
>> >> =A0 =A0while(1);
>> >> }
>
> Have you also tried your programm without calling printf and fflush i=
n the
> signal handler? Do you know the manpage signal (7) ? There is a list =
of
> Async-signal-safe functions.
>
> Can you tell me, why you need an endless loop in the signal
> handler?
>
> Regards,
> Gunnar
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
