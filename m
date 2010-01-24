From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: =?utf-8?B?UmU6IFJlOiBGdW5jdGlvbiBwb2ludGVycw==?=
Date: Sun, 24 Jan 2010 07:59:11 +0000
Message-ID: <19291.64975.167901.592298@cerise.gclements.plus.com>
References: <27253432.post@talk.nabble.com>
	<19288.9425.111644.585101@cerise.gclements.plus.com>
	<70016fb31001231427n225eb4f6i5c78da6f9223cf01@mail.gmail.com>
	<201001241003091879376@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <201001241003091879376@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?utf-8?B?c2ltb24=?= <unbutun@gmail.com>
Cc: =?utf-8?B?TWlsaW5kIEEgQ2hvdWRoYXJ5?= <milindchoudhary.lkml@gmail.com>, =?utf-8?B?a3VtYXIxMQ==?= <ravikumar.chakram@gmail.com>, =?utf-8?B?bGludXgtYy1wcm9ncmFtbWluZw==?= <linux-c-programming@vger.kernel.org>


simon wrote:

> char (*pa())[4]; 
> is this mean that an pa function pointer with return value like a char a[4] and it's argument is nothing ?
> 
> right?

Wrong.

1. pa is not a pointer to a function, it's a function which returns a
pointer. "()" has higher precedence than "*", so "*pa()" is parsed as
"*(pa())" (function returning pointer) rather than "(*pa)()" (pointer
to function).

2. An empty parameter list "()" indicates that the function takes
unspecified arguments. A function which takes no arguments has
"(void)" as the parameter list.

-- 
Glynn Clements <glynn@gclements.plus.com>
