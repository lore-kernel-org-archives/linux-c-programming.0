From: Shanks <mshanks79@yahoo.co.in>
Subject: Re: strange gcc warning
Date: Mon, 13 Jan 2003 10:07:50 -0800 (PST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030113180750.78660.qmail@web8005.mail.in.yahoo.com>
References: <20030113212508.B1128@neutrino.particles.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030113212508.B1128@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elias Athanasopoulos <eathan@otenet.gr>
Cc: linux-c-programming@vger.kernel.org

--- Elias Athanasopoulos <eathan@otenet.gr> wrote:
> On Mon, Jan 13, 2003 at 09:57:55AM -0800, Shanks wrote:
> > my_print(int errno)
> 
> errno is defined in errno.h. You shouldn't use a new variable with this
> name.
Yes i am aware of errno being defined in errno.h
But isn't my definition local to my func.
Any technical reason why i am getting such a gdb output(pasted in prev mail)

> Elias
-Shanks

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
