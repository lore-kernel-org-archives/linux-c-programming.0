From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: development tools for interpreting code
Date: Tue, 21 Dec 2004 13:39:02 -0500
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA3624@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'soraberri' <421246@posta.unizar.es>, linux-c-programming@vger.kernel.org

soraberri wrote:

>at some point of the code I find a call to a function or a typedef name 
>(for exmple str2ba) and I would like to find the header file or even the 
>source file where this function (or type) is defined. I can only use the 
>Grep:str2ba command found under "Find in files..." dialog but sometimes 
>this is not suitable because I have to tell manually the path from the 
>starting point of the search, and if I don't know exactly the rigth 
>folder, the number of results searched can be too many for examining. I 
>guess it may be a better way, since the program compiles and has the 
>appropiate includes (#include <header>), so the compiler must know where 
>the function is defined.

As others have suggested, ctags, cflow and cscope are three very useful programs for 
dealing with this.  In addition to the these two, I also find `calltree'
(see ftp://ftp.berlios.de/pub/calltree/) to be very useful.  `calltree' produces
a call graph for given set of input files - useful to understand the static structure
of a program.

In addition, valgrind using the calltree (or is it now callgrind) skin along with 
cachegrind produces useful information during the execution of the program.


Hope this helps,
George


