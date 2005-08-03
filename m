From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: proper declaration/definition of inline functions?
Date: Wed, 3 Aug 2005 09:51:29 +0100
Message-ID: <17136.34193.403677.817333@cerise.gclements.plus.com>
References: <Pine.LNX.4.63.0508021501100.29269@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0508021501100.29269@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

>   what is the proper usage of inline functions?  would you first
> declare it inline in a header file, and also define it inline in the
> corresponding source file?  (yes, i know the compiler is under no
> obligation to inline them ... i just want to know the canonical way to
> use them.)

You have to define them (as "static inline") in the header file.

-- 
Glynn Clements <glynn@gclements.plus.com>
