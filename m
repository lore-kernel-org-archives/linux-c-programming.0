From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Tue, 29 Jun 2004 16:10:15 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40E1BE97.1090209@ig.com.br>
References: <40E09FC4.50800@ig.com.br>	<16608.44836.384260.844173@cerise.nosuchdomain.co.uk>	<40E17D0A.2030206@ig.com.br> <20040629192621.1a99c86c.henry.margies@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040629192621.1a99c86c.henry.margies@gmx.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-c-programming@vger.kernel.org

Because, the compiler doesn't know the value of the symbol DEFSIZE when 
it is used for a array declaration, like as:
char myArray[MYCLASS::DEFSIZE];

Then, we have the conclusion that the value atribution should be in 
header file (.h) - for that case. But, I tried the use of "enum", and 
now it's working well.

Luciano

Henry Margies wrote:

>Just put the definition in the cpp file.
>
>Header File:
>class Foo
>{
>	public:
>		static const int DEFSIZE;
>};
>
>in CPP-File:
>
>const int Foo::DEFSIZE=100
>
>
>Why does this not work for you?
>
>
>Henry
>
>  
>
