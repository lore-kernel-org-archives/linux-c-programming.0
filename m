From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: How to open a large file
Date: Thu, 4 Nov 2004 04:21:27 +0000
Message-ID: <16777.44615.169966.493800@cerise.gclements.plus.com>
References: <cm6pue$p7n$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <cm6pue$p7n$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zhc <zhenghongchao@hotmail.com>
Cc: linux-c-programming@vger.kernel.org


zhc wrote:

> How to open and creat a big file over 2 GB in linux with c language. I 
> have tried open() with O_LARGEFILE option in it, but the program 
> couldn't be compiled successfully. Are there other ways to solve the 
> problem?

You have to define _LARGEFILE_SOURCE in order for the O_LARGEFILE flag
to be defined, i.e. "gcc -D_LARGEFILE_SOURCE ...".

If you only need to perform sequential access, that macro is all that
you need.

However, if you wish to be able to perform random access (e.g. 
lseek()), you will need to use 64-bit file offsets, so you also need
to define _LARGEFILE64_SOURCE. That macro will enable the off64_t type
and 64-bit versions of various functions (open64, lseek64 etc).

One further macro, _FILE_OFFSET_BITS, determines whether off_t and the
common I/O functions (open, lseek etc) are the 64-bit versions (i.e. 
off64_t, open64, lseek64) or the normal versions.

Adding -D_FILE_OFFSET_BITS=64 to the compilation switches will result
in off_t, open, lseek etc all being the 64-bit versions. The code will
automatically handle large files.

One final note: if your code supports large files, you must take care
when passing file descriptors or file offsets to libraries. If they
weren't compiled with those options, they will be expecting file
offsets to fit into 32 bits, and may fail if you pass them a
descriptor or stream (FILE*) which refers to a file which is larger
than 2Gb. This is why the default behaviour of open(), fopen() etc is
to fail if the file is larger than 2Gb.

-- 
Glynn Clements <glynn@gclements.plus.com>
