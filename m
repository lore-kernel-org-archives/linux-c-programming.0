From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: mcrypt ?
Date: Tue, 21 May 2002 15:28:01 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15594.22897.778388.25242@cerise.nosuchdomain.co.uk>
References: <012101c200c6$94f7fd40$0cfea8c0@ezdsp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <012101c200c6$94f7fd40$0cfea8c0@ezdsp.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Stevenson <mistral@stev.org>
Cc: linux-c-programming@vger.kernel.org


James Stevenson wrote:

> is there such a function in a linux c libary
> for the md5 crypt the same as crypt() but
> for the more modern shadow passwords
> 
> if so.
> which libary ?

The "crypt" add-on for glibc 2.x supports MD5 password hashes, as well
as DES. The details are in the "libc" Info file (search for "crypt").

-- 
Glynn Clements <glynn.clements@virgin.net>
