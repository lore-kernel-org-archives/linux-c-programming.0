From: Shriramana Sharma <samjnaa@gmail.com>
Subject: synonymous error messages?
Date: Thu, 24 May 2007 12:40:33 +0530
Message-ID: <46553A69.9000409@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

g++ -c on the following code fragment:

void f ( void ) {
	class Local {
		static int j ;
	} ;
}

gives the following errors:

static-member-in-local-class.cpp: In function =91void f()=92:
static-member-in-local-class.cpp:3: error: local class =91class=20
f()::Local=92 shall not have static data member =91int f()::Local::j=92
static-member-in-local-class.cpp:3: error: field =91f()::Local::j=92 in=
=20
local class cannot be static

I understand that local classes cannot have static members because it i=
s=20
not possible to describe the data member at file scope in order to=20
define it.

But what is the difference between "local class shall not have static=20
data member" and "field in local class cannot be static"?

Thanks as always.

Shriramana Sharma.

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
