From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: value computed is not used ??
Date: Tue, 1 Jun 2004 22:44:39 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16572.63687.904616.93775@cerise.nosuchdomain.co.uk>
References: <E3E30069B061524E90BCEE4417E30661138500@monm207.monmouth.army.mil>
	<16572.54376.258083.671154@cerise.nosuchdomain.co.uk>
	<c9iqhv$akj$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <c9iqhv$akj$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Charlie Gordon <gmane@chqrlie.org>
Cc: linux-c-programming@vger.kernel.org


Charlie Gordon wrote:

> All right, you win.
> It just strikes me as a bad habit to declare main without at least argc and
> argv.
> Proof reading is about idioms, the more you part from proven practices, the
> easier it is to write bug ridden code, and the more tedious it becomes to
> verify said code at code review level.
> For example, for loops written with the <= operator are quite likely to
> contain off by one errors.  It catches my eye instantly, and I tend to be
> rewarded often !  Same remark with casual do/while loops.
> int main(void);  strikes me as 'beginners C code' and trips me off.
> 
> So there is nothing wrong with the prototype,

Ultimately, prototypes exist so that function calls can be
type-checked. As nothing[1] actually calls main(), the prototype is
irrelevant; a K&R-style definition[2] would suffice.

[1] Other than the runtime, which has already been compiled, and so
cannot make use of any prototype.

[2] I.e.:

	int main()
		int argc;
		char **argv;
	{ /* ... */ }

In a K&R-style definition, the argument declarations exist solely so
that the function body can refer to the arguments by name. If the
function doesn't actually use the arguments, there is no point in
declaring them.

> just like there was nothing wrong with rest on the small program :
> it compiles, and performs correctly,

That's a matter of opinion. As you pointed out, initialising an
automatic array is less than ideal; while it will work, it is seldom
the right approach.

But, more generally, the original program clearly wasn't intended to
be a practical utility, but an example. In which case (and coupled
with the fact that it was posted to this list), whether or not it
ultimately "works" is arguably less relevant than whether it was
written "correctly" (in an entirely subjective sense).

> but you will all admit that my other remarks were still making valid
> points.

Yes.

-- 
Glynn Clements <glynn.clements@virgin.net>
