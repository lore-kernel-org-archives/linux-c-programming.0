From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Read error
Date: Tue, 23 Apr 2002 11:27:12 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15557.14080.812544.344754@cerise.nosuchdomain.co.uk>
References: <OF98E48590.01E12378-ON65256BA4.00302010@pune.tcs.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <OF98E48590.01E12378-ON65256BA4.00302010@pune.tcs.co.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hemantm@pune.tcs.co.in
Cc: linux-c-programming@vger.kernel.org


Hemant Mohan wrote:

> My question is that why does the read block initially, when there is some 
> data for it to read. Under what conditions does the read normally block.

read() blocks if no data is available.

However, open(O_RDONLY) blocks until something opens the other end of
the pipe for writing, and open(O_WRONLY) blocks until something opens
the other end of the pipe for reading. So, whichever process is run
first will block on open() until the other process calls open().

-- 
Glynn Clements <glynn.clements@virgin.net>
