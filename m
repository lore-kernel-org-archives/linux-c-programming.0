From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: strtod() and errno question.
Date: Wed, 11 Jan 2006 03:01:25 +0000
Message-ID: <17348.29957.526334.352861@cerise.gclements.plus.com>
References: <Pine.LNX.4.21.0601102235490.1799-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0601102235490.1799-100000@hestia>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


J. wrote:

> I have a question regarding errno and strtod() error checking. I have a
> function [listed below] that extracts a number from a string. In case of
> an error, strerror() in conjunction with errno is used to display a user
> friendly error message. However on a strtod() error; `Success' is
> returned.

Note that strtod() only sets errno on overflow or underflow.

If you want to check for failure to convert (because no prefix of the
string is a valid floating-point number), you need to check whether
"nptr == str".

-- 
Glynn Clements <glynn@gclements.plus.com>
