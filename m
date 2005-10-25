From: Christoph Bussenius <busseniu@cip.physik.uni-muenchen.de>
Subject: Re: setenv and dlopen
Date: Tue, 25 Oct 2005 20:20:07 +0200
Message-ID: <20051025182007.GC6673@opaque.pepe>
References: <1130262724.7414.14.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1130262724.7414.14.camel@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henry Margies <henry.margies@gmx.de>
Cc: linux-c-programming@vger.kernel.org

On Tue, Oct 25, 2005 at 07:52:04PM +0200, Henry Margies wrote:
> Hi all,

Hi Henry,

> I have a problem using dlopen and setting the LD_LIBRARY_PATH with
> putenv or setenv. 

I think this is because putenv does not really modify your process'es
environment (which is not possible afaik), but rather remembers the
given variable until you call some exec* function.  libc will then pass
the new environment to execve so that the new program will have the
modified environment.

Regards,
Christoph

-- 
``There's no dark side of the moon, really
Matter of fact, it's all dark''

--Pink Floyd
