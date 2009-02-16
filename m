From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: running out of file descriptors
Date: Mon, 16 Feb 2009 21:43:23 +0000
Message-ID: <18841.56827.356161.98320@cerise.gclements.plus.com>
References: <444391460902152148u11d4a973ka5a630898405d1c6@mail.gmail.com>
	<3605561d0902152218t431d9edbuf87397bdc9af999@mail.gmail.com>
	<444391460902152309h179bd75agdded10ca6af135d@mail.gmail.com>
	<200902160701.14982.eric@cisu.net>
	<444391460902160935t5b244463nec095fedc45f3707@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <444391460902160935t5b244463nec095fedc45f3707@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bryan Christ <bryan.christ@gmail.com>
Cc: eric@cisu.net, Joe Damato <ice799@gmail.com>, linux-c-programming@vger.kernel.org


Bryan Christ wrote:

> I pretty sure you can just echo to /proc/sys/fs/file-nr to set that
> value (which already seems really high at 560178).  I doubt I'm
> exhausting 560178 descriptors.

file-nr is read-only, and reports the number of open descriptors, the
number of free descriptors, and the limit.

file-max is writable, and controls the system-wide limit.

-- 
Glynn Clements <glynn@gclements.plus.com>
