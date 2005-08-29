From: Steve Graegert <graegerts@gmail.com>
Subject: Re: source code for PS
Date: Mon, 29 Aug 2005 09:36:55 +0200
Message-ID: <6a00c8d505082900361f20e70d@mail.gmail.com>
References: <opsv9c3xmycqhltn@effigent.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <opsv9c3xmycqhltn@effigent.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kranthi <kranthi@effigent.net>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

On 8/29/05, kranthi <kranthi@effigent.net> wrote:
> 
> Hi,
> 
>        If u have Code snippet for PS
> 
>        please send me.

Please do your homework before posting.  Anyway:

        % rpm -qf `which ps`

for rpm compatible systems.  Now, get the SRPM from the installation media.
If you're runnning Debian, try this:

        % dpkg -S `which ps`
        % apt-get -qq source procps

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
