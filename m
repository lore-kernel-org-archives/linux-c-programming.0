From: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>
Subject: Re: stack trace
Date: Thu, 21 Aug 2003 11:57:08 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030821105708.GA8141@lsd.di.uminho.pt>
References: <DD9E117A8BE9F34FA4130376EC9C1F6A05E5136D@BANMLVEM01.e2k.ad.ge.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DD9E117A8BE9F34FA4130376EC9C1F6A05E5136D@BANMLVEM01.e2k.ad.ge.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Singh, Umesh K (MED)" <Umesh.Singh@geind.ge.com>
Cc: linux-c-programming@vger.kernel.org

On Thu, Aug 21, 2003 at 09:29:56AM +0530, Singh, Umesh K (MED) wrote:
> is it possible to get the stack trace without attaching the process to debugger. For Ex. can i write a func let's say "print_stack_trace()" and call it anywhere in my program to print the stack trace at that point of time.
> 
> i thot it will be helpful in my big programs.
> 
> if it is possible, any direction/pointers???

Other people pointed to backtrace(), but I normally use in my programs,
for debugging purposes, assert(3) or abort(2) directly. The program is
also then terminated.

Thus I get a core file with the state of the program at that time. (Don't
forget to check the ulimit for core file size.)

Regards,
Luciano Rocha
