From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Problems installing libc documentation
Date: Tue, 30 Dec 2003 09:44:40 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16369.18696.500775.607139@cerise.nosuchdomain.co.uk>
References: <LCAOBHPHFKMJHBAA@mailcity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <LCAOBHPHFKMJHBAA@mailcity.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: parvezp@lycos.com
Cc: linux-c-programming@vger.kernel.org


Parvez Pathan wrote:

> I would like to install the libc documentation on my linux box. Can
> anybody please tell me how to go about with it. I would like to see
> the documentation using the "info libc" command.

It should get installed by "make install" (if building from source),
or as part of the appropriate development package (e.g. for RedHat
6.2, it's in the glibc-devel RPM).

The files in question will normally go into /usr/info, and all begin
with "libc.info". You may need to manually update the /usr/info/dir
before the files can be accessed.

-- 
Glynn Clements <glynn.clements@virgin.net>
