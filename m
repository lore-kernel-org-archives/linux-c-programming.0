From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: Co-thread for parallel processing
Date: Fri, 2 Dec 2011 17:10:52 +0700
Message-ID: <CAA6iF_6eNdKuTFge_9Ddxfag14SfMP4uKEfV8Ka_hTLFGMWzwA@mail.gmail.com>
References: <CAA6iF_4z_MPpU8Eq+i+PT-+VgpX_ZXX5FwOwa2NpLxW_gyzTSg@mail.gmail.com>
	<201112021028.38892.cristeab@gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=QeCo6gV+ncEz40KqttpRdeD/Z3KZqPqYnz6S3Xu3ujA=;
        b=bjY/lqPdy+z88J54E4HWqgxyXuxHQXbJYEERQxP70ZU2QXl3HzxEqP5CKut1X2Z9jR
         UZ+813gK0j6c8UbQFBkvMmZ71K2JBnq3Zn7fleEcVClRBB7VWzgzvz6GEkDeGa56Cnsa
         +q3cdiRrANYlgVMPSoyTkxPSBnEuqNGa+qW5Y=
In-Reply-To: <201112021028.38892.cristeab@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bogdan Cristea <cristeab@gmail.com>
Cc: linux-c-programming@vger.kernel.org

> I would use  a semaphore...
Ok, let see what I can do with that.

2. Just forget that, that might be caused by my frustation... ;)

> 2. After calling pthread_cond_signal() or pthread_cond_broadcast()
> followed by sleep()/nanosleep(),
>     the condition variable looks like not signaled, (the co-thread
> routine doesn't run). What make this?

I don't understand, please provide a working example

> Bogdan
