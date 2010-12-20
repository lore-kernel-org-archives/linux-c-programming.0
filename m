From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: unnamed pipe and independent process
Date: Mon, 20 Dec 2010 11:51:28 +0530
Message-ID: <AANLkTi=k6LpYQh47kd5zk-YWyCf=emy+eicJ9PgEm+st@mail.gmail.com>
References: <AANLkTinutqx=tN3TRMtqa73E0cwnyfUop9FXWz5yvqdy@mail.gmail.com>
	<201012200758.32380.cristeab@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=1nVtqOq+jVKzyDPse/1RdudBGXVzJwJFdgs3CgWMEas=;
        b=BQY45Q4gjNi6UO+13/d6xNy4oDDmZpLe51ce035NPlyusgf1wKmb+5v2/4YMwSuau5
         l1hLIBinAF6QFGaTBodShsMTo5eOXsnNOrEcwe9GbQs2WomseUSEjRDabclt1CDNk7lD
         FyvKC8azT2Y6DnBQ8J07J3+vI+Fiytcmo2gpg=
In-Reply-To: <201012200758.32380.cristeab@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bogdan Cristea <cristeab@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Could i use popen in some way ? somebody told me there is way around .




On Mon, Dec 20, 2010 at 11:28 AM, Bogdan Cristea <cristeab@gmail.com> w=
rote:
> On Monday 20 December 2010 06:37:54 you wrote:
>> is it possible to =A0communicate between two independent process usi=
ng
>> unnamed pipes in linux ?
>>
>> -Ratheesh
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in the body of a message to majordomo@vger.kern=
el.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
> This is exactly why named pipes (fifos) are provided.
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
