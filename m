From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: getline()
Date: Sun, 24 Aug 2003 22:32:42 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16201.12026.604756.905114@cerise.nosuchdomain.co.uk>
References: <20030824203653.A574@Imrashi.net.bd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030824203653.A574@Imrashi.net.bd>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Progga <abulfazl@juniv.edu>
Cc: linux-c-programming@vger.kernel.org


Progga wrote:

> 
>  Is there any 'C' lib which contains the getline() function ?

getline() is in libc. The prototype is in stdio.h, but you may need to
use -D_GNU_SOURCE to enable it.

-- 
Glynn Clements <glynn.clements@virgin.net>
