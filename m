From: Steve Graegert <graegerts@gmail.com>
Subject: Re: the rationale for redefining integral types?
Date: Wed, 3 Aug 2005 14:04:20 +0200
Message-ID: <6a00c8d505080305045ad09980@mail.gmail.com>
References: <Pine.LNX.4.63.0508030750250.4376@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0508030750250.4376@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On 8/3/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
> 
>  (i apologize if i asked this before once upon a time, i'm sort of
> immersed in digging through some legacy code and it's all starting to
> merge together.)

It's OK.  You're welcome. 

>  in this legacy code, one of the previous authors took it upon
> himself to redefine some of the basic integral types, such as int8,
> int16, int32 ... that sort of thing.

Sounds weird, indeed, but I suspect the code to be pre-POSIX (before 1989).
 
>  there doesn't appear to be any benefit to these internally redefined
> types over the ones in the standard library, so i can't see why it
> would have been done.

The only reason I could think of is that the developer wanted to
introduce some kind of portability by masking underlying types (and
probably their size) transparently.  Is this particular piece of code
part of a library?  Do the headers contain some #ifdefs to allow
conditional compilation for certain systems?

Regards

        \Steve
