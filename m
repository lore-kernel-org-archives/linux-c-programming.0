From: elathan@phys.uoa.gr
Subject: Re: function pointers in C++
Date: Mon, 15 Mar 2004 12:39:52 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1079347192.405587f8dea53@webmail.uoa.gr>
References: <1079342899.405577335bb24@webmail.uoa.gr> <20040315102750.GY17857@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040315102750.GY17857@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-c-programming@vger.kernel.org

 
Jan-Benedict Glaw <jbglaw@lug-owl.de>: 
> On Mon, 2004-03-15 11:28:19 +0200, elathan@phys.uoa.gr <elathan@phys.uoa.gr> 
> > void taz(int (*f)(int));  
>  
> You're looking for "static"ally declared member functions. 
 
And in that case I can't use 'this' inside the function. Brilliant... :-( 
 
Thanx for the reply. 
 
Regards, 
--  

