From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: anything to do with pointer to functions maybe?
Date: Thu, 30 Dec 2004 11:26:12 +0000
Message-ID: <16851.58836.918096.548317@gargle.gargle.HOWL>
References: <cqe6ed$ldf$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <cqe6ed$ldf$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: soraberri <421246@posta.unizar.es>
Cc: linux-c-programming@vger.kernel.org


soraberri wrote:

> I'm having troubles understanding code:
> 
> what type is __sighandler_t if it is defined this way:?
> typedef void (*__sighandler_t) (int);

Pointer to function taking an int argument and returning void.

C's type syntax uses the same grammatical structure as expressions, so
the above is interpreted as saying that the expression:

	(*__sighandler_t) (int)

has type "void".

The syntax <expr>(<args>) indicates a function call where the function
is <expr> and the arguments are <args>, so:

	(*__sighandler_t) (int)

is a function call where (*__sighandler_t) is the function and the
arguments consist of a single integer. Coupled with the knowledge that
the overall type is "void", the expression:

	(*__sighandler_t)

must be a function taking an integer argument and returning void.

If an expression *P has type T then the type of P is "pointer to T",
so __sighandler_t must be a pointer to a function taking an integer
argument and returning void.

-- 
Glynn Clements <glynn@gclements.plus.com>
