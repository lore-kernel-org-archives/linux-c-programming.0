From: wwp <subscript@free.fr>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Fri, 2 Jul 2004 09:47:55 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040702094755.73ee5ec6@tethys.solarsys.org>
References: <40E09FC4.50800@ig.com.br>
	<16608.44836.384260.844173@cerise.nosuchdomain.co.uk>
	<40E17D0A.2030206@ig.com.br>
	<20040629192621.1a99c86c.henry.margies@gmx.de>
	<40E1BE97.1090209@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40E1BE97.1090209@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

Hello Luciano,


On Tue, 29 Jun 2004 16:10:15 -0300 Luciano Moreira - igLnx <lucianolnx@ig.com.br> wrote:

> Because, the compiler doesn't know the value of the symbol DEFSIZE when 
> it is used for a array declaration, like as:
> char myArray[MYCLASS::DEFSIZE];
> 
> Then, we have the conclusion that the value atribution should be in 
> header file (.h) - for that case. But, I tried the use of "enum", and 
> now it's working well.

Of course #define'd values can be used in array range. Such value is not
dynamically interpreted, since the pre processor is performing substitution of
macros before the compiler gets the file.

Did you try to maintain you const int in the header file and to encapsulate it
like this:

[beginning of .h file]
#ifndef MY_CLASS_H
#define MY_CLASS_H

// .. here the previous content of your .h file

#endif
[EOF]


My 2 cts..


Regards,

> Henry Margies wrote:
> 
> >Just put the definition in the cpp file.
> >
> >Header File:
> >class Foo
> >{
> >	public:
> >		static const int DEFSIZE;
> >};
> >
> >in CPP-File:
> >
> >const int Foo::DEFSIZE=100
> >
> >
> >Why does this not work for you?
> >
> >
> >Henry
> >
> >  
> >
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
wwp
