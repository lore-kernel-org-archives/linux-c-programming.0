From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: buggy_double_use_of _scanf
Date: Tue, 26 Oct 2004 21:59:12 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16766.47776.33240.455119@cerise.gclements.plus.com>
References: <417E4640.2040504@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <417E4640.2040504@laposte.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: simon <simon.guinot@laposte.net>
Cc: linux-C-programming <linux-c-programming@vger.kernel.org>


simon wrote:

> I have observe a strange scanf behaviour...
> when using two successive scanf... the second receive a return character
> 
> for example :
> 
> int a;
> char b;
> 
> scanf ("%d", &a);
> fflush (stdin);
> scanf ("%c", &b);
> fprintf (stdout, "a : %d\nb : %c\n", a, b);
> 
> what's the problem ?

What makes you think that there is a problem?

What's the input? If it's a decimal number followed by newline, the
first scanf() will return the parsed number, the second will return
the newline.

-- 
Glynn Clements <glynn@gclements.plus.com>
