From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Tue, 29 Jun 2004 17:32:38 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040629143238.GD6335@luna.mooo.com>
References: <40E09FC4.50800@ig.com.br> <16608.44836.384260.844173@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16608.44836.384260.844173@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

On Tue, Jun 29, 2004 at 12:52:04AM +0100, Glynn Clements wrote:
> 
> Luciano Moreira - igLnx wrote:
> 
> > Is very commom in Java, the declaration of "static const" attributes 
> > into class escope. Is possible to do anything similar in C++ ?
> > Using another techniques ?
> > 
> > All we need is to have a public static symbol into a class escope that 
> > can be used to declare a array, intead of using a lot of global symbols.
> 
> It appears that you are allowed to initialise constant static members
> within the declaration, so you can do this:
> 
> 	class Foo
> 	{
> 	public:
> 		static const int DEFSIZE = 100;
> 	};
> 	
> 	class Bar
> 	{
> 	public:
> 		char myArray[Foo::DEFSIZE];
> 	};
> 
> This compiles with "g++ -ansi -pedantic", so it's probably standard
> ISO C++.

Does this also work when put in a header or only when put directly in
the cpp file?

> 
> -- 
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>  +++++++++++++++++++++++++++++++++++++++++++
>  This Mail Was Scanned By Mail-seCure System
>  at the Tel-Aviv University CC.
> 
