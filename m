From: LDB <thesource@ldb-jab.org>
Subject: Re: How to lseek the larger file > 2GB under linux
Date: Sun, 17 May 2009 14:10:50 -0400
Message-ID: <4A10532A.60500@master.ldb-jab.org>
References: <d13fb4990905170840j6ac84b0ej758582e5ffb5fa8c@mail.gmail.com> <d13fb4990905170842l5f700842k43db34f44ef2f829@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ldb-jab.org; h=
	content-transfer-encoding:content-type:in-reply-to:references
	:subject:mime-version:user-agent:from:date:message-id:received
	:received:x-virus-scanned; s=200904; t=1242583846; x=1244398246;
	 bh=ZebdA1Zq30pEsmLB6Tf52r8NN3Ba6WCF06CXcYmoDB4=; b=OdTSWvU8GZT/
	QAyNwh5m+OuDhx7POTBXCAxygwEnisy8wX6B9IyeFa7Y8ZgfUiY25AWTbtV9mMyu
	QuhdSoZMgFLvxt76q1+c9i9wcgAu7PZv0aFF+ug1Ry2nsKdxfjZhFk8ytBcArgEm
	ThZbesFJSc7oKcHNchtIbasRbYe/TGA=
In-Reply-To: <d13fb4990905170842l5f700842k43db34f44ef2f829@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicle <ynicle@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Nicle wrote:
> Hi all,
> 
>  I have a file > 2GB, and my job is seeking the file to pos: 2.1G.
> But, it seems that the lseek64 doesn't work.
> Here is the sample code:
> 
> #define _LARGEFILE64_SOURCE
> #include ...
> 
> int main()
> {
>  int fd = -1;
>  long long pos = (long long) 2*1024*1024*1024 + 10; // over 2G
> 
>  fd = open(FILENAME, O_WRONLY|O_LARGEFILE);
>  if (fd < 0){
>    ...
>  }
> 
>  if (lseek64(fd, pos, SEEK_SET) < 0) {
>      fprintf(stderr, "Failed seeking to %lld, %s\n", pos, strerror(errno));
>  }
> 
>  return 0;
> }
> 
>  Then the building cmd:
>     gcc -o test test.c -D_FILE_OFFSET_BITS=64
> 
>  Output:
>     Failed seeking to 2147483658, Success.
> 
> The return val of lseek64  was "<0", but the strerror told me "Success".
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 



I changed the below a little, but when I seeked to 2.1GB,
it worked fine. I am not writing like you, but reading.

#define _LARGEFILE64_SOURCE

#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/stat.h>
#include <fcntl.h>

int main()
{
 int fd, ret;
 size_t count = 200;
 long long pos = (long long) 2*1024*1024*1024 + 10; // over 2G
 char buf[count];

 fd = open("/tmp/fish", O_RDONLY|O_LARGEFILE);
 if (fd < 0){
   fprintf(stderr, "%s\n", strerror(errno));
   exit(1);
 }

 if (lseek64(fd, pos, SEEK_SET) < 0) {
   fprintf(stderr, "Failed seeking to %lld, %s\n", pos, strerror(errno));
   exit(1);
 }

 if ((ret = read(fd, buf, count)) < 0) {
   fprintf(stderr, "Failed reading: %s\n", strerror(errno));
   exit(1);
 }

 buf[ret] = 0x00;
 printf("%s\n", buf);

 close(fd);

 return 0;
}
