From: David Lee <live4thee@gmail.com>
Subject: Re: Help on pipe
Date: Sat, 11 Jul 2009 11:41:41 +0800
Message-ID: <8f62e1cd0907102041y454ac0dnfe98a25467964634@mail.gmail.com>
References: <34e1241d0907092322h5aea016cj437168a43ebfe50e@mail.gmail.com>
	 <op.uwubc1lg7p4s8u@amdc030.digital.local>
	 <19031.32022.804076.200185@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=r9aeK38peW1UpYaf8L4eqvH2CAkxaO+XusquA9EXopk=;
        b=a5cpTn2l/RFStLhiLZaIK7F2eNoIHCAHVvQEx2zbxBJ7re8BS3wCz8Tet5zQ/wpFve
         icD/gQXn+0STKJp5v5rV2itTLTanc2+didJCO3uE/8f8AWv86PM4f0gbt9An8lzVBL6e
         MdmmMzwBTnDXF0zNtlnphhaBnt6Qo88UgO6Pw=
In-Reply-To: <19031.32022.804076.200185@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: =?ISO-8859-2?Q?Micha=B3_Nazarewicz?= <m.nazarewicz@samsung.com>, Ardhan Madras <nightdecoder@gmail.com>, linux-c-programming@vger.kernel.org

2009/7/11 Glynn Clements <glynn@gclements.plus.com>:
>
> Micha=B3 Nazarewicz wrote:
>
>> > =A0 =A0 waitpid(pid, &ret, 0);
>> > =A0 =A0 close(fds[1]);
>>
>> No need to close.
>
> There definitely is a need to close, but it should be fclose(stream)
> *before* the waitpid(). As David points out, sort won't terminate
> until it has finished reading its input.
>
> David Lee wrote:
>
>> The sort program is waiting for an EOF (^D).
>
> Ctrl-D isn't EOF unless you're reading from a terminal. The TTY drive=
r
> "sends EOF" (i.e. causes read() to return a zero count) when you pres=
s
> Ctrl-D (by default) if the driver is in canonical mode. Ctrl-D doesn'=
t
> have any significance in other contexts.
>
Definitely!  Thanks for pointing out. :-)
And BTW, `strace' is a handy tool for diagnosing this kind of problems.

> --
> Glynn Clements <glynn@gclements.plus.com>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

--=20
Thanks,
Li Qun
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
