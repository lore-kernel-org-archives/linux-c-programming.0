From: "Anthony Nguyen" <nguyenanthony@wanadoo.fr>
Subject: RE: dynamic allocation of array of structures
Date: Sat, 22 Mar 2003 21:27:19 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030322202720.267284000B9@mwinf0501.wanadoo.fr>
References: <Pine.LNX.4.21.0303222034440.5699-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0303222034440.5699-100000@hestia>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

typedef struct Apeople { 
char *name;
 int telnr;
} Tpeople;

...

Tpeople *toto;

toto = (Tpeople *)(malloc (sizeof Tpeople) * <the number of elements you
want to allocate>);

But I think that you were searching a "proper way" to implement it, isn't it
:?

A.N.

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of J.
Sent: Saturday, March 22, 2003 8:48 PM
To: linux-c-programming@vger.kernel.org

Hello,

struct {
 char *name;
 int telnr;
} people[100];

Instead of statically allocating an array of 100 of these structures like
I have done, I want to dynamically allocate the array at run-time and
resize the number of structures some where at any time in the main
program. 

I know how to resize char arrays and int arrays but I never (re)sized an
array of structres which can be accessed with something as:
``people[4].name''. 
In Google nothing really usefull turns up.

Can this be done without having to resort to other implementations like
linked lists etc.. ? If so how ?

Thank you in advance.

J.

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

