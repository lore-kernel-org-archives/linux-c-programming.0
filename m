From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: i386 x SPARC
Date: Thu, 19 Sep 2002 00:48:19 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15753.4291.717024.716062@cerise.nosuchdomain.co.uk>
References: <20020918225856Z269456-685+50331@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020918225856Z269456-685+50331@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: RCS <cryptik@ig.com.br>
Cc: linux-c-programming@vger.kernel.org


RCS wrote:

>   I am new to this discussion group. And I need help. 
> 
>   Is it possible to compile a software with gcc under Linux for another 
> plataform? 
>   For example, I am using Linux under Intel and I want to create a software 
> for SPARC (RISC - SUN processors). 
>   Is that possible? Does kylix or gcc enables me to do that? 

It is possible, but you need versions of gcc and binutils which were
compiled for the desired target platform. I'm not aware of any
precompiled binaries, so you will probably need to compile them
yourself.

See the Cross-GCC FAQ at:

	http://www.objsw.com/CrossGCC/

-- 
Glynn Clements <glynn.clements@virgin.net>
