From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Problem in accessing executable files
Date: Mon, 7 Feb 2005 18:31:24 +0000
Message-ID: <16903.46076.277968.721463@gargle.gargle.HOWL>
References: <20050206224101.B1F71B6CB@xprdmailfe15.nwk.excite.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050206224101.B1F71B6CB@xprdmailfe15.nwk.excite.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vintya@excite.com
Cc: jtwilliams@vt.edu, linux-c-programming@vger.kernel.org


Vineet Joglekar wrote:

> Thanks for suggesting the single / few bytes encryption test. I tried
> doing that, but in vain. Maybe I am going wrong somewhere else.

I'm pretty sure that mmap'ed access doesn't go through
do_generic_file_read().

Executable files (programs and shared libraries) are normally mmap'ed
rather than read, which would explain why you have problems with
executable files.

Try writing a test program which reads the contents of a file using
mmap() rather than read(). If my assumption is correct, the decryption
code will be bypassed, so you will get the encrypted data.

-- 
Glynn Clements <glynn@gclements.plus.com>
