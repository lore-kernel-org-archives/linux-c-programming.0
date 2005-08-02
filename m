From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: regarding inode number
Date: Tue, 2 Aug 2005 17:42:31 +0100
Message-ID: <17135.41591.423996.3994@cerise.gclements.plus.com>
References: <42EF6367.7000607@effigent.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42EF6367.7000607@effigent.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: raja <vnagaraju@effigent.net>
Cc: linux-c-programming@vger.kernel.org


raja wrote:

>     Is there any way to get the file name if i-node number is known?

Recursively scan the entire filesystem on which the inode resides.

Note that you aren't guaranteed to obtain a single filename. If the
file has multiple hard links, there will be multiple filenames. If the
file has been deleted (which can occur even if it's still open), you
won't find any matching filenames.

-- 
Glynn Clements <glynn@gclements.plus.com>
