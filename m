From: Chuck Winters <chuckw@ieee.org>
Subject: Efficient UDP Programming
Date: Fri, 20 Aug 2004 23:08:35 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1093057706.5080.28.camel@nicodemus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Is there anyway of reading some data from a UDP socket without removing
it from the received queue?  What I need to do is read in the header
from a packet to determine how large of a memory chunk I need to
allocate.

Thanks,
Chuck

