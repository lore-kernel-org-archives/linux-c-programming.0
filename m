From: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Subject: How does malloc tell the kernel to allocate more memory?
Date: Sun, 8 Dec 2002 12:46:57 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000301c29eea$3107dd10$032a1c43@joe>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming <linux-c-programming@vger.kernel.org>, Linux Newbie <linux-newbie@vger.kernel.org>

I'm trying to write a tracer on memory allocation, and I'm having a little
trouble figuring this out.

At some point, malloc has to call the kernel to tell it to allocate more
memory for this user process, right?  I can't figure out which function
malloc calls, or where in the code (line number) it's called.

I'm looking at glib-2.3.1 to try and find my answers.  After all, that's
where malloc is defined, right?

TIA.

Joseph Wagner

