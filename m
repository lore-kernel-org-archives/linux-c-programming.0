From: Randi Botse <nightdecoder@gmail.com>
Subject: Pointer to a char
Date: Tue, 18 Sep 2012 16:29:32 +0700
Message-ID: <CAA6iF_7=j6J+wOyYcQgwvSO1dG92kVNcJcYXFY7BiiRZ4d0UKQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=+aP/NWLKLGa1NgH0xdWpeQ4bTNSKdYUXqg7WLPLMnyw=;
        b=wOo98UT2V01zPdVEUUueelbDqWDI/8qR1N7+Y4lMx4NUVek2I8Noogck9UpR3mjJy/
         +5zvzs04lpXQXebLdilpkvukuYWKfpujzb0KiylhmriF1h4W7/B6c1VpLMbvXXZJbo8f
         5vaIo0PphtDRQk2AAfx8U3zQlDoUGerxLyjmJw9/6j/WaUFK0cMaN6Lbe9qhCHbhe/fv
         PlMIRYuc6h1MFjzw8fmp2UUmVWfmUoI1D1X+qFPXNuOkufRngeRdMyWbUlCzQ2lF1wRS
         MFCDcqeYOBl6v4BLWdj/U18P7A2XPDPaMt2WEC3GKQg7lM2D/S9HIOU/jEgKBbH16EVa
         9HVw==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Hi, having coding in C for 3 years but I'm still not clear with this one.
Consider this code.

...
char *p;
unsigned int i = 0xcccccccc;
unsigned int j;

p = (char *)  &i;
printf("%.2x %.2x %.2x %.2x\n", *p, p[1], p[2], p[3]);

memcpy(&j, p, sizeof(unsigned int));
printf("%x\n", j);
...

Output:

ffffffcc ffffffcc ffffffcc ffffffcc
0xcccccccc


My questions are:

1. Why it prints "ffffffcc ffffffcc ffffffcc ffffffcc"? (if p is
unsigned char* then it will print correctly "cc cc cc cc")
2. Why pointer to char p copied to j correctly, why not every member
in p overflow? since it is a signed char.

Regards.
