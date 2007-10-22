From: Benoit Fouet <benoit.fouet@purplelabs.com>
Subject: Re: threads and kernel
Date: Mon, 22 Oct 2007 15:38:21 +0200
Message-ID: <471CA7CD.5070702@purplelabs.com>
References: <471B5276.9010800@gmail.com>	 <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>	 <471C4849.2040409@purplelabs.com>	 <6a00c8d50710220601s6aa10d26u762215a3989bf6cd@mail.gmail.com>	 <471CA544.5050701@purplelabs.com> <6a00c8d50710220631u7a9589bcjccdbca234184edaf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50710220631u7a9589bcjccdbca234184edaf@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hi,

Steve Graegert wrote:
> Benoit,
>
> On 10/22/07, Benoit Fouet <benoit.fouet@purplelabs.com> wrote:
>   
>> Hi Steve,
>>
>> Steve Graegert wrote:
>>     
>>> Hi Benoit,
>>>
>>> On 10/22/07, Benoit Fouet <benoit.fouet@purplelabs.com> wrote:
>>>
>>>       
>>>> Hi,
>>>>
>>>> Steve Graegert wrote:
>>>>
>>>>         
>>>>> As a side note: you can safely use dlopen()  to load shared libraries,
>>>>> whether or not they depend on libpthread.so, as long as the main
>>>>> program was initially threaded.  The other way round is dangerous and
>>>>> mostly not allowed.
>>>>>
>>>>>
>>>>>
>>>>>           
>>>> could you please elaborate a bit on that ? i cannot see why this is
>>>> dangerous.
>>>>
>>>>         
>>> I was referring to making an application multithreaded at runtime.
>>> Therefore you cannot use dlopen() to dynamically add libpthread.so to
>>> a process when the main program is not __initially threaded__.  By
>>> "initially threaded" I mean that the libpthread.so  library is
>>> initialized at program start, either because the main program links
>>> against libpthread.so directly, or because it links against some other
>>> shared library that links against libpthread.so.
>>>
>>> Dynamically changing the process environment from "nonthreaded" to
>>> "threaded" is dangerous and rarely useful (I actually doubt that this
>>> "feature" is useful at all).
>>>       
>> If i understand correctly what you're saying, you cannot have something
>> like:
>>
>> int main(int argc, char *argv[]) {
>>   /* ... */
>>   foo = dlopen("bar.so");
>>   /* use bar.so functions, clean, etc... */
>> }
>>
>> if bar.so is multithreaded (and thus, linked to libpthread.so) and you
>> don't compile your main program with -lpthread option.
>> did i understand you right ?
>>
>> this would mean you may need to link against pthread library, just in
>> case the library(ies) you dlopen might use it ?
>>     
>
> Linking against a multi-threaded library at compile time, turns the
> main program into a multi-threaded program even though no use of
> threads is being made at all.
>
>   

i agree, but this was not what i asked.
consider a library foo using threads.
consider a main program bar only linked to dl.
chat you said is that bar cannot use sanely foo functions, because it is
not multithreaded itself, right ?

Ben

