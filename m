From: Stephen Kratzer <kratzers@pa.net>
Subject: Re: String comparison for fixed strings
Date: Wed, 15 Aug 2007 09:18:52 -0400
Message-ID: <200708150918.52599.kratzers@pa.net>
References: <9870a8150708150406x6297b877u473bfbbc62949f10@mail.gmail.com>
Reply-To: kratzers@pa.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <9870a8150708150406x6297b877u473bfbbc62949f10@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: KhaOsh <ficheironegro@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Wednesday 15 August 2007 07:06:24 KhaOsh wrote:
> Hello everyone,
>
> In terms of speed what the fastest way of doing a strings comparison
> on fixed strings? Using one of those strcmp() functions or doing the
> following:
>
> (Pseudo code)
> "if (s[0] == 0xa && s[1] == 0xb && s[2] == 0xc)" (etc)
> or
> "if (s[0] == 'A' && s[1] == 'B' && s[2[ == 'C')" (etc)
>
> Thanks for your help.

The function strcmp uses a do/while loop, a conditional to test every 
character in the first string against the null character, and pointer 
arithmetic, so, in terms of sheer speed, your method would probably be 
faster. But, in terms of program clarity, strcmp wins by a mile.

Stephen Kratzer
