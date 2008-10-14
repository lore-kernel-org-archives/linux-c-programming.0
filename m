From: korfuri@gmail.com
Subject: Re : How to call another separate program and passing some variables in C?
Date: Tue, 14 Oct 2008 13:12:29 +0200
Message-ID: <c15440c50810140412r7df6c411xdf24dd6a16590132@mail.gmail.com>
References: <DF93814AEDB44B7484B8BF8F416AA50D@johnny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=TCBu7cGXjiEYUzamu88qBnrkb4YJmofJ6SNg1ELu2Jc=;
        b=hpr0RFsomZutyMIYVsivzMNhMJjXvj5S3TShC5XpEzgFOS4WNvJ9KrPZKAjZ3f+vzF
         Wk8DJs/aAV7mO9ScyDLViPpB8IXvGKLNtALwdXxgM3J4ciEGKp0eOzqFtA1ZrZk6HiPN
         Vx17C2SXzu7sRUyc2PaCq3HOTK4BthRWyGoo8=
In-Reply-To: <DF93814AEDB44B7484B8BF8F416AA50D@johnny>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: johnny_xing <johnny_xing@banshing.com>
Cc: linux-c-programming@vger.kernel.org

2008/10/14, johnny_xing <johnny_xing@banshing.com>:
> Hi,
>
> Forgive me if my question is so simple as I am a newbie to programming..
>
> I have two C programming and I want to call second C file within my first C
> program, upon calling, I need to pass some variables (like 1 or 0) to the
> second program.
>
> Can anyone tell me how to do? I searched system() but it seems not be able
> to do this.
>
> Thanks & Best Regards,
>
> Johnny
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

Hi,

You can use system() if you build the command-line (e.g. with
sprintf()) to pass the arguments you want. Then you can access it in
your 2nd program with argc/argv.

An alternative is to use fork() and execve(). Please note that you
have to convert each argument to a string so execve() can use it. Here
again you can use sprintf() for this purpose.

But are you sure you need two separate programs ? You can build 2 C
files together into one binary. That makes passing variables much
easier as it results to a normal function call.

Hope this will help
Regards,
Uriel

-- 
Uriel "Korfuri" Corfa
Epitech student
