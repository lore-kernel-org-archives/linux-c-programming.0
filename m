From: Shriramana Sharma <samjnaa@gmail.com>
Subject: How to create separate files with debug information?
Date: Mon, 16 Apr 2007 09:39:38 +0530
Message-ID: <4622F702.6000301@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

When we strip a file, we remove any debug information from it. This is 
done to reduce the size of the file.

I have seen package managers provide separate files with debug 
information. For instance, I have a libQtGui.so.4.2.3.debug file 55 MB 
in size separate from the libQtGui.so.4.2.3 file which is 7 MB in size.

Now the questions:

First: Is this kind of providing separate debug files applicable only 
for library or also for applications?

Second: How do I create such .debug files with debug information only? I 
find that these debug files are not executables.

Thank you.

Shriramana Sharma.
