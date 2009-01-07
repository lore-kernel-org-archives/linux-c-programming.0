From: "Bert Wesarg" <bert.wesarg@googlemail.com>
Subject: Re: command output to variables
Date: Wed, 7 Jan 2009 15:31:43 +0100
Message-ID: <36ca99e90901070631i2522a125uda7502b084758626@mail.gmail.com>
References: <1f714d50901070435h4b76e26brdb1eedddbdda4cc3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=62GLeo3NHNhtfBpU7QsWfquzOei1AWI7k+ZkVyAWL3E=;
        b=vJSI+7rZAJh3FSoVzml8Waqp2uNDU/2Q+d0JjfmTItJklFfhbMQrggryaynEip4TXg
         DVlc8SPPmRy5UnD2JsVLmjcgnVd8ydY9tWtv3d9QDdlAi28d57hPy5gCgFHHf6zuWRfR
         3wXk/RgEMA8Kvh/EJTLmSSurZN0LCBHZnLcWU=
In-Reply-To: <1f714d50901070435h4b76e26brdb1eedddbdda4cc3@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jai Sharma <jai.unix@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Wed, Jan 7, 2009 at 13:35, Jai Sharma <jai.unix@gmail.com> wrote:
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
use popen("who", "r") and read from the stream into a buffer

Bert
>
> Plz help
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
