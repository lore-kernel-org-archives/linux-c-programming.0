From: Steven Shaw <steven_shaw@iprimus.com.au>
Subject: Re: mixing C/C++
Date: Mon, 24 Nov 2003 22:18:40 +1000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200311242218.40158.steven_shaw@iprimus.com.au>
References: <20031124111050.GI1819@pcmag.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20031124111050.GI1819@pcmag.gr>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Monday 24 November 2003 21:10, Elias Athanasopoulos wrote:
> Now, I have a C program:
>
> int main(void)
> {
> 	struct Foo *f;
>
> 	f = wrap_foo_ctor();
> 	wrap_foo_dump(f);
> 	wrap_bar_dump2(f);
> }

Looks fine to me.

