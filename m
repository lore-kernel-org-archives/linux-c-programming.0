From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: strange behavious
Date: Mon, 23 Dec 2002 08:19:03 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15878.50935.669096.783873@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.33.0212211051440.20373-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0212211051440.20373-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>


Mohammed Khalid Ansari wrote:

> I was running a simple program to test two dimensional pointer. When I 
> compiled it and executed, it received segmentaion fault, but when I 
> checked it in debugger step by step, it went smoothly and produced the 
> expected output. I did it many times and got the same behavious. Following 
> is my program
> 
> ###################
> 
> #include <stdio.h>
> 
> void parse (char **);
> char	*words[] = {"mohammed", "khalid", "ansari"}; 

While the array of pointers will be mutable, the strings themselves
aren't; if you attempt to modify them, you will get a segmentation
fault.

You need to either:

1. replace the array of pointers with an array of arrays instead,
e.g.:

	char words[20][] = {"mohammed", "khalid", "ansari"}; 

or:

2. explicitly allocate mutable storage for the strings, e.g.:

	static char word1[] = "mohammed";
	static char word2[] = "khalid"; 
	static char word3[] = "ansari"; 
	char *words[] = {word1, word2, word3}; 

Or you could just explicitly declare the type of the array elements as
"pointer to const char" rather than just "pointer to char", i.e.

	const char *words[] = {"mohammed", "khalid", "ansari"};

This should give you a compile-time error for the illegal code rather
than a run-time segfault.

Other alternatives involve:

1. Targeting MS-DOS (which doesn't provide any memory protection, so
*everything* is writable), or

2. Requiring the user to provide the appropriate compiler switches to
make string literals writable (e.g. "-fwritable-strings" for gcc).

However, it's better to just make your code portable.

-- 
Glynn Clements <glynn.clements@virgin.net>
