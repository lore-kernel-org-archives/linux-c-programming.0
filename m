From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Offtopic.
Date: Tue, 30 Jul 2002 07:44:41 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15686.13785.543964.140592@cerise.nosuchdomain.co.uk>
References: <20020729082601.C896@nietzsche.metrotel.net.co>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020729082601.C896@nietzsche.metrotel.net.co>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: xlp <xlp@emtel.net.co>
Cc: linux-c-programming@vger.kernel.org


xlp wrote:

> I read a documentain that describe signals and It says there are 4 types of
> 'signal handling enviroments': BSD, SysV unreliable, SysV reliable y POSIX.
> What does that means? What are those 'enviroments'?

I'm only aware of two of those.

The (unreliable) SysV signal() implementation is equivalent to using
sigaction() with the SA_ONESHOT and SA_NODEFER flags.

The BSD signal() implementation is equivalent to using sigaction() with
the SA_RESTART flag.

> How can I know which enivorement use certain OS ?

Check the signal(2) manpage. However, it may be wrong; e.g. my version
(from RedHat 6.2) describes the SysV semantics, although glibc-2
actually uses the BSD semantics by default.

The easiest solution is simply not to use signal(), but to use
sigaction() instead.

> What is "POSIX"?

It's a family of IEEE standards which define a common Unix-like API. 
The original POSIX.1 standard (which specifies the base API) has
largely been superseded; first by the XPG standards and, more
recently, via the Single Unix Specification.

You can read the Single Unix Specification online at www.opengroup.org
(free registration required). AFAIK, the other standards aren't
available online (and copies are very expensive).

-- 
Glynn Clements <glynn.clements@virgin.net>
