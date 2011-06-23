From: yuyichao-mit <yuyichao@mit.edu>
Subject: Re: extra slash in current path
Date: Thu, 23 Jun 2011 09:26:55 -0400
Message-ID: <BANLkTik_8mfGgsBq2Lb-R+gBeUy6sLhvHQ@mail.gmail.com>
References: <BANLkTi=y1roManmZGMLBXSFbBVqK_KqDZg@mail.gmail.com>
 <BANLkTinaPJM3LhEVwFxtEGKuVXOyVOzrzg@mail.gmail.com> <BANLkTik3iMqZJiEY1+DYS2T9=+q2x2=5pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:from
         :date:x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=zjbGct3vlC19bJHMurxV4aowl6vONNujXuozxv0JxJg=;
        b=ntprpDpMAa8TDZrJQiHXW5QlKDyXBldyYLVXDJzx7gENr+lNYO+g5llB2aNIhKFIjz
         iJ1U56IgQXN8XcHNHQAr8nyI0oTdQLi5UUMqJgGaJGMq1cH+Bvi3kjI3qn++mjGXThZi
         d5iIwmOL9CnqbeNXYvkw3wFC6CdLSdfJyf1D4=
In-Reply-To: <BANLkTik3iMqZJiEY1+DYS2T9=+q2x2=5pQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org, linux-kernel@vger.kernel.org

Well, actually, I mean why is // so special if more than two slash at
the beginning of absolute path become only one slash?

Yichao Yu

On Thu, Jun 23, 2011 at 9:17 AM, Alessandro Suardi
<alessandro.suardi@gmail.com> wrote:
> On Thu, Jun 23, 2011 at 3:14 PM, yuyichao-mit <yuyichao@mit.edu> wrot=
e:
>> The problem is like this:
>>
>> $ cd /
>> $ pwd
>> /
>>
>> $ cd /
>> $ pwd
>> //
>>
>> $ cd ///
>> $ pwd
>> /
>>
>> Why can there be a extra slash (and exactly one) in current path? Is
>> this designed on purpose?
>> This is not really a big deal but I think it can confuse some progra=
m.
>
> Multiple consecutive slashes should not confuse any program.
>
> http://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap03.ht=
ml#tag_03_266
>
> --alessandro
>
> =A0"There's always a siren singing you to shipwreck"
>
> =A0=A0 (Radiohead, "There There")
>
