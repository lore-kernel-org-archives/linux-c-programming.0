From: "Daniel." <danielhilst@gmail.com>
Subject: How to check if char pointer is a constant!?
Date: Thu, 7 Jul 2016 16:40:56 -0300
Message-ID: <CAF3SDA6G32Kub4rK5BSmx7TkWoXnGWW2ESyHnM_+3t-naVPDww@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=mHM93jtryRJM8O7361EED/92M5+vXTeUlRp4zgnaXeU=;
        b=bmxsza7LumLpB5VYp4Xunr9LJ0kiAiDIOVCI0YQtS7b7sIDIeumTXaqym9/vLkXX+0
         OBVzdKJdtSuEpk+WEkIEVm6qmQbj04gyl4veG0LcilY2N1Ty6Fs/Op+3lMtPJsdx21BF
         tqUqu03zcurYvCDPA8o2nrC2lvwZUV2ZinUVGIXM729A7NF3tYQYUxkFDPGlvMD317Cf
         1uRtEEts+n3xD1Xu/EEioXlJPpI2EW3kqXMK8eoGMyl/9NSwvnMZ5B72iW7ULbB6WIfx
         iNikaxKxa0sE4sFs+56+RS0Tj+DOa9aA5v1z5xAKVAzEcAwMXED9Ida3pfsnE//8MbNV
         Fopg==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hi everybody,

I have some function, say
void empty(char *p) { p[0] = '\0'; }

If I call it like this empty("Hello") it will segfaults since "Hello"
is put in readonly section of the program. Is there a way to check for
this?! Maybe some nasty gcc extension!?

Regards,

-- 
"Do or do not. There is no try"
  Yoda Master
