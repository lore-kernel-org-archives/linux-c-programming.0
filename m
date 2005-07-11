From: Jeff Woods <Kazrak+kernel@cesmail.net>
Subject: Re: canonical byte swap macros?
Date: Sun, 10 Jul 2005 20:48:37 -0600
Message-ID: <6.2.3.4.0.20050710204229.03f0a628@no.incoming.mail>
References: <Pine.LNX.4.63.0507102100500.9524@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0507102100500.9524@localhost.localdomain>
References: <Pine.LNX.4.63.0507102100500.9524@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

Howdy.

At 7/10/2005 21:02 -0400, Robert P. J. Day wrote:
>is there a standard set of byte swap macros/functions for doing 
>big/little endian conversion?  i have no interest in re-inventing 
>the wheel and i'm sure there's a universally-recognized set of 
>macros for this, no?

The most common case where a programmer cares about byte-order is 
networking code.  Thus "man 3 byteorder" says:

>>htonl, htons, ntohl, ntohs - convert values between host and 
>>network byte order

according to http://tinyurl.com/9c8hu which redirects to
http://linux.com.hk/PenguinWeb/manpage.jsp?name=byteorder&section=3

--
Jeff Woods <kazrak+kernel@cesmail.net> 

