From: Christian Beckel <Christian.Beckel@gmx.de>
Subject: Re: A Calendar app on C
Date: Wed, 2 Jun 2004 09:17:10 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200406020917.10404.Christian.Beckel@gmx.de>
References: <Pine.LNX.4.58.0406012354140.12322@ns.isi.ulatina.ac.cr> <200406020910.41006.Christian.Beckel@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200406020910.41006.Christian.Beckel@gmx.de>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

oops, I forgot to test if there is a leap or not, the first line should be:

if (i == 2)
	days = (i % 4 != 0) ? 28 : 29;


> Hi,
>
> there are several possibilities to compute the number of days in a month or
> if there is a leap or not.
>
> if (i == 2)
> 	days = 28;
> else
> 	days = 31 - ( (i != 4 || i != 6 || i != 9 || i != 11) ? 1 : 0 );
>
> I think there is no simpler way, because the numbers of months are
> unregular.
