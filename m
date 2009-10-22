From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: code to list contents of zip files
Date: Thu, 22 Oct 2009 16:13:34 +0100
Message-ID: <19168.30366.20711.935782@cerise.gclements.plus.com>
References: <4ADDADEE.1060806@sun.com>
	<19165.47003.922855.202636@cerise.gclements.plus.com>
	<4ADEFDE3.9000303@sun.com>
	<19167.22609.946075.575192@cerise.gclements.plus.com>
	<4AE04FD0.9080603@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4AE04FD0.9080603@sun.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Cc: linux-c-programming@vger.kernel.org, aluink@gmail.com


Prasanta Sadhukhan wrote:

> I tried to rectify the flaw and now I am getting the whole file contents 
> from the zip file, ie., it is outputting the contents of the file stored 
> in the zipfile.
> But Actually, I wanted only to list the content of the zip file as 
> zipinfo does.

In which case, rather than inflating the data, just skip the number of
bytes indicated by the compressed size field (LOCSIZ), and you should
find a data descriptor, then another header (not necessarily another
local file header; the last file will be followed by a central
directory header).

But for listing, you're probably better off just listing the central
directory, which is found at the end of the file.

This will work even if there is other data at the beginning of the
file (e.g. self-extracting EXEs have the EXE portion at the beginning
of the file and the ZIP data at the end).

I found the unzip source code to be rather messy, due to all of the
platform-specific sections. You might be better off referring to the
format specification at:

http://www.pkware.com/documents/casestudies/APPNOTE.TXT

-- 
Glynn Clements <glynn@gclements.plus.com>
