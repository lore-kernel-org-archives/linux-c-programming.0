From: "Jason P. Winters" <jason@txt.com>
Subject: Re: [jason@txt.com: Re: Problem with "chars"]
Date: Wed, 17 Jul 2002 11:24:48 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200207171824.g6HIOmn6004997@grinch.txt.com>
References: <15669.45653.26064.996776@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <15669.45653.26064.996776@cerise.nosuchdomain.co.uk> from "Glynn Clements" at Jul 17, 2002 07:07:17 PM
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: "Jason P. Winters" <jason@txt.com>, Elias Athanasopoulos <eathan@otenet.gr>, xlp <xlp@emtel.net.co>, linux-c-programming@vger.kernel.org

 
> > Huh?  I mean, excuse me?  Where do you find a reference to _not_ casting
> > the output of malloc()?   Malloc returns a (void *) reference, you -need-
> > to cast it to the type you're assigning it as.


> An implicit cast between an *integer* (undeclared functions are
> assumed to return "int") and any pointer *will* generate a warning
> (unless the integer is a literal zero).


> On an ILP32 (int/long/pointer == 32 bits) architecture (e.g. x86), you
> will get away with it. On an LP64 (long/pointer == 64 bits, int
> implicitly 32 bits) architecture, the compiler will generate code on
> the basis that malloc() returns 32 bits of data. But it will actually
> return 64 bits (a pointer), resulting in undefined behaviour.


Actually, ya'll are both right. :}  I went digging back into my books,
and found this passage in the back of one:

  This interpretation of void * pointers is new; previously, char * pointers
  played the role of generic pointer.  The ANSI standard specifically blesses
  the meeting of void * pointers with object pointers in assignments and
  relationals, while requiring explicit casts for other pointer mixtures.


Which will probably also give you some idea of my age, and when I
learned 'C'. :}

Thanks, one less cast I have to put in. ;}  Guess I'll wander through the
include files, and see what else is finally cast free...

Ciao!

Jason
-- 
|UUCP  jason@txt.com                        Who wills, Can.
|VOICE (408) 243-3425                         Who tries, Does.
|LOCAL Hey, Jason!                              Who loves, Lives.          o_.
|Disclaimer:  Not me! I didn't do *THAT!*                                 <|
|Local Disclaimer:  I'm not here!                   A. McCaffrey           4
