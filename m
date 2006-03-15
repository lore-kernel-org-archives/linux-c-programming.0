From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Significance of using + before function calls.
Date: Wed, 15 Mar 2006 10:09:03 +0000
Message-ID: <17431.59327.133701.804651@cerise.gclements.plus.com>
References: <44180FBC.50703@wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <44180FBC.50703@wipro.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vamsi <krishna.vamsi@wipro.com>
Cc: linux-c-programming@vger.kernel.org


Vamsi wrote:

> i have seen a code snippet which starts with + symbol,
> 
> +system("ls -l");

I suspect that the "code snippet" in question comes from the output of
"diff -u", and the + is part of the diff syntax, not part of the code.

-- 
Glynn Clements <glynn@gclements.plus.com>
