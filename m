From: HIToC <hitoc_mail@yahoo.it>
Subject: getdate(3) - format date
Date: Thu, 21 Sep 2006 22:36:45 +0200
Message-ID: <200609212236.46183.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello list,
I am using the getdate(3) function to convert a string date in its tm structure, but
I have tried several formats of string-dates and it always returns a NULL pointer.

All this dates I suppose invalid for the getdate(3):
Fri, 19 Nov 82 16:14:55 EST
Wed, 20 Sep 2006 15:03:53 GMT
Thu, 21 Sep 2006 08:59:25 +0400
19 Sep 2006 15:52:25 -0700
19 Sep 2006 15:52:25 EST

Do you know what are the correct string formats for this function and if under
Unix there are routines to read ascii string dates such in mail text messages
or USENET articles?

Thank you in advance
HIToC
-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
