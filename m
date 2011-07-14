From: Randi Botse <nightdecoder@gmail.com>
Subject: Fwd: Problem with scatter/gather IO
Date: Thu, 14 Jul 2011 13:33:40 +0700
Message-ID: <CAA6iF_6Uamo_qFD=X3H1urO+1J3hM2A5Kri5o8652=Znq2Y6Ew@mail.gmail.com>
References: <CAA6iF_6Y4VbHSKnNMYhAhTjf=ZoQZxwO+nqYPmV=R5=6c=KKiQ@mail.gmail.com>
	<CALq1K=LLCLqE9k4QaqtDCxgPH8fniTPCssqDvSoOuOYT_j4Kag@mail.gmail.com>
	<CAA6iF_6CUa6ECMvnh9YehmxWYJzj23FEHZ4RJ5PtP-WdrrTr_A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=6YTqlp3RGZezFUk4sHXtKMapC28jOYU8/ahUZXp85RU=;
        b=VNtXeK0YL427wbfFU6+x+L3I9Le4XhnWZyVKe3XPcS3gC7b/3I9KDFg+OwTFlfcfDW
         f2XKm0JbtYbo7c4onEcQUMUhwc5FWxpv73MM5vOWfpYMolb6UykCC5oziLo8ml2lBhnT
         m12QleIVl7a+mvJQY+J6P/FHG/JkyR9X3XsYI=
In-Reply-To: <CAA6iF_6CUa6ECMvnh9YehmxWYJzj23FEHZ4RJ5PtP-WdrrTr_A@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Ahh,, you are right Leon, each iov member need to be initialized
first, my bad. Everything is OK now. I also use sysconf(_SC_IOV_MAX)
to determine maximum iovs count.

Thanks,


On Wed, Jul 13, 2011 at 7:16 PM, Leon Romanovsky <leon@leon.nu> wrote:
> On Wed, Jul 13, 2011 at 14:54, Randi Botse <nightdecoder@gmail.com> w=
rote:
>>
>> Hi,
>>
>> I will read/write file with readv() and writev(), I have problem to
>> use that since the struct iovec will be a variable-length array, if =
i
>> have code.
>>
>> struct foo {
>> =A0 =A0unsigned char data[100];
>> =A0 =A0unsigned char another_data[28];
>> };
>> unsigned len;
>> ....
>>
>> /* calculate len */
>> /* use len as array's member size */
>> struct iovec iov[len];
>> printf("len is: %i\n", len);
>> readv(fd, iov, len);
>>
>> I got: BAD ADDRESS, and if I remove the printf() then I will get
>> INVALID ARGUMENT. What the possible problem with that?
>>
>> Thanks,
>> --
>
> Did you try "man readv" ?
> You didn't initialized iovec struct.
> http://pubs.opengroup.org/onlinepubs/009695399/functions/readv.html
>
> --
> Leon Romanovsky | Independent Linux Consultant
> =A0 =A0 =A0 =A0=A0www.leon.nu=A0| leon@leon.nu
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
