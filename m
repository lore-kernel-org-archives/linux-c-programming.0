From: Steven Shaw <steven_shaw@iprimus.com.au>
Subject: Re: mixing C/C++
Date: Tue, 25 Nov 2003 12:21:38 +1000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200311251221.39488.steven_shaw@iprimus.com.au>
References: <20031124111050.GI1819@pcmag.gr> <200311242218.40158.steven_shaw@iprimus.com.au> <20031124175501.GA1022@velka.phys.uoa.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20031124175501.GA1022@velka.phys.uoa.gr>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elias Athanasopoulos <elathan@phys.uoa.gr>
Cc: linux-c-programming@vger.kernel.org

On Tuesday 25 November 2003 03:55, Elias Athanasopoulos wrote:
> On Mon, Nov 24, 2003 at 10:18:40PM +1000, Steven Shaw wrote:
> > On Monday 24 November 2003 21:10, Elias Athanasopoulos wrote:
> > > Now, I have a C program:
> > >
> > > int main(void)
> > > {
> > > 	struct Foo *f;
> > >
> > > 	f = wrap_foo_ctor();
> > > 	wrap_foo_dump(f);
> > > 	wrap_bar_dump2(f);
> > > }
> >
> > Looks fine to me.
>
> Apparently it is fine. The problem occures when I am wrapping
> a class which inherits from multiple classes with virtual
> functions.

That should be fine too.

> Any workarounds?

Maybe you have C++ code with static members. If so you need to compile main() 
with a C++ compiler. Here is an excellent resource:

	http://www.parashift.com/c++-faq-lite/mixing-c-and-cpp.html

Also the C++ FAQ Lite main page now has a Google-based sitesearch box:

	http://www.parashift.com/c++-faq-lite/

Steve.

