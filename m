From: Randi Botse <nightdecoder@gmail.com>
Subject: String formatting in signal handler
Date: Sat, 20 Oct 2012 22:03:49 +0700
Message-ID: <CAA6iF_48vgd8Shu-49w-3mJMSi-5eMbVGFFER5RYEkKKCkv3Nw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=IGv/4YI4qwcMf8fkKm74eugqCjlRQHDu5JNBsqu6a6I=;
        b=GmHGdOT6UFeaKquY9PVuYO71gChOK1A4E2q4ooDklHXeoHENvoZ+DMt+7gSYxU0nan
         uXOR4r7CnNTzWkWFGhLgRJyDFt/ENXTMMr+1CZKcPuaqMpXiY+ywBjcubPdNvKs6d9n5
         lKDhl7uZ5adTmaJZ9XqYLHq0txTZFLKPHprp2KUo6wxC9m+da5dCocluYbiB+DVjkyyh
         XtrdRceSnKYhxfZrBxbj0xyblnADuPx9Tletewi0wnGjqBHBgILXPQOfNYqB0F3p2gzS
         nKszM1XDKVqSRY6czIb1GXuItQYnjORA7cyI9A4wMUXqyBkckp89x80PEHTml+JSCs85
         k0MQ==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi List,

Almost (maybe all) function from the standard library stdio.h and
string.h are not safely to be called by signal handler. If so, how to
format string in a signal handler?. I want to log some signals which
sent to my program, the contents is for example: time, the signal
number itself, etc, and then write it to a file.

Regards.
