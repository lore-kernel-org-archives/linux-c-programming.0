From: Tyler <tyler@agat.net>
Subject: pthread library
Date: Thu, 10 Mar 2005 23:38:19 +0100
Message-ID: <d0qi7v$e9a$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi,

I have a little question about the pthread library under linux.
For example, we have a thread A and a thread B.
If A do a read (which is a blocking operation), all the process will be 
blocked so thread B will be blocked too.
That's true ?:)

