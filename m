From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Mon, 28 Jun 2004 22:52:20 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16608.37652.39892.413586@cerise.nosuchdomain.co.uk>
References: <40E090AF.6090300@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40E090AF.6090300@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Luciano Moreira - igLnx wrote:

> Sorry for this rookie question, but I'm not a experienced C++ programmer 
> (I m a old C-ANSI programmer, not in C++)
> 
> How can us create a kind of "static const" attribute into a class ? I 
> need to use it like as:
> char myArray[MYCLASS::DEFSIZE];

That won't work. Array sizes have to be constant expressions
(expressions which contain only literal values).

> Where "DEFSIZE" whould be a "static const" member (or another type) of 
> MYCLASS.
> 
> What do I already tried ? Follow:
> class MYCLASS {
>     public:
>        static const int DEFSIZE;
> };
> const int DEFSIZE = 100;
> 
> But, when the file "MYCLASS.h" is included more than one file ".cpp", 
> the linker says that the member "MYCLASS::DEFZISE" "was already defined 
> in 'filename'". And don't have occurrences of compiler errors, only on 
> linking.

Definitions belong in source (.cpp) files, not header files.

-- 
Glynn Clements <glynn.clements@virgin.net>
