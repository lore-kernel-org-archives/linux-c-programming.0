From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Can I allocate few bytes in a file to store info about that file; not visible to user?
Date: Mon, 26 Apr 2004 18:05:54 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16525.16754.772771.968949@cerise.nosuchdomain.co.uk>
References: <20040426143241.376E2197372@xprdmailfe3.nwk.excite.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040426143241.376E2197372@xprdmailfe3.nwk.excite.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vintya@excite.com
Cc: linux-c-programming@vger.kernel.org


Vineet Joglekar wrote:

> In ext2fs, while creating a file, can I allocate a number of bytes for
> that file in advance, such that those bytes are not seen by the user? 
> that is,
> 
> suppose I am creating a new file temp, then allocate 50 bytes
> immediately after creating the file. I want to use those bytes to
> store the file related info; accessible only to kernel. Whatever data
> user wants to add, will be added after the these 50 bytes. If user
> does lseek(fd,0,SEEK_SET), then the file pointer should point to the
> 51st byte. The 1st 50 bytes shouldnt be visible to user. I dont care
> if the file size is shown as userdata+50. Is it possible to achieve? 
> If yes, how?

Well, you can achieve almost anything if you're willing to spend
enough effort modifying the kernel. But what you are proposing would
be a lot of work; probably much more than you're expecting.

-- 
Glynn Clements <glynn.clements@virgin.net>
