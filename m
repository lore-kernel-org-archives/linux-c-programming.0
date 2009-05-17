From: Nicle <ynicle@gmail.com>
Subject: Re: How to lseek the larger file > 2GB under linux
Date: Sun, 17 May 2009 23:42:23 +0800
Message-ID: <d13fb4990905170842l5f700842k43db34f44ef2f829@mail.gmail.com>
References: <d13fb4990905170840j6ac84b0ej758582e5ffb5fa8c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=bx12oRORT0BGL2UcZXc9nNPQXPHBBZSZWOpzbCYSVyY=;
        b=h379ORL5evGWcKnkb1jFP1BDcnZ0JrBF6xA5dNmhwbHbHgLdy0d7WJ8vqJSxAnPH1V
         xj2UJyMSfzArvrhriKW5GzGylgiCqyXpFghS2IiOofAA/lVGdPZJN8Efsg6Sno7xSVTp
         xkKc7EhpqpQO3dWxHKYELJBY6LZ1Fdxk8NJ+o=
In-Reply-To: <d13fb4990905170840j6ac84b0ej758582e5ffb5fa8c@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all,

 I have a file > 2GB, and my job is seeking the file to pos: 2.1G.
But, it seems that the lseek64 doesn't work.
Here is the sample code:

#define _LARGEFILE64_SOURCE
#include ...

int main()
{
 int fd = -1;
 long long pos = (long long) 2*1024*1024*1024 + 10; // over 2G

 fd = open(FILENAME, O_WRONLY|O_LARGEFILE);
 if (fd < 0){
   ...
 }

 if (lseek64(fd, pos, SEEK_SET) < 0) {
     fprintf(stderr, "Failed seeking to %lld, %s\n", pos, strerror(errno));
 }

 return 0;
}

 Then the building cmd:
    gcc -o test test.c -D_FILE_OFFSET_BITS=64

 Output:
    Failed seeking to 2147483658, Success.

The return val of lseek64  was "<0", but the strerror told me "Success".
