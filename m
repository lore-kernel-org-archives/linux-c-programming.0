From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: linking to libstdc++
Date: Thu, 8 Apr 2004 22:44:48 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16501.51152.376083.546495@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.58.0404081604520.518@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0404081604520.518@debian>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ameer armaly <ameer@charter.net>
Cc: linux-c-programming@vger.kernel.org


ameer armaly wrote:

> What is the ld option to link to the c++ library? like -lc is to link to
> the c library.

	-lstdc++

In general, the switch -lfoo will link against libfoo.so or libfoo.a.

However, if you invoke the linker via g++, -lstdc++ is added
automatically.

-- 
Glynn Clements <glynn.clements@virgin.net>
