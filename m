From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: literal constant..
Date: Tue, 3 Feb 2004 10:04:26 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <003d01c3ea67$04607ff0$ed64a8c0@descartes>
References: <31E38B53D182D51195FA00508BE3A334033CA936@zwnbc004.cala.nortel.com> <401FB158.40408@onlinehome.de>
Reply-To: "John T. Williams" <jtwilliams@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

it is actually easier to see the difference if you divorce the assignment
operation from the variable declarations.


char* a;
creates a pointer that points to nothing in particular ( its value is
unknown)

char b[2];
creates a constant pointer that points to a specific place in memory that
has 2 bytes set aside for its use.

I can then make the call

a = (char*) malloc( 300 );  // and a would now point to an array of 300
character in length (on the heap if you care)

however the call
b = (char*) malloc( 300); // is illegal, and should not compile.





----- Original Message ----- 
From: "Florian Attenberger" <fattenberger@onlinehome.de>
To: "Sandro Dangui" <sdangui@nortelnetworks.com>;
<linux-c-programming@vger.kernel.org>
Sent: Tuesday, February 03, 2004 9:34 AM
Subject: Re: literal constant..


> char c[1]="c" is an unlucky example, it seems to be like this:
> char c* = "c"; // make c point to "c\0".
> char c[1] = "c"; // make c point to an undifined array of char of length
> 1, set last char to '\0', _after_ that overwrite the array with "c",
> since "c" is just as long as the whole array, the \0 gets overwritten.
>
> To get the second example behave equal to the first, it needs to be:
> char c[2] = "c"; // char[0] == 'c', char[1] == '\0'.
>
> So much to code difference.
>
> char c[] is however a constant pointer, so you cannot reassign it.
> That doesn't have to result in any assembler code difference at all, its
> just the compiler that complains.
>
> flo
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

