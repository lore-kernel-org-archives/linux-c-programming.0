From: Scott <drmemory@3rivers.net>
Subject: Into the Void
Date: Tue, 25 Jan 2005 17:09:10 -0700
Message-ID: <20050126000910.GC888@drmemory.local>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Years ago, I learned this trick from somebody in the C/C++ Journal, or
whatever that rag was called:

           memcpy(*data_buf,bp,len)[len] = '\0';

I get the following error:

indatax.c: In function `read_datum':
indatax.c:374: warning: dereferencing `void *' pointer
indatax.c:374: invalid use of void expression

and if I cast the function:

           (char *) memcpy(*data_buf,bp,len)[len] = '\0';

I get:

indatax.c: In function `read_datum':
indatax.c:374: warning: dereferencing `void *' pointer
indatax.c:374: void value not ignored as it ought to be

What aren't I understanding here? Tell me to go away if these
questions are too elementary for the list....
