From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: nanosleep over multiple processes
Date: Wed, 27 Jun 2012 22:44:36 +0700
Message-ID: <CAA6iF_7phbSAuOgeXjywJ05gedTpTY=a_v9pAeyYJ4MBTqUvpw@mail.gmail.com>
References: <CAA6iF_7rzg8o0C5kbNgcRYmgj=t+0As-YQzP7Ddbmaz6yMAqLA@mail.gmail.com>
	<20120622055356.GA15833@opentech.at>
	<CAA6iF_60u5dbOm7aQF30iWbsFHMj4=aPu8Ekg=McSF8QJ8yyQg@mail.gmail.com>
	<20120623131126.GA2650@pinguin>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ACPdhYAMvOkyhU3Kv+w6412h6YkDOXliDAI5/cc3ubE=;
        b=P0J6jhuAMTTIjcmfQsmdsp9vEjAj9jFkMp4ngFRWX6eyi9hMk3UjRjSTeYQIkZqYYb
         Fk2i2onqRtxvydsa89VZHeOpD6xwc0fu/g8XbZSzQTPiUBDq8CcVFNM3GvMB1hcrd0G5
         7Q3qqtPxgSQOPlDONSGiWSnAr/bOg1Wcrl3zmr8jpR1G5FBikTe1BCHnaz5Qy7iNUiLT
         7D3HR4hYyTy/2ce++z/PpiZmKZJcQPlhPdOHFwXMoNMSu3/D0Q4idwgcFAlGezEN3EoQ
         2VkgHiBv/l6VyvZ87NLtHowYKFigDLytITixHPRnyEK9tZGSYunCNrGSD8cCC2yeEMt0
         nJyg==
In-Reply-To: <20120623131126.GA2650@pinguin>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Murzin <murzin.v@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Okay, and libuuid is even better implementation on how unique ID
should be generated in the real world that respect with many aspects
of parallelism.

So I'll completely need to rewrite my naive UID generator.
Thanks for everyone for giving me great lessons and resources.

Randi,

On Sat, Jun 23, 2012 at 8:11 PM, Vladimir Murzin <murzin.v@gmail.com> wrote:
> Hi
>
> Why don't you use universally unique identifier (UUID)[1]?
> I was invented and standardized to deal with cases like yours.
> You can find more information how to use UUID in your software form
> man uuid [2]
>
> [1] http://en.wikipedia.org/wiki/Universally_unique_identifier
> [2] http://linux.die.net/man/3/uuid
>
> Best wishes
> Vladimir Murzin
