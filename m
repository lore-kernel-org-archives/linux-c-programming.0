From: vinit dhatrak <vinit.dhatrak@gmail.com>
Subject: Re: getch() in linux
Date: Sat, 24 Oct 2009 17:49:55 +0530
Message-ID: <edf0f34e0910240519m788d1350qdbfc2bf8174f243a@mail.gmail.com>
References: <9b0a5b990910240207x766817c5t45b87c84349873e9@mail.gmail.com>
	 <9b0a5b990910240234k35e91ba8kf1fd0917bf68d21d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Ral5c5+Gu7gdr95H2QSNsXp+NhQRu+up8ePj9bIjE7Q=;
        b=Gdm4reHWx+FMImotDrnYFaXuFKeQ96jIo+f+LpIAwQ/XU4JsH9OOUFlS0i4v2zStoU
         YsyYC3VYeA9c6zsvcOpbPXaPqFvQRxpDKJqL5w4LW8a+Z9XGrUi8KG97D89voA/lINxf
         hfc+UEhzpW3OalD776xLSrzoFQTRGEAcKR3FE=
In-Reply-To: <9b0a5b990910240234k35e91ba8kf1fd0917bf68d21d@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Siddu <siddu.sjce@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Sat, Oct 24, 2009 at 3:04 PM, Siddu <siddu.sjce@gmail.com> wrote:
> Hi all,
>
> Please help me understand whats the use of getch() in linux
>
> the man page says this ! but couldnt comprehend much out of it
>
> =C2=A0The getch, wgetch, mvgetch and mvwgetch, routines read a charac=
ter
> from the window.=C2=A0 In no-delay mode, if no input is waiting,
> =C2=A0the value ERR is returned.=C2=A0 In delay mode, the program wai=
ts until
> the system passes text through to the=C2=A0 program.=C2=A0=C2=A0 Depe=
nding
> =C2=A0on=C2=A0 the setting of cbreak, this is after one character (cb=
reak mode),
> or after the first newline (nocbreak mode).=C2=A0 In half-de=E2=80=90
> =C2=A0lay mode, the program waits until a character is typed or the
> specified timeout has been reached.
>
> what is delay mode they are talking about?
>
> and can some one give me a simple example for it ?
>
> do i ave to know abt ncurses to understand it ?
>
>
> --
> Regards,
> ~Sid~
> I have never met a man so ignorant that i couldn't learn something fr=
om him
>
>
>
>
> --
> Regards,
> ~Sid~
> I have never met a man so ignorant that i couldn't learn something fr=
om him
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>

Yes, you have to know about ncurses to understand this function.
Have a look at this,

http://tldp.org/HOWTO/NCURSES-Programming-HOWTO/index.html

Also, check man pages for halfdelay or timeout.
A simple "Hello World" program will give you some idea.

-Vinit
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
