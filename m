From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: How to open a file and to disable other processes from removing it
Date: Wed, 19 Mar 2003 15:45:46 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15992.37034.685358.775548@cerise.nosuchdomain.co.uk>
References: <000701c2ee1a$9973aad0$0266a8c0@psb>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000701c2ee1a$9973aad0$0266a8c0@psb>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexi Jordanov <a_jordanov@prosyst.bg>
Cc: linux-c-programming@vger.kernel.org


Alexi Jordanov wrote:

> Can somebody tell me how to open a file on Linux and to disable other
> processes from being  capable to remove it?

1. Nothing will prevent root-owned processes from deleting the file. 
Anything which you do to prevent it can be undone by root.

2. Unless the process which creates the file is running as root,
nothing will prevent other processes which run under the same account
from deleting it.

If the process which creates the file is running as root, then you can
create the file in a directory which has the sticky bit set, whose
owner differs from that of the file, and which has no permissions for
anyone other than the directory's owner. The sticky bit ensures that
no-one other than the owner can delete it, and the lack of permissions
for the file's owner on the parent directory ensures that the file's
owner cannot reference it (and hence can't delete it).

-- 
Glynn Clements <glynn.clements@virgin.net>
