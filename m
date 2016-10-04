From: Raphael Prudencio <rsprudencio@gmail.com>
Subject: Re: How to disable application run
Date: Tue, 4 Oct 2016 14:26:08 +0200
Message-ID: <FDE492F6-2FF9-497B-A4A9-5A13965F76F1@gmail.com>
References: <88e789ba-91be-e2ac-3bf4-f771052be870@interia.pl> <CAMraO6879JeigufNChzYwrY5faMEjD8ExNJDAnA1L-WM_NwkQg@mail.gmail.com> <CAMraO6_rYr5ArwSw6M22vmQXe-jCfiqRRn8_EGSgXMYnTYMYkw@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=omDkQfTO3q0KVdiPa8oYImuBTaaYCi651rf8kho4KhM=;
        b=WpkqIsZNDCRZPvjx9O9kYSAFx58EMWVgyYfVMTK62KwQB0RB/lg5eljb5a5e6O8NVZ
         hU3++7+wcnnMCAKtATlCbmxlfaF4Dyjf4pA9nLHd2vPbtiO8OEp4SL3PaGeBR5EnBZRD
         VVDMMV3PEogSBrKTG5K/qLDYbhz1Z0Iksk0M2I69s+Iw+R9dp67QFtCQV1LU+NKegiDu
         WLcMtsGf0gSiFlvOYn3bOndx4xrfGm+rrT5n2iNHJkGY7DJCuu6eEeliQu98j8h5t3l5
         2DvBA8hMpyHGp325mYFP8pTKgP3CdruBt2Ln+91A/kdVKb76rKbWQcbe0kqkUcWF98+i
         brPw==
In-Reply-To: <CAMraO6_rYr5ArwSw6M22vmQXe-jCfiqRRn8_EGSgXMYnTYMYkw@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ilya Guterman <iliyagutermann@gmail.com>
Cc: =?utf-8?Q?Marcin_G=C5=82ogowski?= <marcin.glogowski@interia.pl>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Have you tried selinux?

Sent from my iPhone

> On 4 Oct 2016, at 13:33, Ilya Guterman <iliyagutermann@gmail.com> wrote:
>=20
> Hey CiN,
>=20
> You can write LKM which overrides the execve syscall and checks
> wherever the filename is blacklisted, but overriding syscall is
> considered bad.
> Maybe there is a better solution I am not aware of.
>=20
> Regards amfern.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programm=
ing" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
