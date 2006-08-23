From: Mihai Dontu <mdontu@bitdefender.com>
Subject: Re: Where to find definition for __FUNCTION__ macro
Date: Wed, 23 Aug 2006 13:13:15 +0300
Message-ID: <44EC2A3B.90302@bitdefender.com>
References: <3ce33f6c0608230302n6b779dd1w1543f437a955c5a0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3ce33f6c0608230302n6b779dd1w1543f437a955c5a0@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Shriek wrote:
> Hi
>  Where can I find the implementation of the __FUNCTION__ macro, does
> it use symbol table look up  or something ... thanks and regards ...

A.f.a.i.k __FUNCTION__ is a gcc builtin macro. It's not defined as
regular macros.

M.D.


--
This message was scanned for viruses by BitDefender for Linux Mail Servers.
For more information please visit http://www.bitdefender.com/

