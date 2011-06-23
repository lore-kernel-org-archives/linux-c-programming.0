From: yuyichao-mit <yuyichao@mit.edu>
Subject: Re: extra slash in current path
Date: Thu, 23 Jun 2011 10:11:04 -0400
Message-ID: <BANLkTin9bQ4hzs-odYU-Gxy-f-T+HLLAdQ@mail.gmail.com>
References: <BANLkTi=y1roManmZGMLBXSFbBVqK_KqDZg@mail.gmail.com>
 <20110623153116.404f2a63.taeuber@bbaw.de> <BANLkTinOb-4Xm_W2fmzivk6jBJwjeHYKVA@mail.gmail.com>
 <BANLkTimXH8K91cZ69oPRu=wbYt9JgBadfA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:from
         :date:x-google-sender-auth:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=l+Sx5S5sSaXI5Z9hF8PKczsTDww8GF/vzsmhmzTnw9Q=;
        b=MPBwYyS1AqZvyJTdFnu6glLKXDWbv5P24qWT9VEObPc9SZmRdXTlJ2u9P9MQVlLVu9
         PnZCOLscKRL54G5GjzzW5gn8SzhsoOhPelFeA6ECpDzH62RGIia4Heo7uBblZ8JRPtuM
         g/ZH6N/Hqr2Nc5+wDjly6cf/U5P0zGxyxsJII=
In-Reply-To: <BANLkTimXH8K91cZ69oPRu=wbYt9JgBadfA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Cc: =?ISO-8859-1?Q?Lars_T=E4uber?= <taeuber@bbaw.de>, linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

On Thu, Jun 23, 2011 at 9:54 AM, richard -rw- weinberger
<richard.weinberger@gmail.com> wrote:
> On Thu, Jun 23, 2011 at 3:32 PM, yuyichao-mit <yuyichao@mit.edu> wrot=
e:
>> On Thu, Jun 23, 2011 at 9:31 AM, Lars T=E4uber <taeuber@bbaw.de> wro=
te:
>>> Hi,
>>>
>>> Am Thu, 23 Jun 2011 09:14:18 -0400
>>> yuyichao-mit <yuyichao@mit.edu> schrieb:
>>>> The problem is like this:
>>>>
>>>> $ cd /
>>>> $ pwd
>>>> /
>>>>
>>>> $ cd /
>>>> $ pwd
>>>> //
>>>
>>> didn't you mean?:
>>> $ cd //
>>> $ pwd
>>> //
>>
>> yes, exactly.
>>
>> Sorry for the typo (copy-paste~~~)
>>
>
> Is this really a kernel issue?
> rw@raccoon:~> cd //
> rw@raccoon://> pwd
> //
> rw@raccoon://> ls -l /proc/self/cwd
> lrwxrwxrwx 1 rw users 0 23. Jun 15:53 /proc/self/cwd -> /

well, that's true, but this is indeed the retrun value of get_current_d=
ir_name.

#include <unistd.h>
#include <stdio.h>

int main()
{
        char *cwd =3D get_current_dir_name();
        printf("%s\n", cwd);
        return 0;
}

$ cd //
$ pwd
//
$ main
//

so is this a glibc stuff??
(that's y I also send to linux-c-programming.)

>
> --
> Thanks,
> //richard
>
