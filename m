From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: integrating c code and c++ code
Date: Thu, 26 Dec 2002 20:50:21 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15883.27533.81795.913324@cerise.nosuchdomain.co.uk>
References: <004601c2acf2$a442cea0$70ab88c1@ieeta.pt>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="3x4/pzKEGx"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <004601c2acf2$a442cea0$70ab88c1@ieeta.pt>
List-Id: <linux-c-programming.vger.kernel.org>
To: qhwang <qhwang@ieeta.pt>
Cc: linux-c-programming@vger.kernel.org


--3x4/pzKEGx
Content-Type: text/plain; charset=us-ascii
Content-Description: message body and .signature
Content-Transfer-Encoding: 7bit


qhwang wrote:

> Does anyone have experience of integrating c code together with c++ code? I
> know it may be unusual but I need to do it.

It isn't at all unusual to integrate C++ with C. However, calling C
from C++ is a lot easier than calling C++ from C.

> The case is, I need to integrate
> some well defined c++ wavelet classes into my c application, but I don't
> have enough time to rewrite the wavelet classes in plain c. So how can I do
> it? Any help or further pointer will be greatly appreciated. Many thanks.

You can't call C++ methods from C, only plain functions. If you want
to call methods, you must write wrapper functions; such functions must
use C linkage.

A simple example is attached.

-- 
Glynn Clements <glynn.clements@virgin.net>


--3x4/pzKEGx
Content-Type: text/plain
Content-Description: private.h
Content-Disposition: inline;
	filename="private.h"
Content-Transfer-Encoding: 7bit

/* private.h */

class foo
{
public:
	void bar(void);
};


--3x4/pzKEGx
Content-Type: text/plain
Content-Description: public.h
Content-Disposition: inline;
	filename="public.h"
Content-Transfer-Encoding: 7bit

/* public.h */

#ifdef __cplusplus
extern "C" {
#endif

extern void *new_foo(void);
extern void foo_bar(void *);

#ifdef __cplusplus
}
#endif


--3x4/pzKEGx
Content-Type: text/plain
Content-Description: foo.cpp
Content-Disposition: inline;
	filename="foo.cpp"
Content-Transfer-Encoding: 7bit

/* foo.cpp */

#include <iostream.h>
#include "private.h"
#include "public.h"

void foo::bar(void)
{
	cout << "hello, world" << endl;
}

void foo_bar(void *f)
{
	((foo *) f)->bar();
}

void *new_foo(void)
{
	return (void *) new foo;
}


--3x4/pzKEGx
Content-Type: text/plain
Content-Description: main.c
Content-Disposition: inline;
	filename="main.c"
Content-Transfer-Encoding: 7bit

/* main.c */

#include "public.h"

int main(void)
{
	void *f = new_foo();
	foo_bar(f);
	return 0;
}


--3x4/pzKEGx--
