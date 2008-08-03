From: Kristof Provost <Kristof@sigsegv.be>
Subject: Re: gcc/g++ fails to compile
Date: Sun, 3 Aug 2008 11:52:11 +0200
Message-ID: <20080803095211.GA1520@nereid>
References: <327486.3175.qm@web59705.mail.ac4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <327486.3175.qm@web59705.mail.ac4.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil C <hpypenguin@yahoo.com>
Cc: Steve Graegert <graegerts@gmail.com>, C Programming Mailing List <linux-c-programming@vger.kernel.org>

On 2008-08-02 17:36:07 (-0700), Phil C <hpypenguin@yahoo.com> wrote:
> >It is hard to tell what the problem is without sample code and the exact error message along with some details >about your system configuration.
> 
> 
> >Regards
> 
>  >       \Steve
> 
> Sorry for the lack of information I hope this makes the situation more clear. I'm using Ubuntu Linux 8.04 and every current stable patch kernel wise. GCC is version 4.3 Remaining info is as follows.
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
> test.cpp:(.text+0x59): undefined reference to
> `std::basic_string<char, std::char_traits<char>,
> std::allocator<char> >::operator[](unsigned int) const'
> test.cpp:(.text+0x97):
> undefined reference to `std::basic_string<char,
> std::char_traits<char>, std::allocator<char>
> >::operator[](unsigned int) const'
> test.cpp:(.text+0xdf):
> undefined reference to `std::basic_string<char,
> std::char_traits<char>, std::allocator<char>
> >::operator[](unsigned int) const'
> /tmp/ccERz0tv.o: In function `main':
> test.cpp:(.text+0x128): undefined reference to `std::cout'
> test.cpp:(.text+0x12d):
> undefined reference to `std::basic_ostream<char,
> std::char_traits<char> >& std::operator<<
> <std::char_traits<char> >(std::basic_ostream<char,
> std::char_traits<char> >&, char const*)'
> /tmp/ccERz0tv.o: In function `__static_initialization_and_destruction_0(int, int)':
> test.cpp:(.text+0x15d): undefined reference to `std::ios_base::Init::Init()'
> /tmp/ccERz0tv.o: In function `__tcf_0':
> test.cpp:(.text+0x1aa): undefined reference to `std::ios_base::Init::~Init()'
> /tmp/ccERz0tv.o:(.eh_frame+0x11): undefined reference to `__gxx_personality_v0'
> collect2: ld returned 1 exit status
> 
Try 'sudo apt-get install libstdc++6'.
If that doesn't work please provide the exact command you used to
compile.

Kristof
