From: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Subject: Re[2]: Misc C question
Date: Thu, 20 Jun 2002 11:51:58 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4512499703.20020620115158@kgpa.ru>
References: <Pine.LNX.4.33.0206201333470.26820-100000@soochak.ncst.ernet.in>
Reply-To: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0206201333470.26820-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org
Cc: Mohammed Khalid Ansari <khalid@ncst.ernet.in>

Hello Mohammed,

Thursday, June 20, 2002, 11:05:58 AM, you wrote:



MKA> The simple C function is

MKA>         int access(const char *pathname, int mode);

MKA> to suit you needs. Read man pages to find out more.

access() isn't so useful as stat() because access() use real user ID
and real group ID, instead of EUID and EGID.

But You are right - for checking for existense of file access()
function is simpler than stat() or lstat().

Best regards, Oleg O. Ossovitskii
programming engineer, KGPA Ltd.
tel: +7(0112)46-23-40, fax: +7(0112)43-64-96
mailto:oleg@kgpa.ru, icq# 33366588

