From: Randi Botse <nightdecoder@gmail.com>
Subject: Problem with scatter/gather IO
Date: Wed, 13 Jul 2011 18:54:45 +0700
Message-ID: <CAA6iF_6Y4VbHSKnNMYhAhTjf=ZoQZxwO+nqYPmV=R5=6c=KKiQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=ngRULbSJM66cT817+3M/w+6KxlbjPDgdROizbgfCLlI=;
        b=D7zlWsaEZiLh3DRynQB0o18fxm33IEiC90vMkuLKhTIlLInbWaN78vYYrTWWaRZP66
         yg33qfh0aKWv4PCf8ttSXMY2Tch7KNWTBVBjjdDDXHljBRfwaUNqtijEWcBrTrxQ7jtg
         5tEqfkwjKdGb00Iy1a0NOSuUb5FLtPnYLZcI4=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: night decoder <nightdecoder@gmail.com>

Hi,

I will read/write file with readv() and writev(), I have problem to
use that since the struct iovec will be a variable-length array, if i
have code.

struct foo {
    unsigned char data[100];
    unsigned char another_data[28];
};
unsigned len;
....

/* calculate len */
/* use len as array's member size */
struct iovec iov[len];
printf("len is: %i\n", len);
readv(fd, iov, len);

I got: BAD ADDRESS, and if I remove the printf() then I will get
INVALID ARGUMENT. What the possible problem with that?

Thanks,
