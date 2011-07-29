From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: Re: c++ code - not getting compiled !!!!!!!!!
Date: Fri, 29 Jul 2011 12:25:39 +0530
Message-ID: <CAGZFCEF=Xuf6kBMe=iGVvW4uf8Bd63gKjCQa-VkKbPihhj0cRg@mail.gmail.com>
References: <CAGZFCEFvwrbscViED2ZEC3Yh9p4EstTLkxxfQD8FJZS03OpsLw@mail.gmail.com>
	<CALC0UTm2XrznifP=m63sibg931vmzrQP+8FVzvxYgqvTNrG7sA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=ahynEy+lXTaRgFA5xZf/3KBrFn4lmSLsjdtbsoE/AA4=;
        b=LNLXPHnjhZqQbvA/ENvgEZx0dVm5qOrDxZXK0u/Z3ce9WnDbZVWMIAYfp55RJbJFDN
         Bkrsk70Nv/qdb3jJSmYMBsHfj1NDT4pVg1vChUNGwe9xJMETf/jzp88LR/mbI6U62/cQ
         PQy2eKSPy7AXWLP5YCCknEofur7JZ7FtjXG+M=
In-Reply-To: <CALC0UTm2XrznifP=m63sibg931vmzrQP+8FVzvxYgqvTNrG7sA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?ISO-2022-JP?B?U3RldmUgR3JhZWdlcnQgKBskQiU5JUYlIyE8JVYbKEIp?= <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Thanks steve.

This code snippet works fine  in newer version of g++. Am i right ?. i
am not sure abt the version of g++.

-Ratheesh

2011/7/29 Steve Graegert (=E3=82=B9=E3=83=86=E3=82=A3=E3=83=BC=E3=83=96=
) <graegerts@gmail.com>:
> According to the C++ standard (6.7) you are allowed to jump past a de=
claration:
>
> "It is possible to transfer into a block, but not in a way that
> bypasses declarations with initialization. A program that jumps from =
a
> point where a local variable with automatic storage duration is not i=
n
> scope to a point where it is in scope is ill-formed unless the
> variable has POD type and is declared without an initializer."
>
> =C2=A0 =C2=A0\Steve
>
> --
>
> Steve Graegert (=E3=82=B9=E3=83=86=E3=82=A3=E3=83=BC=E3=83=96)
> Mobile: +49 151 25335249
> http://graegert.tel
>
>
>
> On Fri, Jul 29, 2011 at 08:01, ratheesh kannoth <ratheesh.ksz@gmail.c=
om> wrote:
>> #include <iostream>
>>
>> using namespace std;
>>
>> int main()
>> {
>> =C2=A0 =C2=A0int i;
>>
>> =C2=A0 =C2=A0cout << "Enter value of i " << endl;
>> =C2=A0 =C2=A0cin >> i;
>>
>> =C2=A0 =C2=A0if (i < 5)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0goto Sri;
>>
>> =C2=A0 =C2=A0int j =3D 6;
>> =C2=A0 =C2=A0cout << "j =3D " << j << endl;
>>
>> =C2=A0 =C2=A0cout << "Outside Sri" << endl;
>> =C2=A0 =C2=A0return 0;
>>
>> Sri:
>> =C2=A0 =C2=A0cout << "Inside Sri" << endl;
>> =C2=A0 =C2=A0return 0;
>> }
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-c-pr=
ogramming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
