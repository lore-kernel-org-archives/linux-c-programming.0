From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: Re: mixing C/C++
Date: Mon, 24 Nov 2003 19:55:01 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20031124175501.GA1022@velka.phys.uoa.gr>
References: <20031124111050.GI1819@pcmag.gr> <200311242218.40158.steven_shaw@iprimus.com.au>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200311242218.40158.steven_shaw@iprimus.com.au>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Shaw <steven_shaw@iprimus.com.au>
Cc: linux-c-programming@vger.kernel.org

On Mon, Nov 24, 2003 at 10:18:40PM +1000, Steven Shaw wrote:
> On Monday 24 November 2003 21:10, Elias Athanasopoulos wrote:
> > Now, I have a C program:
> >
> > int main(void)
> > {
> > 	struct Foo *f;
> >
> > 	f = wrap_foo_ctor();
> > 	wrap_foo_dump(f);
> > 	wrap_bar_dump2(f);
> > }
> 
> Looks fine to me.

Apparently it is fine. The problem occures when I am wrapping
a class which inherits from multiple classes with virtual
functions. 

Any workarounds? 

Regards,
-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
