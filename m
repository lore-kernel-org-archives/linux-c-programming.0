From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: write arbitraty data to a running process memory
Date: Fri, 5 Nov 2004 07:53:38 +0000
Message-ID: <16779.12674.857816.612924@cerise.gclements.plus.com>
References: <e1e1d5f4041104231529eb739d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <e1e1d5f4041104231529eb739d@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Souza <thehazard@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Daniel Souza wrote:

> hi, im getting a bit confused about somethings... first, looks to me
> that under >= 2.4 kernels, we cant mmap() a /proc/pid/mem file... (not
> tested by me, just heard at linux-kernel mailing list) so, there's a
> way to write to a running process memory (without use ptrace will be
> better, because its disabled in some systems) ?

A process can only read/write a /proc/<pid>/mem file if the process
to which <pid> refers is either:

a) the current process, or
b) a child of the current process which is being ptrace()d.

See the file fs/proc/base.c in the kernel source code.

-- 
Glynn Clements <glynn@gclements.plus.com>
