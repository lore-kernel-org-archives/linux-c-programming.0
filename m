From: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Subject: RE: config.h
Date: Wed, 11 Dec 2002 01:28:42 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001d01c2a0e6$ef85a2b0$972a3a41@joe>
References: <20021210155618.A11637@atl.lmco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20021210155618.A11637@atl.lmco.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Chuck Winters' <cwinters@atl.lmco.com>, linux-c-programming@vger.kernel.org

> Would it be prudent to include the linux/config.h
> file in a user level program to check for the
> existence of certain modules?  I know there are
> other ways, like using autoconf, etc.  I was just wondering.

No, because modules can be dynamically loaded on-the-fly, completely
independent of however the kernel is compiled.

Additionally, config.h (actually just an #include for autoconfig.h) is an
automatically generated file which varies depending upon how an INDIVIDUAL
USER compiles his/her own INDIVIDUAL kernel.  There's no way for you to
anticipate the contents of config.h in advance.  It's better to use other
methods.

Use of config.h would be necessary if you were compiling something directly
into the kernel.

Joseph Wagner

