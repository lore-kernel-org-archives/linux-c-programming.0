From: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Subject: ioperm() and setuid()
Date: Mon, 13 Oct 2003 08:02:25 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F89EB91.7070509@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello,

Does anyone know how to allow non root users in linux to
access to i/o ports using ioperm() and setuid().

I tried using the ioperm() function and setuid() but i still
get a message of permission access denied.

Can anyone help me on this?

Lejanson

