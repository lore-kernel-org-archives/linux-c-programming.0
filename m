From: Al Viro <viro@parcelfarce.linux.theplanet.co.uk>
Subject: Re: Problem in accessing executable files
Date: Wed, 9 Feb 2005 00:21:55 +0000
Message-ID: <20050209002155.GY8859@parcelfarce.linux.theplanet.co.uk>
References: <20050209001427.61C438AF24@xprdmailfe2.nwk.excite.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050209001427.61C438AF24@xprdmailfe2.nwk.excite.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vineet Joglekar <vintya@excite.com>
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

On Tue, Feb 08, 2005 at 07:14:27PM -0500, Vineet Joglekar wrote:
> 
> Hi all,
> 
> 
> 
> 1 more interesting observation regarding my executable file problem.
> 
> 
> 
> If I copy an executable say "prac" from ext2 fs to my encrypted fs as prac1, prac1 doesnt run on the encrypted fs. but, if I make another copy, from prac1 to normal ext2 fs, as prac2, then the prac2 executes properly on normal file system. that means my encryption, decryption functions are getting executed properly while using that executable as normal file to read and write, but something else is happening when I try to execute it. I am failing to understand what am I missing.

1) 6 or 7 newlines
2) mmap()
