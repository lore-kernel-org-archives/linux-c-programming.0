From: Randi Botse <nightdecoder@gmail.com>
Subject: Byte ordering
Date: Fri, 4 Sep 2009 19:04:49 +0700
Message-ID: <34e1241d0909040504l7a60b9d6xe5daaf2f53658824@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=c2z2zOVZZwhOfPCXY7c4/0QHrvzWotb4Kk5gAUksebM=;
        b=wlRQ2QsSnKbba7xhTyIdfKf0ca6VeTYENKsJ9tVztG3BlaoNwarEgUtJbW1B9unr+m
         L0bOSH+6tLT618wSVtRf/LgPQP/2GF3HR3Mqt2xexIzFQP3qRD+Rk+jVGuJrGCrCPLNP
         djkuNZ788PkKisXKOFzv7Lc30m3Jq9VEGUINk=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi all,

Given some codes:

...
unsigned int val = 0x0a0b0c0d;
unsigned char *str;

str = (unsigned char *) &val;
printf("%.2x %.2x %.2x %.2x\n", *str, *(str + 1), *(str + 2), *(str + 3));
...

the output is  " 0d 0c 0b 0a "

the given codes try to divide a 32 bit integer into it's 8 bit nibbles.
with bit shifting and masking ( that you all teach me.... thanks u ;)
) i can get it correctly:

printf("%.2x %.2x %.2x %.2x\n", val >> 24 & 0xff, val >> 16 & 0xff,
val >> 8 & 0xff, val & 0xff));  /* 0a 0b 0c 0d */

but when address it with pointer to character i got it reversed, could
you please explain me why pointer to character reverse the ordering?
if what i need is only to reverse the ordering (pointer to character
index) to get a valid order? and if this a valid method?

              - Randi
