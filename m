From: Felipe W Damasio <felipewd@terra.com.br>
Subject: Re: c debugging w/ gdb revisited
Date: Fri, 14 Jun 2002 10:57:04 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020614105704.6e696e45.felipewd@terra.com.br>
References: <20020614065235.010E336F9@sitemail.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020614065235.010E336F9@sitemail.everyone.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: xjnfx@doityourself.com
Cc: linux-c-programming@vger.kernel.org

On Thu, 13 Jun 2002 23:52:35 -0700 (PDT)
jnf <xjnfx@doityourself.com> wrote:

J> just a quick question, does anyone know if its possible to set a break/watchpoint in gdb when a register points to a certain location?
J> i own the gdb manual, and have been playing in it for a bit and just cant seem to figure it out, is it possible?

	No, you can't (x86 at least).

	What you can do is to watch the contents of the registers constantly and then manually stop your program.

Felipe
