From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: LKM function call on kernel function call?
Date: Tue, 05 Jul 2005 10:38:26 +0200
Message-ID: <1120552708.3180.29.camel@laptopd505.fenrus.org>
References: <1458d9610507050123124d6cb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1458d9610507050123124d6cb@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: S <talk2sumit@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux prg <linux-c-programming@vger.kernel.org>

On Tue, 2005-07-05 at 16:23 +0800, S wrote:
> Is it possible to code a loadable module having function1(), which
> would be called, everytime a particular function of the kernel is
> called? If not, atleast a way this could be done without re-compiling
> the whole kernel and rebooting the system?

why don't you want to compile the whole kernel ? You have the source
code and it for sure is the easiest way to add this (debug?) hack...


