From: Yichao Yu <yyc1992@gmail.com>
Subject: Re: header files missing
Date: Wed, 14 Dec 2011 10:15:06 -0500
Message-ID: <CAMvDr+R-hePHJcL43rVkNmPdYyXui4tXKv8fHNWmR-CLk8DAqg@mail.gmail.com>
References: <CAGZFCEGxdS6Wbye+jy_HCpv-OquSNX6gKFLh3xDK-Fwfn1T3ag@mail.gmail.com>
 <4EE610E8.7010001@maxim-ic.com> <CAGZFCEFiYf88nhEeYUGmHOJ5TXXgC3F5WOC6xx2CsofE5GEL9Q@mail.gmail.com>
 <CACL2Z18JF+uke02_+SNpGB71UR2=jruMf=8X3oCK-6W7E9Qk0g@mail.gmail.com>
 <75E4E6EA13D477499AE4AE34E8AF042005AD4ECA9D@EXCMB2.wolfsonmicro.main>
 <20200.41533.67427.527798@cerise.gclements.plus.com> <CAOXuEswg7XOyK+QWg+BULr70O2C=spu2eieT+u6tdRbK5=TMvA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=hKclSsWH7uQyWmHO2fq411A2MmDOzwKeSJWX9wGqfm8=;
        b=wmSQZNmNRxFolKALP8ncCG3JTwcmfhGQrzJnMgG7nr5BT2YHWkehcDokdXRuykGCJC
         JpWXXgD0FQFke5TiRF2FCk5unQ9pGbFn+aYZoxIDY9eQCZeD+ot5EbQBq7Hv+ysG0U+t
         4d4AjkKzM8/dXzwEn8/XoeYmZjt05ClgrsVik=
In-Reply-To: <CAOXuEswg7XOyK+QWg+BULr70O2C=spu2eieT+u6tdRbK5=TMvA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Aniruddha Bhattacharyya <aniruddha.aot@gmail.com>
Cc: Glynn Clements <glynn@gclements.plus.com>, linux-c-programming@vger.kernel.org

On Wed, Dec 14, 2011 at 9:14 AM, Aniruddha Bhattacharyya
<aniruddha.aot@gmail.com> wrote:
> Some might use dlopen() and dlsym() in case of runtime library

I suppose the "runtime" here just means shared libraries that is
loaded by dynamic linker (not sth like plugins) instead of those
headers which are not necessary at "runtime". So dlopen() and dlsym()
are not necessary (and probably not possible for glibc).

>
> On Wed, Dec 14, 2011 at 6:48 PM, Glynn Clements
> <glynn@gclements.plus.com> wrote:
>>
>>
>> Renjith Gopinadhan wrote:
>>
>> > Surely, he has glibc installed, but the issue is that anything to =
do
>> > with the PATH variable or anyother environment variable settings?
>>
>> Most distros split libraries into runtime and development packages.
>> Shared libraries are in the runtime package, headers are in the
>> development package.
>>
>> He'll certainly have the runtime package for glibc, but he won't
>> necessarily have the development package.
>>
>> --
>> Glynn Clements <glynn@gclements.plus.com>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-c-pr=
ogramming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
