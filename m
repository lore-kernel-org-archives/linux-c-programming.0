From: "William N. Zanatta" <william@veritel.com.br>
Subject: Re: Misc C question
Date: Thu, 20 Jun 2002 09:46:53 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3D11CEBD.8050102@veritel.com.br>
References: <20020619214332.A299@nietzsche>    <010701c21808$1a7315b0$0201a8c0@ws1> <20020619234424.A480@nietzsche> <002701c21818$8a302d10$0201a8c0@ws1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mike <ruler@isolate.net>
Cc: xmp <xmp@multipasto.net.co>, linux-c-programming@vger.kernel.org

I think we have a mistake here.
It seems that what was asked is whether the file being opened has or not 
  a read permission.
Yes, your aplication will compile normally and if you don't have read 
permissions on the file, fopen() will return NULL and set errno. By the 
way, checking errno is a good way of tracking down errors, try it.

The man page says (both Linux and Solaris):
"Upon  successful  completion  fopen,  fdopen  and  freopen
return a FILE pointer.  Otherwise, NULL  is  returned  and
the global variable errno is set to indicate the error."

see ya

william

-- 
Perl combines all of the worst aspects of BASIC, C and line noise.
                 -- Keith Packard

Somebody called 'mike' tried to say something! Take a look:
> Hi,
> 
> "r" is for readonly, if you don't include what it should do with the file,
> you will get an error on compile. :)  The possible options are "r", "w",
> "r+" "w+", and more.  You should consult a book/website which will explain
> everything you need to know about them :)
> 


