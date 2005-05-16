From: gumbold <gumbold@bonbon.net>
Subject: Re: data structure question
Date: Mon, 16 May 2005 07:00:30 +0300
Message-ID: <42881ADE.2010009@bonbon.net>
References: <42871714.5060007@bonbon.net>
 <17031.11321.223828.203914@gargle.gargle.HOWL> <4287315D.3080802@bonbon.net>
 <17031.23394.834533.766062@gargle.gargle.HOWL>
Reply-To: gumbold@bonbon.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <17031.23394.834533.766062@gargle.gargle.HOWL>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Glynn Clements wrote:

>gumbold wrote:
>
>  
>
>>>>why somebody wants to write such thing
>>>>struct abc {
>>>>    __u16 a;
>>>>    __u16 b;
>>>>    char abc[0];
>>>>} __attribute__((packed));
>>>>Specialy for zerod array of chars.
>>>>        
>>>>
>>>A structure which ends with a zero-length array is intended for use as
>>>the "header" for a variable-sized block of data, e.g.:
>>>
>>>	struct abc *new_abc(__u16 a, __u16 b, const char *string)
>>>	{
>>>		int len = strlen(string);
>>>		struct abc *p = malloc(sizeof(struct abc) + len + 1);
>>>	
>>>		p->a = a;
>>>		p->b = b;
>>>		memcpy(p->abc, string, len + 1);
>>>	
>>>		return p;
>>>	}
>>>
>>>  
>>>      
>>>
>>So if my compiler can't handle such code, can i change it to
>>struct abc {
>>    __u16 a;
>>    __u16 b;
>>    char abc[1];
>>} __attribute__((packed));
>>    
>>
>
>Yes, although you would need to adjust the size calculation if you
>need to calculate the exact size of the overall block.
>
>Zero-length arrays aren't valid in C89, but are in C99. Also, gcc has
>supported them as an extension since long before it started supporting
>C99.
>
>  
>
So char abc[0] actualy pointer to chat? It should be 4 byte long on x86.
I can't see it with sizeof.
