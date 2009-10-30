From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: code to list contents of zip files
Date: Fri, 30 Oct 2009 02:30:07 +0000
Message-ID: <19178.20399.326515.377343@cerise.gclements.plus.com>
References: <4ADDADEE.1060806@sun.com>
	<19165.47003.922855.202636@cerise.gclements.plus.com>
	<4ADEFDE3.9000303@sun.com>
	<19167.22609.946075.575192@cerise.gclements.plus.com>
	<4AE04FD0.9080603@sun.com>
	<4AE94373.8020702@sun.com>
	<4AE96180.8000807@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4AE96180.8000807@sun.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Prasanta Sadhukhan wrote:

> Is it possible to output the content of a particular file from a zip file?
> For example, in the attached ziptest.c I want to get the contents of a 
> particular file Class3.class from testclasses.zip into a buffer, can 
> anyone point out what I need to change in the code?

Iterate over the files until you find the right one. Either start by
locating the first local file header, then each subsequent one, or
locate the central directory and iterate over the file headers which
are stored there.

For the first method, given the offset of one local file header, the
next one should be located 30 + "file name length" + "extra field length"
+ "compressed size" + 12 bytes further on.

For the second method, the offset from one entry to the next is
46 + "file name length" + "extra field length" + "file comment length".

The start of the central directory can be found from the end of
central directory record, which is at the end of the file. The length
is variable, so you have to scan backwards for the signature (50 4b 05
06), then verify that the offset is 22 + "ZIP file comment length"
bytes before the end of the file).

-- 
Glynn Clements <glynn@gclements.plus.com>
