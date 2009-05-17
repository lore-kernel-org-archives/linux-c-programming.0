From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: How to lseek the larger file > 2GB under linux
Date: Sun, 17 May 2009 21:09:12 +0100
Message-ID: <18960.28392.727126.486002@cerise.gclements.plus.com>
References: <d13fb4990905170840j6ac84b0ej758582e5ffb5fa8c@mail.gmail.com>
	<d13fb4990905170842l5f700842k43db34f44ef2f829@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <d13fb4990905170842l5f700842k43db34f44ef2f829@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicle <ynicle@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Nicle wrote:

>  I have a file > 2GB, and my job is seeking the file to pos: 2.1G.
> But, it seems that the lseek64 doesn't work.
> Here is the sample code:

[snip]

The following complete program works fine for me:

----------------------------------------------------------------------
#define _LARGEFILE64_SOURCE
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define FILENAME "test.dat"

int main(void)
{
    int fd = -1;
    long long pos = (long long) 2*1024*1024*1024 + 10;

    fd = open(FILENAME, O_CREAT|O_WRONLY|O_LARGEFILE, 0666);
    if (fd < 0) {
	perror("open");
	return 1;
    }

    if (lseek64(fd, pos, SEEK_SET) < 0) {
	fprintf(stderr, "Failed seeking to %lld, %s\n", pos, strerror(errno));
	return 1;
    }

    return 0;
}
----------------------------------------------------------------------

In general, you should post complete programs which can be compiled
without needing to "fill in the blanks", as the problem may lie in
something which was omitted.

> The return val of lseek64  was "<0", but the strerror told me "Success".

The return value is an off64_t; ensure that it isn't being truncated
to an int, because that will result in a negative value.
 
In the above, the 0 on the RHS of the comparison should be promoted to
an off64_t automatically (if it isn't, that's a bug in the compiler).

-- 
Glynn Clements <glynn@gclements.plus.com>
