From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: FILE_FLAG_WRITE_THROUGH
Date: Wed, 5 Apr 2006 09:36:25 +0200
Message-ID: <6a00c8d50604050036p127a1348hee9c6fa7ea67bed@mail.gmail.com>
References: <4432B296.8050408@gmail.com>
	 <17459.16716.938764.154497@cerise.gclements.plus.com>
	 <20060405065038.GB716@ju.Imrashi.net.bd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20060405065038.GB716@ju.Imrashi.net.bd>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 4/5/06, Progga <abulfazl@juniv.edu> wrote:
> On Wed, Apr 05, 2006 at 05:02:20AM +0100, Glynn Clements wrote:
>
> > The O_DIRECT flag suggested by Steve is probably overkill. It requires
> > that the buffer start address, buffer size and file offset are all
> > multiples of the filesystem's block size, and only works on some
> > filesystems.
>
> Although it works for a single file, how good is fsync() in this case?

fsync(2) does not ensure that all data has actually been written to
disk.  The controller may indicate that all data is stable, but it
does so even if it is still in its internal cache.  From this point of
view, fsync(2) is not a replacement for O_DIRECT.

	\Steve
