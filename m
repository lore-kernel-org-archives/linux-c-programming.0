From: Zebedee Mason <zeb@cyclerouter.co.uk>
Subject: Dependency analysis
Date: Sun, 26 Jun 2016 22:34:24 +0100 (BST)
Message-ID: <734731394.6390.64dcef3f-4987-4623-aa6b-0db154f6fc22.open-xchange@email.1and1.co.uk>
References: <1881343697.95404.21109858-706e-4993-a212-7b528d95a986.open-xchange@email.1and1.co.uk>
 <1035222128.24805.b5dc72c3-a052-479c-bfed-f96deb38a264.open-xchange@email.1and1.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1035222128.24805.b5dc72c3-a052-479c-bfed-f96deb38a264.open-xchange@email.1and1.co.uk>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello

I was originally posting to linux-doc, this list seems to be a better fit. So
apologies if you've seen this before.

I've written some software to do dependency analysis. It works by parsing the
output from "make V=1" to extract the relevant include directories before
parsing the source and recursing through the header files. The files are
initially placed in a hierarchy based on the directory structure, obviously the
include directory then causes a circular dependency at a high level so I've
attempted to map the include files into the appropriate source directory. Badly,
as my knowledge of which precise mapping to use is limited.

The html output from Doxygen for the 4.6 kernel is at
http://www.cyclerouter.co.uk/linux/_architecture.html

The source code of the tool is at https://github.com/zebmason/itdepends

The article that accompanies the tool is at
http://www.codeproject.com/Articles/1098935/As-Is-Software-Architecture

HTH

Zeb
