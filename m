From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: is it a buf or what?
Date: Sat, 8 Jun 2002 13:03:02 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15617.62070.407934.637355@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.33.0206081601090.19134-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0206081601090.19134-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>


Mohammed Khalid Ansari wrote:

> I had written a small program as follows...
> 
> #include <stdio.h>
> 
> int main()
> {
> 	char	*ptr;
> 	
> 	strcpy (ptr, "khalid");
> 	printf ("%s\n", ptr);
> 	return 0;
> }
> 
> As you can see, I haven't allocated the space for the pointer ptr. When I 
> ran the program, instead of giving me the segmentation fault, it just ran 
> printing "khalid". Is it a bug of gcc or the kernel.

No.

An automatic variables which isn't explicitly initialised will have a
random value. It seems that, in this case, "ptr" just happens to point
to writable memory.

This is an example of a program whose behaviour is "undefined". That
means that anything might happen; it might even work.

-- 
Glynn Clements <glynn.clements@virgin.net>
