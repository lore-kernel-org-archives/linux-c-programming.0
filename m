From: "Mohan Rao A. J." <mohan@netcontinuum.com>
Subject: Re: linking at run time.
Date: Thu, 10 Jul 2003 14:04:14 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0307101359270.1578-100000@mrao.netcontinuum.com>
References: <003501c346c8$d32cd4c0$ed64a8c0@descartes>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <003501c346c8$d32cd4c0$ed64a8c0@descartes>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: linux-c-programming@vger.kernel.org


Hi,

You can use env variable 'LD_LIBRARY_PATH', which is
a colon-separated list of directories in  which  to
search  for ELF libraries at execution-time.

or 

if you want to make your lib directory as global to search for
libraries by the loader, add an entry in /etc/ld.so.conf and run 
ldconfig.


--
Mohan


On Thu, 10 Jul 2003, John T. Williams wrote:

> Is there a way to cause an exicutable to link against a specific library at
> run time.
> 
> let me explain a little
> I'm creating a dynamic library like this
> 
> $ gcc pop3.c -o libpop3.so -shared  -I../include
> 
> then creating an exicutable like this
> 
> $ gcc main.c -o getmail -L../lib -I../include -lpop3
> 
> both work fine.
> 
> in order to run my exicutable I have been copying my libpop3.so file to
> /use/lib
> then running ldconfig
> 
> and the file exicutes fine.  but its a bit of a pain in the butt to do this
> every time I recompile the library.
> 
> I was wondering if there was any way to run my program, getmail, so that ldd
> would link it against a specified file so that I didn't have to put a
> library that I'm developing into my /usr/lib folder.  nor have to run
> ldconfig as root.
> 
> I hope this makes sense.
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Mohan

