From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: just curious!
Date: Sat, 8 Oct 2005 08:17:18 +0100
Message-ID: <17223.29310.783504.657650@cerise.gclements.plus.com>
References: <s34561c8.010@EMAIL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <s34561c8.010@EMAIL>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Suma Choudhary <sumac@myw.ltindia.com>
Cc: linux-c-programming@vger.kernel.org


Suma Choudhary wrote:

> I was curious to know how the "write" command works.Any IPCs used?

It determines the terminal(s) on which the specified user is logged in
from the utmp file, opens the terminal device for writing, and writes
to it.

Note that the terminal device must be group-writeable (normally
controlled using "mesg y" or "mesg n"). The write command itself is
setgid tty.

-- 
Glynn Clements <glynn@gclements.plus.com>
