From: Elias Athanasopoulos <elathan@pcmag.gr>
Subject: mixing C/C++
Date: Mon, 24 Nov 2003 13:10:50 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20031124111050.GI1819@pcmag.gr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello!

Consider:

class Bar {
public:
  Bar();
  ~Bar();

  void dump2(void);
};

class Foo : public Bar {
public:
	Foo();
	~Foo();

	void dump(void);
};

extern "C"
Foo * wrap_foo_ctor()
{
	return new Foo();
}

extern "C"
void wrap_foo_dump(Foo *f)
{
	f->dump();
}

extern "C"
void wrap_bar_dump2(Bar *b)
{
	b->dump2();
}

Now, I have a C program:

int main(void)
{
	struct Foo *f;

	f = wrap_foo_ctor();
	wrap_foo_dump(f);
	wrap_bar_dump2(f);
}

which is working as -at least- I expect. Bar::dump2() is 
called since Foo inherits from Bar.

However is it correct? I have a larger C++ project, which I'm
creating wrappers for in C, and I get a segfault in a similar
case (i.e. when I call a method *deep* inside the inheritence tree of a 
class). 

Regards,
-- 
Elias Athanasopoulos
http://www.pcmag.gr - Libecom S.A.
