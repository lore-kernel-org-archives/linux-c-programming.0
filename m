From: "Task Struct From Hell" <taskstructfromhell@googlemail.com>
Subject: c preprocessor expansion
Date: Thu, 8 Jan 2009 17:49:09 +0000
Message-ID: <ef37ea20901080949i2cd875fbk58b4ae3605655812@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=Cr4JXfh1XQgkgW031M6XB6cwQjt+uVDwplEro0U5W9U=;
        b=a0EMX6HIt6CAPeTXuoWAdOofVp+T+ju3UB7EVeoUT2yn46nSzFEA3meA4RF0aaZD5b
         svkkbKrCAKGPApNjkfIr873MSScIikJPTY2iNF+mOjFGdWqcpNsKhxxfXhGjdl4tsNDk
         hrgypWvi+e696jW5/2t6Gym0FlNYHu9RKoIAo=
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

I was wondering if gcc has any argument which allows for the expansion
of all macros in a file, just so if we have something like the
following:


#define FOO "bar"

int main() {
   printf(FOO);
}

It will output this:

int main() {
   printf("bar");
}

Thanks,
TSFH
