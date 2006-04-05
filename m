From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: FILE_FLAG_WRITE_THROUGH
Date: Wed, 5 Apr 2006 09:31:29 +0200
Message-ID: <6a00c8d50604050031w3b30032bm73cefeab84119024@mail.gmail.com>
References: <4432B296.8050408@gmail.com>
	 <17459.16716.938764.154497@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17459.16716.938764.154497@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 4/5/06, Glynn Clements <glynn@gclements.plus.com> wrote:
>
> Rebelde wrote:
>
> > On Windows XP I can write directly to disk whitout cache write using the
> > CreateFile function with FILE_FLAG_WRITE_THROUGH. Could someone tell me
> > how to make this on Linux?
>
> Pass the O_SYNC flag to open(). This will cause write() calls to block
> until the data has been sent to the drive.
>
> The O_DIRECT flag suggested by Steve is probably overkill. It requires
> that the buffer start address, buffer size and file offset are all
> multiples of the filesystem's block size, and only works on some
> filesystems.

Well, the O_SYNC flag causes, i.e. write(2), to block until the data
has been physically written to disk, but it does not prevent the C
library/kernel from caching the bytes.  O_DIRECT, on the other hand,
circumvents the caching mechanisms and allows for raw access, although
it may degrade performance.  While sematically difficult, I think this
technique is nearest equivalent to the FILE_FLAG_WRITE_THROUGH flag
known from Windows.

	\Steve
