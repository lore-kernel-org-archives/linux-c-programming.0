From: Manaswini Sawant <manaswini@gmail.com>
Subject: using one library within another
Date: Tue, 17 May 2005 12:58:15 -0700
Message-ID: <428A4CD7.9080101@gmail.com>
Reply-To: manaswini@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
Sender: linux-gcc-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org, linux-gcc@vger.kernel.org

I have libP.so (source and all) and libQ.so (no such luck).
libP redefines some standard libc functionality.
I need to link libQ.so and the object files for libP.so to form one
common libPQ.so.

Now I would like libP object files to use stuff found within libQ.so
but would like libQ.so to use the standard libc functions instead of
using the redefined libP ones.

When I mash them together into libPQ.so, libP calls the libQ functions
as required but libQ calls the libP versions instead of the standard
libc ones.

Is this possible? Are there some ld flags that can do this?
Thanks in advance,
~Manaswini.
