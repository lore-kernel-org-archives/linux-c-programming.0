From: "Helight.Xu" <helight.xu@gmail.com>
Subject: Re: select() timeout question
Date: Thu, 26 Nov 2009 08:57:57 +0800
Message-ID: <4B0DD295.1070506@gmail.com>
References: <34e1241d0911250029g5e56e1cdxe7abfce03eb15836@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=v2wv0ce9H8RU39tr/7v6L8IVCedeiotXOn3aKZhDIBE=;
        b=BC55ZKl/6rh3qXOKPLxgYJOAfsi4Cq479ohx9OTiRlCQYgy3DqIooP7r6pPWh+WviT
         PBDZJzeHZXM7/O6uQ9RBx8Gy4LIZelBZF8JEW4SW7hznaDLof55uKkJtjBINpSbKgPRm
         IWz2cylbCLc9ohtTC4UZxO4c8GEmaWtV/LDzg=
In-Reply-To: <34e1241d0911250029g5e56e1cdxe7abfce03eb15836@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Randi Botse wrote:
> Hi All,
>
> Im now learning the Linux's select() system call,
>
> #include <sys/select.h>
>
> int select(int fd, fd_set *rset, fd_set *wset, fd_set *excepfs, struct
> timeval *timeout);
>
> I want to receive notification when the given file descriptor is ready
> to read, i use TCP socket connection to demonstrate this, one for the
> sender and other for the receiver, with normal condition, when the
> sender send data via write(), the select() returns and tell the
> receiver there are data to read.
>
> My question is: what happen when the receiver's select() is reaching
> it's timeout while the sender send data? should the notification and
> it's data lost (discarded)?
>   
NO! if timeout ,the data will stay in kernel, and select will notice you 
when the select called again,

In fact , we always put select in while loop and set the timeout!
> Based on my above experiment, select() never fail to notify although
> it's in timeout state, and i awalys can read the data, i'm curious
> with this, but i'm not sure if this always right.
>
> Thanks before.
>
>                                             Randi,
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   


-- 
---------------------------------
Zhenwen Xu - Open and Free
Home Page:	http://zhwen.org

