From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: What is the use of extern inline?
Date: Mon, 11 Jun 2007 10:18:55 +0530
Message-ID: <466CD437.9000701@gmail.com>
References: <465BA2CE.9060609@gmail.com> <18019.47303.745646.965225@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18019.47303.745646.965225@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Glynn Clements wrote:
>> In man:gcc under -fkeep-inline-functions I first came across the usage 
>> of "extern inline". For normal functions, extern declares that the 
> 
> "extern inline" is meaningless. You can only inline functions which
> occur in the current translation unit.

If this is so, then why does the GCC manpage have this usage?

Shriramana.
