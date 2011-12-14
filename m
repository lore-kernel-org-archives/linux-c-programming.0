From: Glynn Clements <glynn@gclements.plus.com>
Subject: RE: header files missing
Date: Wed, 14 Dec 2011 13:18:53 +0000
Message-ID: <20200.41533.67427.527798@cerise.gclements.plus.com>
References: <CAGZFCEGxdS6Wbye+jy_HCpv-OquSNX6gKFLh3xDK-Fwfn1T3ag@mail.gmail.com>
	<4EE610E8.7010001@maxim-ic.com>
	<CAGZFCEFiYf88nhEeYUGmHOJ5TXXgC3F5WOC6xx2CsofE5GEL9Q@mail.gmail.com>
	<CACL2Z18JF+uke02_+SNpGB71UR2=jruMf=8X3oCK-6W7E9Qk0g@mail.gmail.com>
	<75E4E6EA13D477499AE4AE34E8AF042005AD4ECA9D@EXCMB2.wolfsonmicro.main>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <75E4E6EA13D477499AE4AE34E8AF042005AD4ECA9D@EXCMB2.wolfsonmicro.main>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Renjith Gopinadhan wrote:

> Surely, he has glibc installed, but the issue is that anything to do
> with the PATH variable or anyother environment variable settings?

Most distros split libraries into runtime and development packages.
Shared libraries are in the runtime package, headers are in the
development package.

He'll certainly have the runtime package for glibc, but he won't
necessarily have the development package.

-- 
Glynn Clements <glynn@gclements.plus.com>
