From: Aniruddha Bhattacharyya <aniruddha.aot@gmail.com>
Subject: Re: Errors with ->*
Date: Tue, 2 Aug 2011 22:25:27 +0530
Message-ID: <CAOXuEswGDy+td6XN9e-NDmuLNs1SYttRJgkMKFK=F+f4GCob0w@mail.gmail.com>
References: <4E382646.7060903@gmail.com> <CAOXuEszSgxzCLUjcadTdq+TnieQ69PxhnusrwuBgvju8jRVmjA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=nonl/fVBnpeZu/QCpzhTTveHQ34gVK7z9rihXCy/MqE=;
        b=LMhtL33iYhPvYtTx4tdquwB4IV2HAro47Y1l60dXasg03RNLfH9aOmUgjqxQgNOgiH
         WfbW+6FF8x/61daGuYFD2Saqyg5WdjfXbTM5KPh9Bg7OesOAwRLjscQOO/0E1fkDjdW0
         /I4uciMQQsjcNzI8i6niVql9FLQgOyUQUVvPU=
In-Reply-To: <CAOXuEszSgxzCLUjcadTdq+TnieQ69PxhnusrwuBgvju8jRVmjA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org

typo correction :
       (*aptr).xptr =3D 5;

On Tue, Aug 2, 2011 at 10:24 PM, Aniruddha Bhattacharyya
<aniruddha.aot@gmail.com> wrote:
> 1) a .* xptr =3D 3 ;
> =A0 Above line's syntax is wrong.
> =A0Should be
> =A0 =A0 =A0 =A0*a.xptr =3D 3;
>
> 2) Also declare the structure member variables as
> =A0 =A0 =A0 =A0 int *xptr, *yptr ; (otherwise yptr will be of type in=
t, not of int*)
>
>
> 3)=A0 aptr ->* xptr =3D 5 ;
> =A0 =A0 =A0is also of wrong syntax.
> =A0 =A0 =A0Should be
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *aptr->xptr =3D 5 ;
>
> Which is equivalent to
> =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0*(aptr->xptr) =3D 5;
>
>
>
> the above code DOES NOT mean this one :
>
> =A0 =A0 =A0 =A0 =A0 =A0 (*aptr)->xptr =A0 // this one dereference apt=
r first, then
> does nothing to xptr
>
>
>
> Thanks.
>
> On Tue, Aug 2, 2011 at 10:01 PM, Shriramana Sharma <samjnaa@gmail.com=
> wrote:
>>
>> Hello -- long time since I posted on this list.
>>
>> I'm trying to understand the use of ->* but in compiling the attache=
d program which I thought was straightforward I am getting the followin=
g errors:
>>
>> foo.cpp: In constructor =91mystruct::mystruct()=92:
>> foo.cpp:9:12: error: invalid conversion from =91int*=92 to =91int=92
>> foo.cpp: In function =91int main()=92:
>> foo.cpp:21:7: error: =91xptr=92 was not declared in this scope
>> foo.cpp:22:7: error: =91yptr=92 was not declared in this scope
>>
>> Please help.
>>
>> --
>> Shriramana Sharma
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
