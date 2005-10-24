From: Steve Graegert <graegerts@gmail.com>
Subject: Re: MIsc C programming questions
Date: Mon, 24 Oct 2005 12:02:19 +0200
Message-ID: <6a00c8d50510240302y53794214ud57083563fd974fa@mail.gmail.com>
References: <435CA333.3010904@crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <435CA333.3010904@crearium.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 10/24/05, fabio <fabio@crearium.com> wrote:
> Hello,
>
> I have some questions about C programming not exactly on Linux but
> Solaris, I hope you can help me:
>
> - Why I cant include this __asm___ lines on a C program and compile it
> on Sun cc on Solaris 10?

Because Sun's C compiler doesn't support __asm__ which is a GNU extension.

> Any workaround?

Use the asm keyword instead:

	asm("mov %sp,%g1");
	asm("mov %g1,%o1");

Does it help?

	\Steve
