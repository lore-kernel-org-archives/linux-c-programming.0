From: "Sandro Dangui" <sdangui@nortelnetworks.com>
Subject: RE: function pointers in C++
Date: Mon, 15 Mar 2004 18:59:18 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <31E38B53D182D51195FA00508BE3A3340364A2E3@zwnbc004.cala.nortel.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elias Athanasopoulos <elathan@phys.uoa.gr>
Cc: linux-c-programming@vger.kernel.org


You got this error: converting from `double (Foo::*)(double*, double*)' to
`double (*)(double*, double*)' because the compiler doesn't know which
instance of class Foo it should use in the call... As I said before the
compiler pass the "this" value (that represents an instance of a class) as a
hidden parameter.

So, the only possible solution that I can see is the use of static method.
Do you need multiple instances of the class that implements the desired
method? Or can you use a singleton? Using a singleton your static method
will have access to other methods and attributes through the static method
getInstance().

Sandro.



-----Original Message-----
From: Elias Athanasopoulos [mailto:elathan@phys.uoa.gr] 
Sent: Monday, March 15, 2004 8:29 AM
To: Dangui, Sandro [CMPS:RY11:EXCH]
Cc: linux-c-programming@vger.kernel.org; Dar?o Mariani
Subject: Re: function pointers in C++


On Mon, Mar 15, 2004 at 11:21:18AM -0300, Sandro Dangui wrote:
> 
> I think this sample code will help you... Verify if it looks brilliant 
> enough. :-))

Thanks for the detailed reply. 

Actually, what I want to do is to pass a pointer to a member function in a
function that expects a pointer to function; I don't want to call the member
function, but just pass its address.

Following Stroustrup (pages 156..158), I did something like this:

    Foo *f = new Foo(id);
    double (Foo::*pfunc)(double *, double *) = &Foo::func;
    Bar *res = new Bar((double (*)(double *, double *))(func->*pfunc));

And:

class Foo {
public:
    Foo(int id);
    ~Foo();
    double func(double *, double *);
};

Also Bar's constructor (I can't change it --third party implementation) is:

    Bar(double (*)(double *, double *));

Amazingly I get the error:

test.cxx:107: error: converting from `double (Foo::*)(double*, double*)' to 
   `double (*)(double*, double*)'
   
which is *at least* annoying. It is another BIG suprise from C++. I mean,
there is, most probably, a good reason why this is not supported, but it is
a *broken design*.

Foo::func()'s prototype is (double) (double *, double *), which in my human
brain is compiled as: 'give me two pointers to double and I will give you
one double'. Why I can't pass it to a function which *expects* what my poor
human brain understands?

I didn't ask to convert for me a string to float...

Regards,
-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
