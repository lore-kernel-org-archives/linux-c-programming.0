From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Tue, 29 Jun 2004 11:30:34 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40E17D0A.2030206@ig.com.br>
References: <40E09FC4.50800@ig.com.br> <16608.44836.384260.844173@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16608.44836.384260.844173@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Of corse, it's was my first attempt. But, the compiler says that "pure 
specifier can only be specified for functions". Thus the below code 
seems to be incorrect.

	class Foo
	{
	public:
		static const int DEFSIZE = 100;
	};


Luciano


Glynn Clements wrote:

Glynn Clements wrote:

>Luciano Moreira - igLnx wrote:
>
>  
>
>>Is very commom in Java, the declaration of "static const" attributes 
>>into class escope. Is possible to do anything similar in C++ ?
>>Using another techniques ?
>>
>>All we need is to have a public static symbol into a class escope that 
>>can be used to declare a array, intead of using a lot of global symbols.
>>    
>>
>
>It appears that you are allowed to initialise constant static members
>within the declaration, so you can do this:
>
>	class Foo
>	{
>	public:
>		static const int DEFSIZE = 100;
>	};
>	
>	class Bar
>	{
>	public:
>		char myArray[Foo::DEFSIZE];
>	};
>
>This compiles with "g++ -ansi -pedantic", so it's probably standard
>ISO C++.
>
>  
>
