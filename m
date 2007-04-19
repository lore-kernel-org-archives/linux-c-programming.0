From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: unable to link to a static library present alongside a shared
 library
Date: Thu, 19 Apr 2007 15:40:04 +0530
Message-ID: <46273FFC.2070902@gmail.com>
References: <46260A74.90309@gmail.com>	<17958.13648.425008.752038@cerise.gclements.plus.com>	<46266604.8090103@gmail.com> <17958.31994.242710.443269@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17958.31994.242710.443269@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Thanks for your continuing patience.

Glynn Clements wrote:

> Another significant difference is that Windows executables and DLLs
> associate any unresolved symbols with the DLL from which they are
> meant to be loaded. OTOH, the Linux loader doesn't care where a symbol
> comes from, so long as something defines it.

And what would be the implications of that? I mean, what happens 
practically because of that?

>> http://en.wikipedia.org/wiki/Library_(computing)#Dynamic_linking and 
> 
> Windows (and maybe other systems) allows numeric references to symbols
> in an external DLL. The executable or DLL can refer to e.g. symbol #7
> in foo.dll rather than to the name of the function.

I edited the page accordingly. I hope it is correct what I have written.

>> The article http://en.wikipedia.org/wiki/Static_Library further confuses 
> 
>> The article also says "... or at runtime by the linker or linking 
>> loader". I think the word "respectively" should be added after "loader", 
>> but still I don't understand how refs to symbols provided by a static 
>> lib can be resolved at runtime.

I edited this page also to be clearer. Again I hope it is correct.

I again sincerely thank you for your continuing patience and support,

Shriramana Sharma.
