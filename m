From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: gcc/g++ fails to compile
Date: Sun, 3 Aug 2008 04:31:46 +0100
Message-ID: <18581.9890.170104.577257@cerise.gclements.plus.com>
References: <327486.3175.qm@web59705.mail.ac4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <327486.3175.qm@web59705.mail.ac4.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil C <hpypenguin@yahoo.com>
Cc: Steve Graegert <graegerts@gmail.com>, C Programming Mailing List <linux-c-programming@vger.kernel.org>


Phil C wrote:

> > It is hard to tell what the problem is without sample code and the
> > exact error message along with some details about your system
> > configuration.
> 
> 
> >Regards
> 
>  >       \Steve
> 
> Sorry for the lack of information I hope this makes the situation more
> clear. I'm using Ubuntu Linux 8.04 and every current stable patch
> kernel wise. GCC is version 4.3 Remaining info is as follows.
> 
> //Sample Code
> 
> #include<iostream>
> using namespace std;
> 
> int main() {
>     cout <<"Hello World";
>     return 0;
> }
> 
> //Error message copied from terminal
> 
> /tmp/ccERz0tv.o:
> In function `std::__verify_grouping(char const*, unsigned int,
> std::basic_string<char, std::char_traits<char>,
> std::allocator<char> > const&)':
> test.cpp:(.text+0xe):
> undefined reference to `std::basic_string<char,
> std::char_traits<char>, std::allocator<char> >::size()
> const'

[more "undefined reference" errors snipped]

For linking, you need to either use "g++" (rather than "gcc"), or
explicitly link against the C++ library with "-lstdc++". IOW:

	g++ test.cc
or:
	gcc test.cc -lstdc++

-- 
Glynn Clements <glynn@gclements.plus.com>
