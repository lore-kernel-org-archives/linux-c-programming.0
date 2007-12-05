From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Serialization in C
Date: Wed, 5 Dec 2007 18:47:21 +0100
Message-ID: <6a00c8d50712050947i2ac24768k447c643de2ff7c95@mail.gmail.com>
References: <4756DDE1.3020508@yahoo.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=ah9E5a9Zwvbnmo5v5KiGTz7ScoY78QdbeB9v9e6U+20=;
        b=nB3+CDRwY0FYrHpgZwypR9HjpHYwwPr0bDr/3x3/pTYNLGLaG7gXYqi2U4VAZGt52FvE/SDc8RqCw7cTwc2JyOTs1jqHShN8fGTVYTxeHOR+Ickno16Aj56v7JQyJ5zFdvB66nUoEmtyoUsZoFIDacTfYA6yXu9To3dMyRMmz+0=
In-Reply-To: <4756DDE1.3020508@yahoo.co.in>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dinesh <tdblinux@yahoo.co.in>
Cc: linux-c-programming@vger.kernel.org

On Dec 5, 2007 6:20 PM, Dinesh <tdblinux@yahoo.co.in> wrote:
>
>  Hello,
>
>  I'm using graph and tree represented in linked list structure  in my=
 C
> program..
>
>  I have to save them while running the program to  retrieve later.
>
>  Is there any C libraries available to serialize  these structures...
>
>  My search became a vain attempt..  It will be fine if I get some
> relevant information..

I'd recommend taking a look at TPL which seems to be exactly what
you're looking for.
Get it from here: http://tpl.sourceforge.net

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
