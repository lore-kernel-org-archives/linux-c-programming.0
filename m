From: Randi Botse <nightdecoder@gmail.com>
Subject: malloc question
Date: Tue, 26 Apr 2011 17:33:50 +0700
Message-ID: <BANLkTik1ZqN2cOqu65f380wfgOHQpwX7gg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=UmwNKDtfkFy6ExMDtWO6/E0wOgENabOa+qmGBzWyW9g=;
        b=fETv2Uewqs6nPd8whbQmHrSxqEiqKV7XYdnIZ2MIzPRbUas+TxOB/r7F1MDKyFohin
         w17Na6uk53poWOKd0cLLSAhvU4p0HMDH8BWrV2Ma83j0ws/thQco4MIaWxAHLAlhyIfK
         bl0k+LlWqhxiPEkdhOBOWbs9TKuXkp+OBuv6I=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi All,

I want to ask malloc() behaviour, consider these codes;

...
char *ptr = malloc(1);
strcpy(ptr, "what");
puts(ptr);
....

Confusingly, the strcpy() copied all bytes to ptr, but I just manage
to allocate ptr only for 1 byte, I guess I will have segfault here,
why this happen? why the string successfully copied into ptr? , is
those code legal?

Randi,
