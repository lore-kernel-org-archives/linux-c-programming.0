From: Alina Valea <avalea@home.ro>
Subject: include structure analyzer
Date: 3 Oct 2002 06:24:41 -0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021003062441.19087.qmail@relay1.home.ro>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org



Hello everybody,

I would need something like this: given a filename (be it a
.c or a .h file), obtain a graph of the files it includes.

Example : header.h / \ / \ header1.h header2.h / \ | / \ |
header11.h header12.h header21.h

or

source.c / \ / \ header1.h header2.h / \ | / \ | header11.h
header12.h header21.h

Does anybody know of such a tool?

Thanks, Alina


----

Home, no matter how far...
http://www.home.ro
