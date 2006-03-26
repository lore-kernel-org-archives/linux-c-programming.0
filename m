From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Accessing a class' member functions
Date: Sun, 26 Mar 2006 17:09:08 +0100
Message-ID: <17446.48292.549427.996203@cerise.gclements.plus.com>
References: <200603260931.05639.samjnaa@gmail.com>
	<6a00c8d50603260015ud777b7fgfbfa02f567cf8b@mail.gmail.com>
	<200603261809.18686.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603261809.18686.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> > Please note that static member functions can only access global data
> > or static class data and can not be declared virtual.
> 
> So if I want some globally accessible function that is not limited to 
> accessing global or static data what should I do?

Huh? What other data do you want to access? To access the member
variables of an instance, you need to actually /have/ an instance.

-- 
Glynn Clements <glynn@gclements.plus.com>
