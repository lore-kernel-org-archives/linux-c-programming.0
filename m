From: "Xin Zou" <zouxin2008@gmail.com>
Subject: Re: command output to variables
Date: Wed, 7 Jan 2009 20:54:17 +0800
Message-ID: <e9d800340901070454w4f4b2ef4yb9cdc43019fb8736@mail.gmail.com>
References: <1f714d50901070435h4b76e26brdb1eedddbdda4cc3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Sb255S62Rodmp+YEU6MArdE8LmheonqWL4tzlG+6yso=;
        b=ILJLx+mg7PA4dmmp7/Syq0gQfCntO+dH4hBilAR+fAtSm2n/KkI0fnSFrh1snlubIz
         N4ectZ8eEJnyi5Mp5ME8bE/J8hDUnjzZ+H4m9apBjC4cDPyWqWWasnrk5e2hHWctheKr
         ANacd+9QRUGGpCI6Yl3lCca2vW9oTDRcFDISM=
In-Reply-To: <1f714d50901070435h4b76e26brdb1eedddbdda4cc3@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jai Sharma <jai.unix@gmail.com>
Cc: linux-c-programming@vger.kernel.org

It's not easy to get output in C.
You can use pipe to get the result from standard output.

On Wed, Jan 7, 2009 at 8:35 PM, Jai Sharma <jai.unix@gmail.com> wrote:
> Hi All
>
> I m PHP, Perl programmer , but finally I need C to program in LInux.
> In perl I simply use `` operator to get command output.
>
> $who_output = `who` ;
>
>
> but in C , how can i get the output. Using system function i m easily
> run the command. But how to get its output .
>
> system("who");
>
> Plz help
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
