From: Jonathan Walsh <jwalsh@atl.lmco.com>
Subject: Autoloading modules after socket calls.
Date: Mon, 15 Jan 2007 10:01:26 -0500
Message-ID: <45AB9746.3040503@atl.lmco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

I am not sure how used this list is, but it seemed like a good place to 
ask this sort of question.  I was wondering if there is a way to have 
the kernel autoload a module on a failed call to something that requires 
it.  For example if I have sctp compiled as a module, but not inserted, 
and I make a call to socket() requesting a IPPROTO_SCTP socket it will 
fail with EPROTONOSUPPORT.  Is there a way in some sort of kernel 
configuration of specifying that the sctp module should be swapped in at 
this point?  I could write code to pick up this error and insert the 
module myself, but I was hoping for a way for the kernel to 
automatically do it for me.

Thanks,

Jonathan Walsh
Associate Member Engineering Staff
Lockheed Martin Advanced Technology Laboratories
