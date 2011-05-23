From: Andrej Gelenberg <andrej.gelenberg@udo.edu>
Subject: Re: Hi, Needs suggestions for finding and fixing stack/memory corruption
 when calling a function
Date: Mon, 23 May 2011 16:45:53 +0200
Message-ID: <4DDA7321.1040606@udo.edu>
References: <BANLkTingN-61wOzWKk7iwxFgo0W2YAzUQQ@mail.gmail.com> <BANLkTimdU05oVtTdOr7TXdrUvc2NJ7KVyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <BANLkTimdU05oVtTdOr7TXdrUvc2NJ7KVyQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fawad Lateef <fawadlateef@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi,


heap, stack, buffer overflow? multiple threads? It is bit difficult to
suggest something without some code. Have you tried to use gdb or
valgrind? (do someone know if valgrind work on arm?)

Regards,
Andrej Gelenberg

On 05/23/2011 04:41 PM, Fawad Lateef wrote:
> Hello,
> 
> I need some suggestions about how-to approach, find and fix a memory
> corruption issue which is happening in a C/C++ very complex and large
> code (code evolved over several years). Code is running on AT91SAM9260
> (armv5l architecture; single processor with preemption enabled) and
> completely in Linux user-space.
> 
> The problem is:
> 
> -- We are calling a function which has three integer arguments.
> With-in that function 2nd and 3rd arguments always gets corrupted
> while 1st argument is fine. Just before calling that function printing
> arguments is fine.
> 
> Now it will be good if I can get some suggestions about whats
> happening and how-to look into this problem. I am thinking that there
> is some memory/stack corruption happening somewhere.
> 
> Thanks in advance.
> 
> -- Fawad Lateef
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

