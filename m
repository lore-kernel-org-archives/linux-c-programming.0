From: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Subject: Re: du and ls
Date: Sat, 2 Jun 2007 23:09:36 +0000 (UTC)
Message-ID: <Pine.LNX.4.64.0706052236270.20275@ns.isi.ulatina.ac.cr>
References: <Pine.LNX.4.64.0706050051290.29079@ns.isi.ulatina.ac.cr>
 <18017.20272.201352.576692@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Date: Tue, 5 Jun 2007 22:38:56 -0600 (CST)
In-Reply-To: <18017.20272.201352.576692@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

> Fabio Miranda Hamburger wrote:
>
>> I am curious about the mismatch between du and ls. Apparently, du reports
>> amount of 512 or 1024-K blocks, and ls lists the absolute value.
>
> du reports the amount of disk space which the file uses, while ls
> reports the amount of data which it contains.
>
>> But, why in some cases, a 1100 bytes file is reported by du as 4 x 512
>> bytes instead of 3 x 512bytes
>
> Because the file occupies 2 x 1024-byte blocks.
>
>> I note both use fstat().
>
> stat(), fstat() etc, and thus du, report disk usage in multiples of
> 512-byte blocks, as that was the block size on the earliest Unix
> systems. The actual block size depends upon the filesystem.
>
> The st_size field indicates the actual size of the file (i.e. the
> number of bytes which it contains); this is the value reported by ls.
>
> The st_blocks field returns the disk usage in multiples of 512 bytes;
> this is the value reported by du.
>
> Note that the actual size of the file can be more than 512 * st_blocks
> bytes if the file contains "holes". These are blocks which are
> implicitly filled with zeros when the file is enlarged by lseek(),
> ftruncate() etc, and aren't actually stored on disk.


Glynn, why lseek() will fill space with zeros if it's placed in a position 
beyond file limit itself? To provide to the application a fixed size of 
data for one purpose and so on.

Example, an application will use first 1025k of a file for something, then 
the next 2048 fo another, is this the intention of lseek() ?

Please, adivse,

Thanks,

fabio

