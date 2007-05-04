From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: -ffunction-sections -Wl,--gc-sections trick and class members
Date: Fri, 4 May 2007 14:31:17 +0100
Message-ID: <17979.13733.881263.496494@cerise.gclements.plus.com>
References: <46277EF0.900@gmail.com>
	<17959.34609.888091.432080@cerise.gclements.plus.com>
	<4630E1C7.40804@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4630E1C7.40804@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> > OTOH, I suspect that virtual methods are always "used" when
> > intialising the virtual method table, so it's less likely that they
> > could be omitted.
> > 
> > If you want a definite answer, test it.
> 
> Well I tested it and it is obvious that the trick is able to weed out 
> unused class members too -- run the contents of the attachment.
> 
> But I did not comprehend how you suspect that having virtual function (I 
> presume methods are the same as functions) will create different 
> results.

Non-virtual methods are referenced directly from the object file in
which they are used. If you don't call them, they won't be referenced.

Virtual methods are called through a function pointer in the virtual
method table. The only direct reference to the function will be in the
code which initialised the table. But that initialisation will occur
regardless of whether or not anything calls the method.

-- 
Glynn Clements <glynn@gclements.plus.com>
