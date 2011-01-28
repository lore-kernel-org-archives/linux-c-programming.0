From: David Astua <dastuam@gmail.com>
Subject: Re: Any problem ?
Date: Fri, 28 Jan 2011 15:01:45 -0600
Message-ID: <AANLkTimsCPz0+JgLpvWNhiLbjyL-3NWqzMCirf_wW4tU@mail.gmail.com>
References: <AANLkTikRjcxV6+uUr+8_5LHjCMiFf91d00bH7wu7p6CX@mail.gmail.com>
	<AANLkTimg=+0jUVjyG2Zq7ZqC=A5XbjWfkjoJADmPsULK@mail.gmail.com>
	<AANLkTinHSY3Jd7Th6zmLZCo0ziwCJrMJuQT78t3Nr1_B@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=fFS07o7i+pUc/BmF4/AAlneuE9oBOEwM6sDktKcnEk8=;
        b=iAdMVsqY5tBSWTP6N9tM6jm/VRZQgliYvQV3zioxnbKc7eRQGfMtymEzEZHSWvfWst
         KsiVjT+EESKsVLRAmsG536ZpuQGenlIQqHlKxOAL1IXPo7h11dUSLqnNi7kheHa2OADN
         kn4GfDDK6uA9l5LNqMzvu+GqhXTiPItBynVKg=
In-Reply-To: <AANLkTinHSY3Jd7Th6zmLZCo0ziwCJrMJuQT78t3Nr1_B@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Leon Romanovsky <leon@leon.nu>
Cc: ratheesh k <ratheesh.ksz@gmail.com>, linux-c-programming@vger.kernel.org

On Fri, Jan 28, 2011 at 2:46 PM, Leon Romanovsky <leon@leon.nu> wrote:
>> str=3DNULL;
> In general, you don't need this line.
>
> --
> "Change is inevitable; progress is optional".
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Anyway is a good practice i think, to avoid double-free problems on
more complex code.
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
