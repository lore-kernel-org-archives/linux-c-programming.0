From: wwp <subscript@free.fr>
Subject: Re: file deletion
Date: Thu, 30 Dec 2004 13:04:32 +0100
Message-ID: <20041230130432.4f93abe2@tethys.montpellier.4js.com>
References: <84bd26ef04122305146c8f8a89@mail.gmail.com>
	<003f01c4e9ba$7679d020$316c4ed5@j0s6l8>
	<16851.58845.416665.971234@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16851.58845.416665.971234@gargle.gargle.HOWL>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello Glynn et al,


On Thu, 30 Dec 2004 11:26:21 +0000 Glynn Clements <glynn@gclements.plus.com> wrote:

> 
> Andy wrote:
> 
> > Does anybody know of any useful code or c commands that
> > you can use to search for duplicate files within a linux/unix directory and
> > its subdirectories and remove them?
> 
> First, you have to define "duplicate". Also, once you've decided that
> two or more files are duplicates, you have to decide which one you
> wish to keep and which ones are to be deleted.
> 
> If you consider any files with identical MD5 hashes as duplicates, and
> don't care about which one is kept, you could use something like:
> 
> find . -type f -exec md5sum {} \; | sort | uniq -w32 -d | cut -b 35- | \
> 	while read file ; do rm -- "$file" ; done
> 
> However, if you have 3 or more copies of a given file, the above will
> only delete one of them ("uniq -d ..." only prints one instance of
> each duplicate line; "uniq -D ..." prints all instances, which would
> result in all copies being removed; there isn't an all-but-one option).

An idea would also be to remove all-but-one and create hardlinks in place of
the removed ones, maybe? Of course it would depend Andy's answers to the
questions raised by Glynn: what means 'duplicate' and what to do w/ those
dups (even why are you checkinf for dups and what are you expecting to be
able to do?).


Regards,

-- 
wwp
