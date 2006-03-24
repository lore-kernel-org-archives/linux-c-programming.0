From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Virtual functions and destructors
Date: Fri, 24 Mar 2006 01:07:19 +0000
Message-ID: <17443.17991.540823.106680@cerise.gclements.plus.com>
References: <200603192050.22014.samjnaa@gmail.com>
	<200603222327.41672.mayday@gmx.net>
	<200603230732.21532.samjnaa@gmail.com>
	<200603232300.33759.mayday@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603232300.33759.mayday@gmx.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Benjamin Sobotta <mayday@gmx.net>
Cc: Shriramana Sharma <samjnaa@gmail.com>, Linux C Programming List <linux-c-programming@vger.kernel.org>


Benjamin Sobotta wrote:

> > > I'm not sure if this is right. Functions can always be overloaded.
> >
> > He did not speak of functions being overloaded. He spoke of functions being
> > over-*ridden*.
> 
> Sorry I must have read wrong. Nevertheless even if you prefer to say override 
> you can still override a function without using virtual. Just adjust the type 
> of the pointer to the class of which you want to execute the member function.

That isn't really "overriding" anything, just calling a different
function.

Two functions (members or not) which have the same name but different
argument types are completely separate functions. The fact that they
have the same name is (almost[1]) entirely cosmetic; you could just as
easily give them separate names. E.g. if you have:

	void foo(int);
	void foo(float);

you could equally just use:

	void foo_i(int);
	void foo_f(float);

Overloading just lets you omit the type annotation from the name.

[1] The only situation where the ability to overload function names
really makes a difference is when using templates.

-- 
Glynn Clements <glynn@gclements.plus.com>
