From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Fri, 5 Aug 2005 13:13:36 +0200
Message-ID: <6a00c8d5050805041337c42a4d@mail.gmail.com>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091>
	 <673ac06405080402432d0feda3@mail.gmail.com>
	 <6eee1c40508040823165f1df7@mail.gmail.com>
	 <00c001c59974$32b0c9b0$9900a8c0@ispl091>
	 <6a00c8d50508042332245283db@mail.gmail.com>
	 <013901c59989$ed3d6440$9900a8c0@ispl091>
	 <6a00c8d505080500092364df97@mail.gmail.com>
	 <17139.19285.978591.275528@cerise.gclements.plus.com>
	 <6a00c8d50508050315501d900c@mail.gmail.com>
	 <030b01c599ab$fb845be0$9900a8c0@ispl091>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <030b01c599ab$fb845be0$9900a8c0@ispl091>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Amit Dang <amit_dang@intersolutions.stpn.soft.net>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On 8/5/05, Amit Dang <amit_dang@intersolutions.stpn.soft.net> wrote:
> This should not happen until compiler option /Zp is explicitly set to 8.
> Quoted from msdn

[snipped very useful info]

Thanks for the pointer.  After checking the command line switches (/Zp
was not set) and removing any optimizing option the result did not
change.  I actually don't care very much about the MS way things are
done, but it seems they follow their own logic.

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
