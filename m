From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: simple printf
Date: Tue, 2 Nov 2004 08:57:16 +0000
Message-ID: <16775.19436.880492.972511@cerise.gclements.plus.com>
References: <20041102075537.30544.qmail@web53006.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041102075537.30544.qmail@web53006.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rinku rathore <rinku_ques@yahoo.com>
Cc: Vger Kernel <linux-c-programming@vger.kernel.org>


rinku rathore wrote:

> what may be the out put of simple 
> 
> printf("%d");
> 
> a garbage value or something else

If you don't specify sufficient arguments, the result is "undefined".

On most common platforms, the function will just read whatever happens
to be at the relevant location on the stack. In this specific case,
printf() will just print some unspecified integer.

If the argument was a pointer, or an integer which was used in
computing a memory address (e.g. an array index), you would probably
get a segmentation fault (typically, less than half of the process'
address space is actually mapped to anything, so accessing a random
memory location would be more likely than not to access an unmapped
location).

-- 
Glynn Clements <glynn@gclements.plus.com>
