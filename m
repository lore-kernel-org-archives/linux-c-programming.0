From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: Re: strange behavious
Date: Tue, 24 Dec 2002 10:50:25 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0212241046350.31854-100000@soochak.ncst.ernet.in>
References: <15878.50935.669096.783873@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <15878.50935.669096.783873@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>


On Mon, 23 Dec 2002, Glynn Clements wrote:

> 
> Mohammed Khalid Ansari wrote:
> 
> > I was running a simple program to test two dimensional pointer. When I 
> > compiled it and executed, it received segmentaion fault, but when I 
> > checked it in debugger step by step, it went smoothly and produced the 
> > expected output. I did it many times and got the same behavious. Following 
> > is my program
> > 
> > ###################
> > 
> > #include <stdio.h>
> > 
> > void parse (char **);
> > char	*words[] = {"mohammed", "khalid", "ansari"}; 
> 
> While the array of pointers will be mutable, the strings themselves
> aren't; if you attempt to modify them, you will get a segmentation
> fault.
> 

Is this in ANSI C?  Will you please elaborate why is it so with this array 
only and how it is different from the example you have given below because  
ultimately both examples are same ie array of pointers.

As far as I know if there is an string in a code with sufficient memory,
it can be overwritten unless it is static.


> You need to either:
> 
> 1. replace the array of pointers with an array of arrays instead,
> e.g.:
> 
> 	char words[20][] = {"mohammed", "khalid", "ansari"}; 
> 
> or:
> 
> 2. explicitly allocate mutable storage for the strings, e.g.:
> 
> 	static char word1[] = "mohammed";
> 	static char word2[] = "khalid"; 
> 	static char word3[] = "ansari"; 
> 	char *words[] = {word1, word2, word3}; 
> 
> Or you could just explicitly declare the type of the array elements as
> "pointer to const char" rather than just "pointer to char", i.e.
> 
> 	const char *words[] = {"mohammed", "khalid", "ansari"};
> 
> This should give you a compile-time error for the illegal code rather
> than a run-time segfault.
> 
> Other alternatives involve:
> 
> 1. Targeting MS-DOS (which doesn't provide any memory protection, so
> *everything* is writable), or
> 
> 2. Requiring the user to provide the appropriate compiler switches to
> make string literals writable (e.g. "-fwritable-strings" for gcc).
> 
> However, it's better to just make your code portable.
> 
> 

