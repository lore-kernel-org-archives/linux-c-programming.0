From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: code to list contents of zip files
Date: Wed, 21 Oct 2009 19:52:01 +0100
Message-ID: <19167.22609.946075.575192@cerise.gclements.plus.com>
References: <4ADDADEE.1060806@sun.com>
	<19165.47003.922855.202636@cerise.gclements.plus.com>
	<4ADEFDE3.9000303@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4ADEFDE3.9000303@sun.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Cc: linux-c-programming@vger.kernel.org, aluink@gmail.com


Prasanta Sadhukhan wrote:

> I have tried to create a ziptest code with the information found but 
> when I tried to inflate the contents by calling inflate() [line68], I am 
> getting Z_DATA_ERROR citing  input data is corrupted or not conforming 
> to zlib format but I can do zipinfo or unzip on the attached ziptest.zip 
> file successfully (and also the zip header is found to be valid by the 
> header validity check done in the program)
> Can anyone point me as to what should I being more to get rid of this 
> problem?

I've found 3 flaws:

1. You're not skipping over the variable-length fields (file name and
extra field) at the end of the header; add:

	fseek(file, SH(&h[LOCFIL]), SEEK_CUR);
	fseek(file, SH(&h[LOCEXT]), SEEK_CUR);

after reading the header but before calling inf().

2. You're trying to inflate() everything up to end-of-file, when you
should be using the compressed length from the header (LOCSIZ) to
determine how much compressed data is available (even with only one
file, the central directory occurs at the end of the file).

3. This one wasn't obvious until I looked at the unzip source code. 
You need to call inflateInit2(&strm, -15) rather than inflateInit(),
in order to have it process "raw" data. zlib.h says:

     windowBits can also be -8..-15 for raw inflate. In this case, -windowBits
   determines the window size. inflate() will then process raw deflate data,
   not looking for a zlib or gzip header, not generating a check value, and not
   looking for any check values for comparison at the end of the stream. This
   is for use with other formats that use the deflate compressed data format
   such as zip. ...

IOW, inflateInit() expects the data to be "wrapped" with a zlib or
gzip header and trailer, but ZIP files don't have these.

After fixing the above issues, I get C source code on stdout.

-- 
Glynn Clements <glynn@gclements.plus.com>
