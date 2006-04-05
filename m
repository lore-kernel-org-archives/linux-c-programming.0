From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: FILE_FLAG_WRITE_THROUGH
Date: Wed, 5 Apr 2006 05:02:20 +0100
Message-ID: <17459.16716.938764.154497@cerise.gclements.plus.com>
References: <4432B296.8050408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4432B296.8050408@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rebelde <jrsilva2k@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Rebelde wrote:

> On Windows XP I can write directly to disk whitout cache write using the 
> CreateFile function with FILE_FLAG_WRITE_THROUGH. Could someone tell me 
> how to make this on Linux?

Pass the O_SYNC flag to open(). This will cause write() calls to block
until the data has been sent to the drive.

The O_DIRECT flag suggested by Steve is probably overkill. It requires
that the buffer start address, buffer size and file offset are all
multiples of the filesystem's block size, and only works on some
filesystems.

-- 
Glynn Clements <glynn@gclements.plus.com>
