From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Division in loop
Date: Fri, 11 Sep 2009 08:26:39 +0100
Message-ID: <19113.64431.481278.62059@cerise.gclements.plus.com>
References: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
	<20090908145838.GF947@comcast.net>
	<19110.64410.498993.60369@cerise.gclements.plus.com>
	<34e1241d0909081937y5ecbd0davf7edbba9d9b201a0@mail.gmail.com>
	<34e1241d0909081939x2d20ab45t57fe3f760ae447d0@mail.gmail.com>
	<19112.19543.594103.477988@cerise.gclements.plus.com>
	<34e1241d0909100001u4a3b338crf225e7fc9083a806@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <34e1241d0909100001u4a3b338crf225e7fc9083a806@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Randi Botse wrote:

> Thanks Glynn for let me know that the void* pointer arithmetic is
> undefined, and gcc automatically cast it to char* pointer... is this
> because void* doesn't have a size?

Technically, it's because the standard says that it's undefined.

Pointer arithmetic is defined in terms of pointers to array elements,
e.g. if you have:

	int foo[N];
	int *p = &foo[A];
	int *q = p+B;
	int *r = &foo[A+B];

then r==q. But you can't have an array of "void", so pointer
arithmetic on void* isn't meaningful.

> im curious when i do sizeof(void*),
> my machine tell me sizeof(void*) is 4kb... i thnk when i do (void* +
> 1) that's means "4 kb after void*"?....

The result of sizeof is in bytes (technically, "char"s; sizeof(char)
is guaranteed to be 1).

The result of "sizeof" applied to any pointer type will typically be 4
bytes on 32-bit systems or 8 bytes on 64-bit systems. Although it's
possible for pointers to different types to have different sizes, it's
rare.

> i run the code in GNOME terminal, that's means stdout connected to xterm?

No, to Gnome terminal; xterm is similar.

It's possible that the behaviour which you experience is a property of
the terminal emulator. You might try running the program on a
different terminal emulator, or on a VT, to see if the same problem
occurs there.

-- 
Glynn Clements <glynn@gclements.plus.com>
