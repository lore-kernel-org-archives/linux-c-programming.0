From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: printf(), aligning fields
Date: Sun, 24 Aug 2003 01:07:42 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16200.462.367759.211524@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.44.0308222010400.17321-100000@praktifix.dwd.de>
	<Pine.LNX.4.21.0308232217220.23476-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0308232217220.23476-100000@hestia>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org


J. wrote:

> I am trying to print collums from a c program, as the
> following example illustrates:
> 
>   Total  Number   Folder
>   -----  ------   ------
>   15502   17      cronlog
>   189897  42      linux/debian-curiosa
>   161751  32      linux/debian-firewall
>    4305   1       linux/debian-general
>   17431   1       linux/debian-news
>   107517  1       linux/vger-kernel-announce
>   61136   16      linux/vger-kernel-c-programming
>    8580   2       linux/vger-kernel-gcc
> 
> How can I can align the output to the max right field boundry without
> overcrossing that field boundry if the field value gets longer?
> 
> Do I really have to check the length of the value before printing it with,
> %*s, and then determine how many spaces I need? 

You have to make the field large enough to hold all of the values. The
*printf() family of functions don't provide any way to truncate a
field to a maximum width.

-- 
Glynn Clements <glynn.clements@virgin.net>
