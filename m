From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Tue, 29 Jun 2004 04:10:39 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040629011039.GB6335@luna.mooo.com>
References: <40E090AF.6090300@ig.com.br>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40E090AF.6090300@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

On Mon, Jun 28, 2004 at 06:42:07PM -0300, Luciano Moreira - igLnx wrote:
> Sorry for this rookie question, but I'm not a experienced C++ programmer 
> (I m a old C-ANSI programmer, not in C++)
> 
> How can us create a kind of "static const" attribute into a class ? I 
> need to use it like as:
> char myArray[MYCLASS::DEFSIZE];
> Where "DEFSIZE" whould be a "static const" member (or another type) of 
> MYCLASS.
> 
> What do I already tried ? Follow:
> class MYCLASS {
>    public:
>       static const int DEFSIZE;
> };
> const int DEFSIZE = 100;
> 

The line setting the value should in a .cpp file not a header. You may
only set the value once for a variable during compilation (the value is
put in the actual file, not generated on startup - the data section)

I am not sure if a static const may be used for array sizes? IIRC it is
possible under c++ and not on c but far away from sure on that.

Another option is to define the value as an enum and then you still get
type checking and you can encapsulate it in a class unlike a define,
but it acts like a define for all other purposes (you can use it as a
test option for a case statement).

> But, when the file "MYCLASS.h" is included more than one file ".cpp", 
> the linker says that the member "MYCLASS::DEFZISE" "was already defined 
> in 'filename'". And don't have occurrences of compiler errors, only on 
> linking.
> 
> Thanks,
> 
> Luciano
> 
> -------------------------------------------
> FOLLOW SOME COMPILER FULL ERROR MESSAGE (MSVC++ 6.0):
> HMMessageProcessor_Canal.obj : error LNK2005: "public: static unsigned 
> int const MMDadosCarteira::_OFFSET_CARTEIRA2B" 
> (?_OFFSET_CARTEIRA2B@MMDadosCarteira@@2IB) already defined in HMApp.obj
> 
> HMMessageProcessor_Canal.obj : error LNK2005: "public: static unsigned 
> int const MUDadosRecarga::_OFFSET_CARTEIRA2B" 
> (?_OFFSET_CARTEIRA2B@MUDadosRecarga@@2IB) already defined in HMApp.obj
> 
> PS: I didn't code "static unsigned int const". In my source code I coded 
> "static const unsigned" only. I don't know why MSVC "translated" my code.
> 
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> +++++++++++++++++++++++++++++++++++++++++++
> This Mail Was Scanned By Mail-seCure System
> at the Tel-Aviv University CC.
> 
