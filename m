From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Accessing a class' member functions
Date: Sun, 26 Mar 2006 14:46:01 +0000
Message-ID: <6a00c8d50603260646x72f816cdwb2effa835fd0d3a3@mail.gmail.com>
References: <200603260931.05639.samjnaa@gmail.com>
	 <6a00c8d50603260015ud777b7fgfbfa02f567cf8b@mail.gmail.com>
	 <200603261809.18686.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603261809.18686.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 3/26/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Sunday, 26 March 2006 13:45 samaye Steve Graegert alekhiit:
>
> > Please note that static member functions can only access global data
> > or static class data and can not be declared virtual.
>
> So if I want some globally accessible function that is not limited to
> accessing global or static data what should I do?

If you are in a situation like that, you either have poorly designed
the application or you have not fully understood the nature of the
product you're using.

Anyway, if you desperately need this functionality you may want to
write an appropriate accessor method that instantiates the class in
question and returns the non-static member from within a static
context:

--- BEGIN ---
#include <iostream>

using namespace std;

class D {
private:
    int num;
public:
	D() { num = 3; }
	int get_num() {
		return num;
	}
};

class C {
public:
	static int get_num() {
		D *d = new D;
		return d->get_num();
	}
};

int main(void) {
	cout << "C::get_num(): " << C::get_num() << endl;
	return 0;
}
--- END ---

The example prints 3 on stdout.

	\Steve
