From: Benoit Fouet <benoit.fouet@purplelabs.com>
Subject: Re: threads and kernel
Date: Mon, 22 Oct 2007 15:27:32 +0200
Message-ID: <471CA544.5050701@purplelabs.com>
References: <471B5276.9010800@gmail.com>	 <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>	 <471C4849.2040409@purplelabs.com> <6a00c8d50710220601s6aa10d26u762215a3989bf6cd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50710220601s6aa10d26u762215a3989bf6cd@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hi Steve,

Steve Graegert wrote:
> Hi Benoit,
>
> On 10/22/07, Benoit Fouet <benoit.fouet@purplelabs.com> wrote:
>   
>> Hi,
>>
>> Steve Graegert wrote:
>>     
>>> As a side note: you can safely use dlopen()  to load shared libraries,
>>> whether or not they depend on libpthread.so, as long as the main
>>> program was initially threaded.  The other way round is dangerous and
>>> mostly not allowed.
>>>
>>>
>>>       
>> could you please elaborate a bit on that ? i cannot see why this is
>> dangerous.
>>     
>
> I was referring to making an application multithreaded at runtime.
> Therefore you cannot use dlopen() to dynamically add libpthread.so to
> a process when the main program is not __initially threaded__.  By
> "initially threaded" I mean that the libpthread.so  library is
> initialized at program start, either because the main program links
> against libpthread.so directly, or because it links against some other
> shared library that links against libpthread.so.
>
> Dynamically changing the process environment from "nonthreaded" to
> "threaded" is dangerous and rarely useful (I actually doubt that this
> "feature" is useful at all).

If i understand correctly what you're saying, you cannot have something
like:

int main(int argc, char *argv[]) {
  /* ... */
  foo = dlopen("bar.so");
  /* use bar.so functions, clean, etc... */
}

if bar.so is multithreaded (and thus, linked to libpthread.so) and you
don't compile your main program with -lpthread option.
did i understand you right ?

this would mean you may need to link against pthread library, just in
case the library(ies) you dlopen might use it ?

>   Only a few systems implementing POSIX
> threads allow the possibility (for example, libc.so on many systems
> contains "stub" versions of the POSIX functions that are preempted by
> linking with libpthread.so but will not be preempted by later loading
> libpthread.so with dlopen()).  In other words, calls to
> pthread_create() might fail with ENOSYS, and pthread_mutex_lock()
> might continue to succeed without any memory references to the lock.
>
>   

Ben

