From: Randi Botse <nightdecoder@gmail.com>
Subject: Division in loop
Date: Tue, 8 Sep 2009 21:40:30 +0700
Message-ID: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=7ROgA7++j6FwBP4MPHWRSybW2mXVribSdmkJbcjIDu4=;
        b=fTQVTe7zeDoPowh3YQimIPYskGRd10U/h/Tt/JMT4Ly7LlxtdN9JsrQzgDW97ziY2s
         n8VC1sC1o4L9CqPN1Dwy4UJv/IUJ0h9KHRZIOGqYvrpS5hb1wvB1bOclD67TCEXUV7jV
         xBjFEuvFezUbSpFxzX3X9H6faMG5CaqmOvru4=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

hi all,

....
int fd, fdp;
unsigned int size;
int progress = 0;
size_t bytes = 0;
void *buffer;
....

/* open fd from a device then create fdp, allocate buffer,, etc. */

while (bytes < size) {
        ret = read(fd, buffer + bytes, size - bytes);
        if (ret == -1) {
            perror("read");
            return -1;
        }
        ret = write(fdp, buffer + bytes, ret);
        if (ret == -1) {
            perror("write");
            return -1;
        }
        bytes += ret;

        progress = (int) ((bytes / size) * 100);
        printf("\rcompleted: %i%%", progress);
        fflush(stdout);
    }

....

I run this loop to receive some data, the printf() seem not updated,
the progress output is
always in it's initial value until the loop was finished. but when i do...

progress = (int) ((bytes / 2) * 100); /* change size to 2 (or random number) */

then it's works... what's wrong here???
