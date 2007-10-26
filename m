From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: kernel provided system call is an API?
Date: Fri, 26 Oct 2007 22:05:58 +0100
Message-ID: <18210.22198.824183.983353@cerise.gclements.plus.com>
References: <472214F1.6030907@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <472214F1.6030907@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> 1. Can the system calls provided by the kernel be considered an API?

System calls aren't strictly an *application* programming interface.
Applications are supposed to use the libc functions.

OTOH, the term "system call" is often used to refer to both of the
actual system call and the corresponding libc function.

IOW, read() is an API, syscall(SYS_read, ...) isn't.

> 2. When an app using system calls is executed, would any code in the 
> kernel be executed?

Yes. That's the point of system calls.

-- 
Glynn Clements <glynn@gclements.plus.com>
