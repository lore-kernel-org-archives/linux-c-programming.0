From: richard -rw- weinberger <richard.weinberger@gmail.com>
Subject: Re: extra slash in current path
Date: Thu, 23 Jun 2011 16:25:06 +0200
Message-ID: <BANLkTinci016e1U67ubn=bq3=Zsi3q99Aw@mail.gmail.com>
References: <BANLkTi=y1roManmZGMLBXSFbBVqK_KqDZg@mail.gmail.com>
	<20110623153116.404f2a63.taeuber@bbaw.de>
	<BANLkTinOb-4Xm_W2fmzivk6jBJwjeHYKVA@mail.gmail.com>
	<BANLkTimXH8K91cZ69oPRu=wbYt9JgBadfA@mail.gmail.com>
	<BANLkTin9bQ4hzs-odYU-Gxy-f-T+HLLAdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=e9lvjJpOYW0qM6SeHJgKvSQYae99kbDNTaZhYwVFIn8=;
        b=bmwdngwGxU1CrgbA+o5to2glelk9O/a3EBP7ZsmV+KJU6p1tj3KKhzc/YDZtTVfJdS
         0PjGwnj8ddhcsvsuf+/Drk/Y3CPWAmB7TVhVeqHvqwYRt2rrc2clPGq622MdUOtnz6xZ
         nB4IRS4kBDzetts/BZmr1d69nQL4EOL5X8Gkw=
In-Reply-To: <BANLkTin9bQ4hzs-odYU-Gxy-f-T+HLLAdQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: yuyichao-mit <yuyichao@mit.edu>
Cc: =?ISO-8859-1?Q?Lars_T=E4uber?= <taeuber@bbaw.de>, linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

On Thu, Jun 23, 2011 at 4:11 PM, yuyichao-mit <yuyichao@mit.edu> wrote:
> On Thu, Jun 23, 2011 at 9:54 AM, richard -rw- weinberger
> <richard.weinberger@gmail.com> wrote:
>> On Thu, Jun 23, 2011 at 3:32 PM, yuyichao-mit <yuyichao@mit.edu> wro=
te:
>>> On Thu, Jun 23, 2011 at 9:31 AM, Lars T=E4uber <taeuber@bbaw.de> wr=
ote:
>>>> Hi,
>>>>
>>>> Am Thu, 23 Jun 2011 09:14:18 -0400
>>>> yuyichao-mit <yuyichao@mit.edu> schrieb:
>>>>> The problem is like this:
>>>>>
>>>>> $ cd /
>>>>> $ pwd
>>>>> /
>>>>>
>>>>> $ cd /
>>>>> $ pwd
>>>>> //
>>>>
>>>> didn't you mean?:
>>>> $ cd //
>>>> $ pwd
>>>> //
>>>
>>> yes, exactly.
>>>
>>> Sorry for the typo (copy-paste~~~)
>>>
>>
>> Is this really a kernel issue?
>> rw@raccoon:~> cd //
>> rw@raccoon://> pwd
>> //
>> rw@raccoon://> ls -l /proc/self/cwd
>> lrwxrwxrwx 1 rw users 0 23. Jun 15:53 /proc/self/cwd -> /
>
> well, that's true, but this is indeed the retrun value of get_current=
_dir_name.
>
> #include <unistd.h>
> #include <stdio.h>
>
> int main()
> {
> =A0 =A0 =A0 =A0char *cwd =3D get_current_dir_name();
> =A0 =A0 =A0 =A0printf("%s\n", cwd);
> =A0 =A0 =A0 =A0return 0;
> }
>
> $ cd //
> $ pwd
> //
> $ main
> //
>
> so is this a glibc stuff??

I guess glibc does some caching.

> (that's y I also send to linux-c-programming.)

Ah, ok.

--=20
Thanks,
//richard
