From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: Printf and scanf
Date: Fri, 24 Jun 2005 23:20:35 +0200
Message-ID: <d93f04c70506241420114b28da@mail.gmail.com>
References: <20050605122105.1865.qmail@web52905.mail.yahoo.com>
Reply-To: Hendrik Visage <hvjunk@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-newbie-owner@vger.kernel.org>
In-Reply-To: <20050605122105.1865.qmail@web52905.mail.yahoo.com>
Content-Disposition: inline
Sender: linux-newbie-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>, newbie <linux-newbie@vger.kernel.org>

On 6/5/05, Ankit Jain <ankitjain1580@yahoo.com> wrote:

> i just want to know how scanf function can be used on
> the place of printf and vice versa

In the Obfuscated C contest one of the first/early entries is one that
states "Using read to write" (Or something to similar extend, or
perhaps even using scanf to print). Reading that code is hackery, and
from my first glance at the code, it was don't with quote and macro
hackery.

Thus you could #define scanf __prinf and #define printf __scanf... or
something with similar confusing

-- 
Hendrik Visage
-
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
