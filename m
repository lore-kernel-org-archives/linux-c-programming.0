From: Jeff.Fellin@rflelect.com
Subject: Re: Into the Void
Date: Wed, 26 Jan 2005 08:45:09 -0500
Message-ID: <OFCBCF8B9A.C4F17DCE-ON85256F95.004B650B@teal.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drmemory@3rivers.net
Cc: linux-c-programming@vger.kernel.org, linux-c-programming-owner@vger.kernel.org


The reason you are getting the references to void is the function prototype
for memcpy is:

      memcpy (void *dest, void *src, size_t n);

You are passing char* pointers which are not void * pointers. You have to
correct your arguments
to remove the error messages. Please use man memcpy() for more details.


Jeff Fellin
RFL Electronics
Jeff.Fellin@rflelect.com
973 334-3100, x 327

