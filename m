From: _z33 <timid.Gentoo@gmail.com>
Subject: Re: default function parameters
Date: Sat, 10 Sep 2005 10:30:52 +0530
Message-ID: <dftpa5$qrb$1@sea.gmane.org>
References: <dfr8v1$kn7$1@sea.gmane.org> <17185.33678.421304.142260@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17185.33678.421304.142260@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Glynn Clements wrote:
> Nowadays, the main use of the former is for declaring a variable or
> field which can hold a pointer to arbitrary functions, e.g.
> 
> 	int (*foo)();
> 
> declares a variable which can hold a pointer to any function which
> returns int, regardless of its argument types.
> 
   Thanks for the explanation. Its clear now.

_z33
-- 
I love TUX; well... that's an understatement :)

