From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: file deletion
Date: Thu, 30 Dec 2004 11:26:21 +0000
Message-ID: <16851.58845.416665.971234@gargle.gargle.HOWL>
References: <84bd26ef04122305146c8f8a89@mail.gmail.com>
	<003f01c4e9ba$7679d020$316c4ed5@j0s6l8>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <003f01c4e9ba$7679d020$316c4ed5@j0s6l8>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andy <andy_webb@onetel.com>
Cc: linux-c-programming@vger.kernel.org


Andy wrote:

> Does anybody know of any useful code or c commands that
> you can use to search for duplicate files within a linux/unix directory and
> its subdirectories and remove them?

First, you have to define "duplicate". Also, once you've decided that
two or more files are duplicates, you have to decide which one you
wish to keep and which ones are to be deleted.

If you consider any files with identical MD5 hashes as duplicates, and
don't care about which one is kept, you could use something like:

find . -type f -exec md5sum {} \; | sort | uniq -w32 -d | cut -b 35- | \
	while read file ; do rm -- "$file" ; done

However, if you have 3 or more copies of a given file, the above will
only delete one of them ("uniq -d ..." only prints one instance of
each duplicate line; "uniq -D ..." prints all instances, which would
result in all copies being removed; there isn't an all-but-one option).

-- 
Glynn Clements <glynn@gclements.plus.com>
