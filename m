From: fabio <fabio@crearium.com>
Subject: Re: gcc -static -ggdb not working
Date: Wed, 26 Oct 2005 01:28:22 -0600
Message-ID: <435F3016.6060103@crearium.com>
References: <435F1695.3050206@crearium.com> <6a00c8d50510260031s6aae8f7i5fd327050d284e4d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50510260031s6aae8f7i5fd327050d284e4d@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Steve Graegert wrote:

>On 10/26/05, fabio <fabio@crearium.com> wrote:
>  
>
>>Hello, I wonder why I cant dbug C programs on Solaris/sparc with gcc:
>>
>>-bash-3.00$ cat 1.c;\gcc -static -ggdb 1.c -o 1
>>main(){
>>       printf("hello world\n");
>>}
>>ld: fatal: library -lc: not found
>>ld: fatal: library -lc: not found
>>ld: fatal: File processing errors. No output written to 1
>>collect2: ld returned 1 exit status
>>    
>>
>
>Fabio,
>
>First of all, what's the GCC version and what does your
>LD_LIBRARY_PATH and LD_LIBRARY_PATH_64 look like?  Secondly, does it
>work without -g or -ggdb options?  Looks like gcc is looking for
>64-bit libs in the place where 32-bit libs are usually found.  You may
>also want to check where libc.so.1 is located.
>
>  
>
-bash-3.00$ find / -name "libc.so.1" -print 2>/dev/null
/usr/lib/sparcv9/libc.so.1
/usr/lib/libc.so.1
/usr/lib/libp/libc.so.1
/usr/lib/libp/sparcv9/libc.so.1
/lib/sparcv9/libc.so.1
/lib/libc.so.1
-bash-3.00$ echo $LD_LIBRARY_PATH ; \gcc -v
/usr/lib:/usr/local/lib:/usr/dt/lib:/opt/csw/lib:/usr/sfw/lib:/usr/local/ssl/lib:/usr/apache2/lib:/usr/sfw/lib
Reading specs from /usr/local/lib/gcc/sparc-sun-solaris2.9/3.4.2/specs
Configured with: ../configure --with-as=/usr/ccs/bin/as 
--with-ld=/usr/ccs/bin/ld --disable-nls
Thread model: posix
gcc version 3.4.2
-bash-3.00$ uname -srm
SunOS 5.10 sun4u
-bash-3.00$

The option -g works fine but I need the option ggdb. Option -static 
doesnt work either. But It compiles ok if no option is given.

Sorry for the offtopic, any help will be appreciatted.

Thanks,
fab.

