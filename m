From: Steve Graegert <graegerts@gmail.com>
Subject: Re: __asm__
Date: Tue, 29 Mar 2005 09:40:17 +0200
Message-ID: <6a00c8d505032823401b82ce07@mail.gmail.com>
References: <20050329064829.52787.qmail@web52908.mail.yahoo.com>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050329064829.52787.qmail@web52908.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>

On Mon, 28 Mar 2005 22:48:28 -0800 (PST), Ankit Jain
<ankitjain1580@yahoo.com> wrote:
> can anybody tell me when we write like this while
> writing asm construct then what does underscore mean?
> 
> __asm__("construct")

Underscores in those contexts usually represent a lanugage extension
and are used to make clear that this contruct may not be part of the
language standard, although a lot of other C compiler may implement
it. GNU C knows about a lot of other extensions like
__attribute__((always_inline)) that is used for function inlining.

> does it have any connection wit volatile?

Yes, it has. It prevents the compiler from modifying the inline asm
code, like reordering of statements and the like. This makes sure,
your code is handled by the compiler as is, so you will be using
__volatile__ most of the time.
 
Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com> // Anyone who considers arithmetical
Software Consultant {C/C++ && .NET} // methods of producing random digits
Mobile: +49 (176)  21 24 88 69     //   is, of course, in a state of sin.
 Voice: +49 (9131) 71 26 40 9     //           -- JOHN VON NEUMANN (1951)
