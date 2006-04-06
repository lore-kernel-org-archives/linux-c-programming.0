From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: FILE_FLAG_WRITE_THROUGH
Date: Thu, 6 Apr 2006 09:02:52 +0200
Message-ID: <6a00c8d50604060002t1cbc1f74nf0deb3fca0521d97@mail.gmail.com>
References: <4432B296.8050408@gmail.com>
	 <17459.16716.938764.154497@cerise.gclements.plus.com>
	 <20060405065038.GB716@ju.Imrashi.net.bd>
	 <6a00c8d50604050036p127a1348hee9c6fa7ea67bed@mail.gmail.com>
	 <17460.4298.747957.303455@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17460.4298.747957.303455@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 4/5/06, Glynn Clements <glynn@gclements.plus.com> wrote:
>
> Steve Graegert wrote:
>
> > > > The O_DIRECT flag suggested by Steve is probably overkill. It requires
> > > > that the buffer start address, buffer size and file offset are all
> > > > multiples of the filesystem's block size, and only works on some
> > > > filesystems.
> > >
> > > Although it works for a single file, how good is fsync() in this case?
> >
> > fsync(2) does not ensure that all data has actually been written to
> > disk.  The controller may indicate that all data is stable, but it
> > does so even if it is still in its internal cache.  From this point of
> > view, fsync(2) is not a replacement for O_DIRECT.
>
> If the drive doesn't accurately indicate whether data has been written
> to the physical medium, that will affect everything, including
> O_DIRECT. There have been cases of drives which indicate that data has
> been written even when it's still in the cache, in order to improve
> benchmark scores.

That's what all (IDE) drives do; they simply lie about the state of
data in their internal caches.  And the kernel believes them; it has
no idea of what's in the drive's cache and has no controll over it. 
SCSI drives also do caching, but the SCSI layer uses tags to turn
caching on and off if necessary.  This is exactly what happens with
O_DIRECT on Linux.

> I don't believe that there's any difference between O_SYNC, O_DIRECT
> or fsync() in terms of their interpretation of "written to the
> hardware"; they all send a "flush" command to the drive and block
> until the drive reports completion.

It depends heavily on the i/o subsystem and the i/o media.  There is a
significant difference between IDE and SCSI drives.  The latter report
data to be stable on disk only, if the blocks held in cache have found
their place on the disk.

> The advantage of O_DIRECT is that it won't displace existing blocks
> from the kernel's buffer cache, which might be useful if you're
> writing a lot of data and won't be reading it back in any time soon.

Exactly, and most SCSI (and some more advanced IDE/SATA controllers)
take that into account.  They offer fairly good services for drivers
to allow OSes to handle some special i/o requests as it is the case
for O_DIRECT.

> According to:
>
>         http://support.microsoft.com/default.aspx?scid=kb%3Ben-us%3B99794
>
> that is more than what FILE_FLAG_WRITE_THROUGH does:
>
>         The FILE_FLAG_WRITE_THROUGH flag for CreateFile() causes any
>         writes made to that handle to be written directly to the file
>         without being buffered. The data is cached (stored in the disk
>         cache); however, it is still written directly to the file.
>         This method allows a read operation on that data to satisfy
>         the read request from cached data (if it's still there),
>         rather than having to do a file read to get the data. The
>         write call doesn't return until the data is written to the
>         file. This applies to remote writes as well--the network
>         redirector passes the FILE_FLAG_WRITE_THROUGH flag to the
>         server so that the server knows not to satisfy the write
>         request until the data is written to the file.
>
> O_DIRECT appears closer to FILE_FLAG_NO_BUFFERING:
>
>         The FILE_FLAG_NO_BUFFERING takes this concept one step further
>         and eliminates all read-ahead file buffering and disk caching
>         as well, so that all reads are guaranteed to come from the
>         file and not from any system buffer or disk cache. When using
>         FILE_FLAG_NO_BUFFERING, disk reads and writes must be done on
>         sector boundaries, and buffer addresses must be aligned on
>         disk sector boundaries in memory.
>
> IOW, FILE_FLAG_WRITE_THROUGH corresponds to O_SYNC while
> FILE_FLAG_NO_BUFFERING corresponds to O_DIRECT.

Agree on that one.  I read the OP as a request on how to do "true"
cacheless i/o.
 Nevertheless, it should be noted that O_DIRECT usually downgrades
overall performance if called synchronously.  There is no point in
doing so, exactly because of the above reasons.

	\Steve
