From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: copy program
Date: Wed, 7 Sep 2005 02:14:20 +0100
Message-ID: <17182.16108.753135.462745@cerise.gclements.plus.com>
References: <1125987925.3348.66.camel@kaushal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1125987925.3348.66.camel@kaushal>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kaushal@rocsys.com
Cc: linux-c-programming@vger.kernel.org


kaushal wrote:

>           The default copy program in the linux or windows will not
> create a file,if the copy process aborts at say the last 5 seconds.Lets
> say the file size is 700MB and the copy process failed after copying
> 695MB and aborted,then we don't have the 695MB file on the hdd.If alone
> the copy is successful till 100%we can have it.

That's because the cp command deletes the destination if there is an
error.

If you don't want this, copy it using "dd".

-- 
Glynn Clements <glynn@gclements.plus.com>
