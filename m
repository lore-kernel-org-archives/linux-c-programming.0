From: Sebastian Henschel <shensche@kodeaffe.de>
Subject: Re: configure and make
Date: Mon, 25 Nov 2002 10:28:42 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021125092842.GA1678@enigma.daemon.sh>
References: <Pine.LNX.4.33.0211251139480.27485-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0211251139480.27485-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>

hello mohammed...

Received at 2002-11-25 / 10:00 by Mohammed Khalid Ansari:

> I used to write small programmes, just compile it and run that's it. But 
> now I am wroking on a big project which might require configure and make. 
> I am a newbie to these. Will anyone guide me where can I get the resources 
> to learn writing configure.in, Makefile.am, Makefile.in, Makefile etc.

look at the info-pages of autoconf (like "info -f autoconf"). it is
really a large document which also describes automake, libtool and
others.
then you should take a look at other small configure-enabled packages
and see how they work.

hth,
 sebastian
-- 
::: sebastian henschel
::: kodeaffe
::: lynx -source http://www.kodeaffe.de/shensche.pub | gpg --import
