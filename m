From: Bernhard Walle <bernhard@bwalle.de>
Subject: Re: Unicode to CP1252
Date: Thu, 08 Oct 2009 20:23:34 +0200
Message-ID: <4ACE2E26.1080304@bwalle.de>
References: <25802503.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <25802503.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tblue <ashley.glenister@ukonline.co.uk>
Cc: linux-c-programming@vger.kernel.org

tblue schrieb:
> 
>  I need to convert a windows ANSI test file to unicode in Linux. Later the 
> data needs to be saved from Unicode to ANSI.
> 
> Can anyone recommend a function call that would allow me to achieve this. An
> example code showing how to use it would be a bonus.

iconv_open(), iconv() and iconv_close(). See the manual pages for a
description. I guess with Unicode you mean UTF-8.



Regards,
Bernhard

