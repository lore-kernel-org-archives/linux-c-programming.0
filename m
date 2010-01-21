From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Function pointers
Date: Thu, 21 Jan 2010 09:56:33 +0000
Message-ID: <19288.9425.111644.585101@cerise.gclements.plus.com>
References: <27253432.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <27253432.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kumar11 <ravikumar.chakram@gmail.com>
Cc: linux-c-programming@vger.kernel.org


kumar11 wrote:

> Could you please explain the meaning of below declaration statement.
> 
> char (*pa())[4]; 

"pa" is a function returning a pointer to an array of four characters.

C declarations work by declaring an expression involving the
identifier as having a named type (in this case, "char").

"(*pa())[i]" is a character, for 0 <= i < 4.

Therefore:

"(*pa())" is an array of four characters.

Therefore:

"pa()" is a pointer to an array of four characters.

Therefore:

"pa" is a function returning a pointer to an array of four characters.

-- 
Glynn Clements <glynn@gclements.plus.com>
