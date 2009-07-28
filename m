From: Rahul K Patel <rahulk.patel@einfochips.com>
Subject: Re: memory address represented as a string
Date: Tue, 28 Jul 2009 15:39:23 +0530
Message-ID: <4A6ECE53.9010607@einfochips.com>
References: <2a46ebd60907260039g290268b7i3183ee785994b86@mail.gmail.com>	 <b21328ed0907260114w547eb3fax61927111cdcf9d3c@mail.gmail.com> <2a46ebd60907260126q5ba0f7fdr48c6af8728737f3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <2a46ebd60907260126q5ba0f7fdr48c6af8728737f3@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Saurabh Sehgal <saurabh.r.s@gmail.com>
Cc: Eric Polino <aluink@gmail.com>, linux-c-programming@vger.kernel.org

Hi,

Saurabh Sehgal wrote:
> Hi all,
>
> Thanks for the reply !
>
> I was able to write this function successfully.
>
> This would lead me to my next question.
>
> Is there anyway to test if a memory address is valid or not without causing a
> segmentation fault and catching this maybe in a signal handler ?
>
> Is there a safe way in the same function " void * foo (char * addr)"
> to check that
> if the address contained in the string represented by "char * addr"  is valid
> before returning it.
>   

static inline int is_invalid_addr( const void *p )
{
       int dev_null_fd = open("/dev/null", O_RDWR);
       if(dev_null_fd < 0)
          return -1;
   
        /* HACK: on some systems we can not write to check for pointer 
validity */
        size_t ret = fcntl( dev_null_fd, F_GETLK, p );

        ret = ( errno == EFAULT );
        errno = 0;
        return ret;
}

You can use this function to check whether given address is accessible.

-- Rahul Patel.
> Thank you !
>
> Saurabh
>
> On Sun, Jul 26, 2009 at 4:14 AM, Eric Polino<aluink@gmail.com> wrote:
>   
>> sure, you can just write a function that declares a void * and uses it as a
>> regular numeric type such as int or whatnot and parses the string
>> representation as a numeric value into that variable.  You can do stuff the
>> same as you would with any other integer type, "x += 10; x -= 18;".  So the
>> function would look something like
>>
>> void *foo(const char *addr){
>>   void *parsed_value = 0;
>>   ....
>>   /* Parse addr into parsed_value */
>>   ....
>>   /* parsed_value == value_described_by(addr) */
>>
>>   return parsed_value;
>> }
>>
>> Parsing addr into parsed_value is left as an exercise to the reader ;)
>>
>> "None are more hopelessly enslaved than those who falsely believe they are
>> free."
>>                                      --Goethe
>>
>> "Freedom is living without government coercion."
>>                   --Ron Paul (www.ronpaul2008.com)
>>
>>
>> On Sun, Jul 26, 2009 at 03:39, Saurabh Sehgal <saurabh.r.s@gmail.com> wrote:
>>     
>>> Hi all,
>>>
>>> I had a quick question:
>>>
>>> Let's say I design a function with the signature:
>>>
>>> void * foo( char * addr ) ; ,
>>>
>>> where addr is a string that represents a valid memory address  ...
>>> so the way someone can call this function is ...
>>>
>>> char * addr = "0xae456778" // assume this is a valid memory address on
>>> the machine
>>> foo( addr ) ;
>>>
>>> Is it possible to take this address in string form, and assign it to
>>> an actual pointer of void * type ?
>>> I want the function "foo" to return a pointer pointing to the memory
>>> location as indicated
>>> by the string passed in.
>>>
>>> Thank you !
>>>
>>> Saurabh
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe
>>> linux-c-programming" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>       
>>     
>
>
>
>   
-- 
_____________________________________________________________________
Disclaimer: This e-mail message and all attachments transmitted with it
are intended solely for the use of the addressee and may contain legally
privileged and confidential information. If the reader of this message
is not the intended recipient, or an employee or agent responsible for
delivering this message to the intended recipient, you are hereby
notified that any dissemination, distribution, copying, or other use of
this message or its attachments is strictly prohibited. If you have
received this message in error, please notify the sender immediately by
replying to this message and please delete it from your computer. Any
views expressed in this message are those of the individual sender
unless otherwise stated.Company has taken enough precautions to prevent
the spread of viruses. However the company accepts no liability for any
damage caused by any virus transmitted by this email.
_____________________________________________________________________
 
