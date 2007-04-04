From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: efficiency in passing a value to a function
Date: Wed, 4 Apr 2007 19:27:41 +0100
Message-ID: <17939.60957.687289.154272@cerise.gclements.plus.com>
References: <4613DCB8.8030007@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4613DCB8.8030007@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <jamadagni@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> Is providing an input to a function by constant reference more efficient 
> than passing it by value? In what way.

Passing a reference doesn't copy the value. This can be significant if
the value is large (i.e. a structure); for values which are no larger
than a pointer, it is unlikely to make any difference.

-- 
Glynn Clements <glynn@gclements.plus.com>
