From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: Re: strange behavious
Date: Tue, 24 Dec 2002 02:12:32 -0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.2.0.9.0.20021224020627.01e09340@fluent2.pyramid.net>
References: <15878.50935.669096.783873@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0212241046350.31854-100000@soochak.ncst.erne
 t.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>, Glynn Clements <glynn.clements@virgin.net>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>

At 10:50 AM 12/24/02 +0530, Mohammed Khalid Ansari wrote:
> > > #include <stdio.h>
> > >
> > > void parse (char **);
> > > char        *words[] = {"mohammed", "khalid", "ansari"};
> >
> > While the array of pointers will be mutable, the strings themselves
> > aren't; if you attempt to modify them, you will get a segmentation
> > fault.
> >
>
>Is this in ANSI C?  Will you please elaborate why is it so with this array
>only and how it is different from the example you have given below because
>ultimately both examples are same ie array of pointers.
>
>As far as I know if there is an string in a code with sufficient memory,
>it can be overwritten unless it is static.

Look at the type for string constants.  It is "const array of char".  And, 
based on the number of compilers that assign this type to a string 
constant, it is ANSI C.  (It was true for the original ANSI specification, 
I don't know about the latest ones.)

This is at variance with K&R C, and has been documented.

Because the string constant has the "const" property, the compiler is free 
to include it in a read-only space.  In modern computers with worthwhile 
operating systems, the hardware will then enforce the "const"-ness of the 
string.

This is a good thing, because it avoids some of the more astonishing 
results that happens when you change a string constant.  Older Unix 
compilers would store separate instances of each constant string; modern 
compilers will re-use the constant for multiple instances.

The GCC compiler has switches to modify the behavior such that the old 
Unix-style mechanisms can be used.  RTFM.

Or learn how to deal with the new rules -- which is what I had to do, and 
have found my programming life made a little easier by them.  They make sense.

Satch

