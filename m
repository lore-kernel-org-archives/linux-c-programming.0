From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Tue, 29 Jun 2004 00:52:04 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16608.44836.384260.844173@cerise.nosuchdomain.co.uk>
References: <40E09FC4.50800@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40E09FC4.50800@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Luciano Moreira - igLnx wrote:

> Is very commom in Java, the declaration of "static const" attributes 
> into class escope. Is possible to do anything similar in C++ ?
> Using another techniques ?
> 
> All we need is to have a public static symbol into a class escope that 
> can be used to declare a array, intead of using a lot of global symbols.

It appears that you are allowed to initialise constant static members
within the declaration, so you can do this:

	class Foo
	{
	public:
		static const int DEFSIZE = 100;
	};
	
	class Bar
	{
	public:
		char myArray[Foo::DEFSIZE];
	};

This compiles with "g++ -ansi -pedantic", so it's probably standard
ISO C++.

-- 
Glynn Clements <glynn.clements@virgin.net>
