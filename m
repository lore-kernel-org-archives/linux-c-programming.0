From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: strange behavious
Date: Wed, 25 Dec 2002 09:50:50 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15881.32634.771047.121020@cerise.nosuchdomain.co.uk>
References: <15878.50935.669096.783873@cerise.nosuchdomain.co.uk>
	<Pine.LNX.4.33.0212241046350.31854-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0212241046350.31854-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>


Mohammed Khalid Ansari wrote:

> > > I was running a simple program to test two dimensional pointer. When I 
> > > compiled it and executed, it received segmentaion fault, but when I 
> > > checked it in debugger step by step, it went smoothly and produced the 
> > > expected output. I did it many times and got the same behavious. Following 
> > > is my program
> > > 
> > > ###################
> > > 
> > > #include <stdio.h>
> > > 
> > > void parse (char **);
> > > char	*words[] = {"mohammed", "khalid", "ansari"}; 
> > 
> > While the array of pointers will be mutable, the strings themselves
> > aren't; if you attempt to modify them, you will get a segmentation
> > fault.
> 
> Is this in ANSI C?

Yes.

Note that ANSI C doesn't *require* that constant data are stored in
read-only memory (not all hardware supports memory protection);
however, it does permit it, so any program which assumes that constant
data (e.g. string literals) are mutable isn't portable.

> Will you please elaborate why is it so with this array 
> only

It isn't.

> and how it is different from the example you have given below because  
> ultimately both examples are same ie array of pointers.

The pointers point to different regions of memory. In your version,
they point into the read-only data ("rodata") segment, which is
read-only. In my second version, they point into the data segment,
which is mutable.

> As far as I know if there is an string in a code with sufficient memory,
> it can be overwritten unless it is static.

No; not all of the process' memory is writable. Program code and
read-only data are stored in read-only areas of memory, so that they
can be shared between multiple processes.

-- 
Glynn Clements <glynn.clements@virgin.net>
