From: FunkyChunkyMunky <funkychunkymunky@gmail.com>
Subject: Re: bare minimum SMTP implementation
Date: Fri, 30 Oct 2009 07:53:03 -0700
Message-ID: <4AEAFDCF.1000506@gmail.com>
References: <19475730.21256910810841.JavaMail.root@wombat>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=zaHdFjmflD8MghObiv9PZRLcIbHIAzWvZT90NJ/nXkw=;
        b=oWnGM/0pfYZbKmMho1a6c072TJBktjBjQPy5MUxCV6ZupkIHuKaa6msGMAUqB/M06z
         7G8Px3G5RoEAaNIll/f0SEx+vDld4Gfp+E7QefDFK0wfIsTJS1GqucIzSxu/gX6jDyEB
         W+IuFSCJFmK0gis8sc//7KZhtQODesqMGES6Q=
In-Reply-To: <19475730.21256910810841.JavaMail.root@wombat>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-c-programming@vger.kernel.org

darshan.ghumare@gmail.com wrote:
> In my project one thread will have a task to send mail. It can be send to say gmail also.
> But if you try to connect smtp.gmail.cm@25 then after greeting gmail ask you to setup SSL.
> I have search a lot for SMTP implementation that support STARTTLS, many of them consume about 800+kb. As my project is run on embedded system this is not feasible to me.
> If anybody knows any implementation that support above STARTTLS still consume less memory?
> Many of them ask for OpenSSL but that consume 800kb+ memory hence not feasible for me.
>
> Thank you very much
>
> Regards
> Darshan
>
>
>
> --
> This message was sent on behalf of darshan.ghumare@gmail.com at openSubscriber.com
> http://www.opensubscriber.com/messages/linux-c-programming@vger.kernel.org/topic.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   
why deliver directly from the embedded device?
setup a relaying mta and have all the devices forward to that server 
which will deliver the mail
