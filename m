From: KhaOsh <ficheironegro@gmail.com>
Subject: String comparison for fixed strings
Date: Wed, 15 Aug 2007 12:06:24 +0100
Message-ID: <9870a8150708150406x6297b877u473bfbbc62949f10@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        b=gRMAlg8f1ZL8sDkfmnYdduzoGAnglHWzZTWE+aQiWyRW5DvZwwiPKTuauoVCp7FhTE4rL2M2JBZ/g3c8RHZvFhNPSe+ITNu4PmxOMf55EBu+e4p7hbVen7CRr+5AzS9rVu5T/qsw0sYFlSb5BCOHxcqXUeScixJBRryOiWUo5c4=
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello everyone,

In terms of speed what the fastest way of doing a strings comparison
on fixed strings? Using one of those strcmp() functions or doing the
following:

(Pseudo code)
"if (s[0] == 0xa && s[1] == 0xb && s[2] == 0xc)" (etc)
or
"if (s[0] == 'A' && s[1] == 'B' && s[2[ == 'C')" (etc)

Thanks for your help.
