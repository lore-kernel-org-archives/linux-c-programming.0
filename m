From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: question about gcc and keyboard hadling
Date: Mon, 5 Aug 2002 15:43:18 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15694.36614.996185.222692@cerise.nosuchdomain.co.uk>
References: <02080504255200.24029@linux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <02080504255200.24029@linux>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rmb@coopenet.com.ar
Cc: linux-c-programming@vger.kernel.org


+Rudymartin wrote:

> im trying to develop a text editor using gcc version 2.96 20000731 (Red Hat 
> Linux 7.1 2.96-81) , and thats because I want to make some experience with 
> C++ (I used to program in Java and C under windowz) The Info pages have 
> information about most libraries and functions but I have found no way to 
> trap the modifiers keys (ALT/CTRL/SHIFT) under a terminal. And I noticed 
> emacs can trap those keys under a terminal.

You can't get the same kind of modifier behaviour on a terminal that
you can in a windowed environment.

You can only detect Control and Shift to the extent that they affect
the character code. And you can't tell the difference between
different ways of generating the same code, e.g. Ctrl-M and Return or
Ctrl-I and Tab.

Also, there are two ways in which Meta/Alt is handled. One way is to
add 128 to the code, the other way is to precede the code by ESC (code
27). AFAICT, Emacs only handles ESC-<code>.

-- 
Glynn Clements <glynn.clements@virgin.net>
