From: Mihai Dontu <mdontu@bitdefender.com>
Subject: Re: Double values - what precision do I use for fprintf?
Date: Fri, 13 Jan 2006 00:00:58 +0200
Message-ID: <43C6D19A.5040800@bitdefender.com>
References: <200601121800.19678.samjnaa@gmail.com> <6a00c8d50601121051n691ee179kef3298829025e973@mail.gmail.com> <012101c617be$5b7afe10$8e01a8c0@Nate>
Reply-To: nate@uniwest.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <012101c617be$5b7afe10$8e01a8c0@Nate>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Nate Jenkins wrote:
>>> Please observe the following printf output of eighteen double variables:
>>>
>>> First I tried using "%20.15f" as the format string:
>>>
>>>  268.229220252114942    1.018511211250181
>>>  66.833038547989787   12.450505533056681
>>>  20.512170161382819    0.334923179252419
>>>  259.358845955701327    1.571934717666495
>>>  201.111247720862963    0.139476171219810
>>>  270.658029698352152   -0.612280599380678
>>>  105.175902698424665   -0.076345132989225
>>>  343.809699615507384   -0.219206370786681
>>>
>>> Then I used "%30.25f":
>>>
>>>  268.2297152740335377529845573    1.0185111507334088098986058
>>>  66.8390907719954157073516399   12.4504269834231084956854829
>>>  20.5123328842112115921736404    0.3349264346316725426966343
>>>  259.3596100022817267927166540    1.5719383906021777708161835
>>>  201.1113154335791932680876926    0.1394751696317115263745734
>>>  270.6577319741974747557833325   -0.6122834912138217511312632
>>>  105.1758654981413201312534511   -0.0763454696609412730712307
>>>  343.8095929658045974974811543   -0.2192182978826520134418843
>>>
>>> Ignoring the small differences in the two sets of data (longitude and 
>>> speed of
>>> eight celestial bodies computer at two different instants) I wonder - 
>>> if I
>>> keep increasing the number of decimal places where will it end?
>>
>>
>> Shriramana,
>>
>> Double precision numbering format is standardized by IEEE 754 with an
>> 8 byte encoding.  1 bit is used for the sign, 11 bits for the exponent
>> and the remaining 52 bits are used for the precision, which means
>> precision "ends" at %.52f.
>>
>> \Steve
>>
> 
> If it is a 64-bit-floating-point data type, then isn't one supposed to 
> use the "long" modifier, i.e. "%.52f" -> "%.52lf"?  Or is that not 
> portable?
> 
> I am not concerned so much about being portable.  However, I have always 
> followed the idea that "%f" is for 4 Byte floats and "%lf" is for 8 Byte 
> floats or doubles...
> 
> Is that compiler specific or ????
> 
> ~ Nate
> 
> 
> "Do or do not or delegate to somebody else.  There is no try."
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
>
According to man 3 printf, we have:
"
l      (ell) A following integer conversion corresponds to a long int or unsigned long int argument, or a following  n
        conversion corresponds to a pointer to a long int argument, or a following c conversion corresponds to a wint_t
        argument, or a following s conversion corresponds to a pointer to wchar_t argument.

ll     (ell-ell).  A following integer conversion corresponds to a long long int or unsigned long long  int  argument,
        or a following n conversion corresponds to a pointer to a long long int argument.
"
But there are OS-es that do not recognize the ll.
Today I had a small problem displaying the fields of a "struct stat" variable. It was all messed up, until
i saw that dev_t is declared as "unsigned long long". So I did
printf( "%llu %u %u %u", st.st_dev, st.st_inode, st.st_size, st.st_atime );

M.D.


-- 
This message was scanned for spam and viruses by BitDefender.
For more information please visit http://www.bitdefender.com/

