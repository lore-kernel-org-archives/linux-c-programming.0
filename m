From: Bryan Christ <bryan.christ@hp.com>
Subject: Re: standard OS defines
Date: Wed, 22 Aug 2007 14:28:17 -0500
Message-ID: <46CC8E51.4050201@hp.com>
References: <46CC81E9.1080904@hp.com> <200708221524.41782.kratzers@pa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200708221524.41782.kratzers@pa.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: kratzers@pa.net
Cc: linux-c-programming@vger.kernel.org

Thanks!  This list is exactly what I was looking for.  Too bad there's 
not a tool for piping to gcc--I was trying to avoid -D.

Bryan

Stephen Kratzer wrote:
> On Wednesday 22 August 2007 14:35:21 Bryan Christ wrote:
>> does anyone know where i can find a list of standardized OS defines?
>> i've come across the list below, but i haven't found an authoritative
>> resource convince me these are standard/correct.  even if they are i'm
>> sure what i've found is a just a subset of a larger list--but i don't
>> know where to look.
>>
>> __CYGWIN__
>> __NetBSD__
>> __OpenBSD__
>> __linux__
>> __sun__
> 
> Take a look at:
> info cpp "System-specific Predefined Macros"
> 
> A good list is here:
> http://predef.sourceforge.net/preos.html
> 
>> also, is there a tool that like getconf that i can use to pipe these
>> defines into gcc at compile time?
> 
> You can define macros on the command line by passing the -D flag to gcc.
> 
>> thanks in advance,
>> bryan
>> -
