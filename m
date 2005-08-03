From: "Kirkwood, David A" <DAVID.A.KIRKWOOD@saic.com>
Subject: 64 bit network access
Date: Wed, 3 Aug 2005 09:21:24 -0400
Message-ID: <CA0BCF3BED56294AB91E3AD74B849FD51F1933@us-arlington-0668.mail.saic.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

I have an client server application which is comprised of a 64bit-word
servers and clients  and clients  and 32 bit word word clients. When this
was 32 bit only I used htons and htonl etc and everything worked fine. Is
there such a standard for the addition of 64 bit-word systems or is it up to
be to handle this on my own. Assume that the integers always fit into 32
bits, but what will happen in other systems when they don't?

Thanks,

Dave
