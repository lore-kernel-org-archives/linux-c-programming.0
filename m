From: "Saurabh Sehgal" <saurabh.r.s@gmail.com>
Subject: EAGAIN with read
Date: Thu, 6 Dec 2007 15:14:44 -0500
Message-ID: <2a46ebd60712061214p2febc3d0pbe4fd688911356f7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=1nUrtKHSVP/GNFaT0DnBZSi7Jmkp5VtGf3AZq+ssxDk=;
        b=b+/puSvriuDSOo7AEkEOrstYJd10DlTrq+/aKwQ/lP6eRLdWPr/9/GFVV7DeZWdSgOFDlobEwyihZfM6F2toxCc8/Llm+mP0cObM0o6m0YkF0eQ44RLUl2q1ejSHYZlu6FWrxCn3hPzowyMKDSAYypL1HVH3Xst7oSzW9wfvoJo=
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

I had a basic question about read . I have a file descriptor marked
with non blocking I/O , and I want to read data from the file
descriptor. This file descriptor is the read end of a UNIX pipe.

 The process that the pipe reads from is a very slow process. Hence I
need to poll  and keep on trying to read from the fd until the process
has actually written something to the pipe. I execute read while the
errno condition EAGAIN is true. Will this ever result in an infinite
loop ? (lets say the remote process dies and doesnt write anything to
the pipe, will I go into an infinite loop since I am polling while
EAGAIN is true ?).

Any help is appreciated. Thank you.

-- S
