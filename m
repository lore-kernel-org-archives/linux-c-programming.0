From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: type qualifiers on function return types?
Date: Fri, 9 Dec 2005 14:04:09 -0500 (EST)
Message-ID: <Pine.LNX.4.63.0512091403170.30902@localhost.localdomain>
References: <Pine.LNX.4.63.0512080728490.10304@localhost.localdomain>
 <6a00c8d50512080858n70ef1937n8ccc2c96b9eb799c@mail.gmail.com>
 <Pine.LNX.4.63.0512081257140.7428@localhost.localdomain>
 <17305.54523.539369.296130@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17305.54523.539369.296130@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Steve Graegert <graegerts@gmail.com>, C programming list <linux-c-programming@vger.kernel.org>

On Fri, 9 Dec 2005, Glynn Clements wrote:

> Did you mean to declare the pointers as "volatile", rather than the
> function's return value?
>
> Pointer qualifiers go after the "*", e.g.
>
> 	typedef struct blah {
> 	  void           (**volatile start_address)(void);
> 	  char*          volatile stack;
> 	  void           (**volatile manual_start_address)(void);
> 	  ...

it wasn't what *i* was declaring, this was code i inherited from
elsewhere and it was exactly as i posted it earlier, so i think we've
established that, yes, it was silly code.

rday
