From: yuyichao-mit <yuyichao@mit.edu>
Subject: Re: extra slash in current path
Date: Thu, 23 Jun 2011 10:53:17 -0400
Message-ID: <BANLkTi=ZS8itWV+jHn2XxZ--P8cU3jFQQg@mail.gmail.com>
References: <BANLkTi=y1roManmZGMLBXSFbBVqK_KqDZg@mail.gmail.com>
 <20110623153116.404f2a63.taeuber@bbaw.de> <BANLkTinOb-4Xm_W2fmzivk6jBJwjeHYKVA@mail.gmail.com>
 <BANLkTimXH8K91cZ69oPRu=wbYt9JgBadfA@mail.gmail.com> <BANLkTin9bQ4hzs-odYU-Gxy-f-T+HLLAdQ@mail.gmail.com>
 <4E034E2A.1010100@msgid.tls.msk.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:from
         :date:x-google-sender-auth:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=FUod98irGKkLir+LqiCacKTT25DO6t/Jdcr0wnT+2PU=;
        b=UPJ3ZF63uMOookNUivFxtcFBdnMLlDJVtJgzuBtjw7QiV6SjmBE5uV6u2P0drzQiB1
         R9NoTZPMKUItY53uKbZfp4drwjDG+129r7X0w3VYPIcAY3RBsgXLKubusL+yIgRf94sJ
         jTyjqAbrpC3d51zbLH4c+vhUB6CgwfpBQwDmU=
In-Reply-To: <4E034E2A.1010100@msgid.tls.msk.ru>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: richard -rw- weinberger <richard.weinberger@gmail.com>, =?ISO-8859-1?Q?Lars_T=E4uber?= <taeuber@bbaw.de>, linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

On Thu, Jun 23, 2011 at 10:31 AM, Michael Tokarev <mjt@tls.msk.ru> wrot=
e:
> 23.06.2011 18:11, yuyichao-mit wrote:
>
>>>>> $ cd //
>>>>> $ pwd
>>>>> //
>
> The current directory is cached in $PWD environment
> variable by shell (bash at least). =A0This variable is
> checked in glibc (getcwd() et al) - if it is set and
> stat($PWD) is the same as stat("."), that value is used.
>
> It has nothing to do with kernel, probably the issue
> is in bash which somehow allows double slash for root
> dir (but not triple).

u r right. chdir in c and cd in csh doesn't have this problem.

it is bash stuff.

>
> /mjt
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
