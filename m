From: Jeff Woods <Kazrak+kernel@cesmail.net>
Subject: Re: Stupid Question.
Date: Wed, 12 May 2004 13:02:25 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <6.0.1.1.0.20040512125919.02e8cec0@no.incoming.mail>
References: <1084387986.15249.25.camel@scotus.fesnel.no-ip.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1084387986.15249.25.camel@scotus.fesnel.no-ip.org>
References: <1084387986.15249.25.camel@scotus.fesnel.no-ip.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: "Linux-C-Programming (E-mail)" <linux-c-programming@vger.kernel.org>

At 5/12/2004 02:53 PM -0400, John T. Williams wrote:
>What does declaring a function static do?    ie
>What is the difference between
>
>static int blue() {
>         return 0;
>}
>
>and
>
>int blue() {
>         return 0;
>}

It makes the function visible only within the comilation unit it's in.  See 
also:

http://www.phim.unibe.ch/comp_doc/c_manual/C/SYNTAX/static.htm

As the website points out static functions and static variables seem like 
very different meanings of the word "static".  In both cases I think of it 
as "global but private/hidden".

--
Jeff Woods <kazrak+kernel@cesmail.net> 


