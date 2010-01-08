From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: float
Date: Fri, 8 Jan 2010 22:05:31 +0000
Message-ID: <19271.44075.324002.807391@cerise.gclements.plus.com>
References: <a24b3c171001080830l4bb72defr32b60386e4e45ae9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <a24b3c171001080830l4bb72defr32b60386e4e45ae9@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: phoenixxz <vim.xxz@gmail.com>
Cc: linux-c-programming@vger.kernel.org


phoenixxz wrote:

> float i=1.34;
> printf("%f",i);
> 
> 
> ->> 0
> why?

You need to include <stdio.h> and write a main() function ;)

Beyond that: stdout will be line-buffered (if it's associated with a
terminal, block-buffered otherwise), so you should add a "\n" to the
end of the format string.

The lack of line buffering might have an effect if the program
terminates abnormally (exit() or returning from main() should cause
buffered streams to be flushed).

A working example:

	$ cat test.c
	#include <stdio.h>
	int main(void)
	{
	    float i=1.34;
	    printf("%f\n",i);
	    return 0;
	}
	$ gcc test.c
	$ ./a.out
	1.340000

-- 
Glynn Clements <glynn@gclements.plus.com>
