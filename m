From: "james-lists" <james@stev.org>
Subject: RE: "double free or corruption" - how to solve this?
Date: Fri, 12 May 2006 13:01:29 +0100
Message-ID: <002201c675bb$ce3aec20$0500ac0a@slider>
References: <75062f40605120111s2d27c8c0gb768c50b1ae34588@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <75062f40605120111s2d27c8c0gb768c50b1ae34588@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Shriramana Sharma' <samjnaa@gmail.com>, linux-c-programming@vger.kernel.org

Hi,


Try linking your program with electric fence. It may already be installed it
comes on most distros now. Add -lefence when linking. It should help you pin
point the problem very quickly when used with a debugger like gdb.

	James

> -----Original Message-----
> From: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-
> programming-owner@vger.kernel.org] On Behalf Of Shriramana Sharma
> Sent: 12 May 2006 09:11
> To: linux-c-programming@vger.kernel.org
> Subject: "double free or corruption" - how to solve this?
> 
> One of my programs, which was working quite well till now, suddenly
> gives me the error:
> 
> *** glibc detected *** double free or corruption (top): 0x0808a338 ***
> Aborted
> 
> It is a pure C program compiled with GCC 4.02 -- I do not understand
> why it does not work suddenly. Please tell me what the above error can
> be.
> 
> Thanks.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-
> programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


