From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: operator=
Date: Wed, 11 Jul 2007 16:10:17 +0100
Message-ID: <18068.62169.228736.589181@cerise.gclements.plus.com>
References: <46931262.4090709@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46931262.4090709@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> Are there different kinds of operator=? I read this somewhere: 
> "copy-assignment operator=" and "other forms of operator=".

I suspect that you're referring to the fact that initialisation can be
differentiated from assignment to an existing object. E.g. if you
have:

	class foo
	{
		foo(int);
		foo(const foo&);
		foo& operator=(const foo&);
	}
	
	void f()
	{
		foo f1(10);
		foo f2 = f1;
	}

The initialisation of f2 with:

	foo f2 = f1;

is equivalent to:

	foo f2(f1);

and NOT to:

	foo f2;
	f2 = f1;

IOW, it uses the copy constructor foo(const foo&), not operator=.

If you don't have a copy constructor, operator= will be used instead. 
If you don't have either, the compiler will just perform a bitwise
copy, as for copying C structures.

Also, note that implicit initialisation of function arguments and
return values also uses the copy constructor if it exists.

Thus, if you define both a copy constructor and operator=, the copy
constructor will be applied to uninitialised objects while operator=
will only be applied to initialised objects.

This allows operator= to refer to the existing state of the object
being modified, as it will always be initialised. This is useful if an
object contains dynamically-allocated values; when you change the
value by assignment, you may want to de-allocate existing values
and/or duplicate new values.

E.g.

	class string
	{
		char *buf;

		string(char *p) {
			buf = strdup(p);
		}
		string(const string &s) {
			buf = strdup(s.buf);
		}
		string& operator=(const string &s) {
			free(buf);
			buf = strdup(s.buf);
		}
	}

-- 
Glynn Clements <glynn@gclements.plus.com>
