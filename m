From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: problem with const in structure
Date: Mon, 6 Jan 2003 15:48:47 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15897.42335.617357.58154@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.33.0301061759250.14169-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0301061759250.14169-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>


Mohammed Khalid Ansari wrote:

> consider the following code.
> 
> ####
> #include <stdio.h>
> 
> struct node {
> 	const int x;
> 	char name[20];
> 	struct node *next;
> };
> 
> int main()
> {
> 	struct node newnode;
> 		
> 	newnode.x = 10;
> 	newnode.x = 12;
> 	printf ("x = %d\n", newnode.x);
> 	return 0;
> }
> ####
> 
> Now, you can see that even though I have defined x to be const int, I can 
> assign it values. When I compiled the program, it gives the warning that 
> assignment of read-only member x but when I ran the program, it worked 
> fine. Where is the catch. How do I define a structure variable to be 
> const?

In C, the "const" keyword only has a defined meaning when applied to
arrays or pointers. Even then, it isn't required that the compiler
prohibits modification.

-- 
Glynn Clements <glynn.clements@virgin.net>
