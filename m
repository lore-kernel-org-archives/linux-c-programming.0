From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Shared Library
Date: Wed, 10 Aug 2005 13:24:56 +0100
Message-ID: <17145.61976.536068.680100@cerise.gclements.plus.com>
References: <20050809_200735_017781.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050809_200735_017781.r_zaca@ig.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: r_zaca <r_zaca@ig.com.br>
Cc: linux-c-programming@vger.kernel.org


r_zaca wrote:

>   Is it possible to check what shared libraries a program is using or what 
> shared libraries is available to a program inside the code? 
>   I mean, I need to be sure that a function in a shared library is available 
> before I call this function. 

It sounds as if you want dlopen/dlsym.

-- 
Glynn Clements <glynn@gclements.plus.com>
