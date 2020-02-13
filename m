From: lego12239@yandex.ru
Subject: Re: big number(around 100 digits) arithmetic
Date: Thu, 13 Feb 2020 20:50:51 +0300
Message-ID: <20200213175033.GA29073@legohost>
References: <CAHhAz+iDUgjBq8vWsf-dPHwbojMwFB8CKORraT84vS3LcBrt0A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1581616230;
        bh=V0QhysKolwo/x4LqLL8Lgg+w3+wtVWkJJlotTKynNKU=;
        h=In-Reply-To:Subject:Cc:To:From:References:Date:Message-ID;
        b=QvXkT8NCxKgA036AyAep7LLazkp2IONT8HBcv+fYzd5Y9zgXkRCiwzFkgtdgDc6R/
         9t1Edj/yPWgHSiCT69R7GRoyLiSceXfnEXHdEU2RP0+so/h+bU6/0oXPz6NxdY1M8g
         r3G1K3/1pBCWBlr6zJpyikGmtBDoCjR8AQ9Vf4Cg=
Content-Disposition: inline
In-Reply-To: <CAHhAz+iDUgjBq8vWsf-dPHwbojMwFB8CKORraT84vS3LcBrt0A@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Thu, Feb 13, 2020 at 10:38:44PM +0530, Muni Sekhar wrote:
> [ Please keep me in CC as I'm not subscribed to the list]
> 
> HI all,

  Hi.

> I’m looking for a “C” program for big number(around 100 digits)
> arithmetic i.e.
> mltiplication\addition\division\subtraction\exponentiation and
> modulus, etc.
> 
> Basically I want to use it for ‘Extended Euclidean Algorithm’ and
> public-key encryption with the RSA algorithm which typically requires
> larger integers and it will not fit into C data types. Can someone
> point me the to the either source code or logical explanation on how
> to handle big number arithmetic?

  gmp lib - https://gmplib.org ?

-- 
Олег Неманов (Oleg Nemanov)
