From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Into the Void
Date: Thu, 27 Jan 2005 12:02:58 +0800
Message-ID: <41F867F2.5000201@hq.ntsp.nec.co.jp>
References: <OFCBCF8B9A.C4F17DCE-ON85256F95.004B650B@teal.com> <20050126161137.GA954@drmemory.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050126161137.GA954@drmemory.local>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Scott <drmemory@3rivers.net>, linux-c-programming@vger.kernel.org

extra typing?? r u using the term "type" in the same context as "data 
type"(progamming language concept)?
or "type" in the sense "keyboard typing"??

>>So I should use
>> memcpy ((void *) *data_buf, (void *) bp, len) [len] = '\0';

Oops, I think u've misunderstood jeff's reply...
What jeff and the others are trying to say is that the return value of 
memcpy() is of type "void *"

In essence:
void *ptr;
ptr = memcpy(...)

thus, u need to cast the return value to something more appropriate.

And by the way, 
"memcpy ((void *) *data_buf, (void *) bp, len) [len] = '\0';" is WRONG

u still need to cast it properly if ur u persist on doing it the "one-liner way":
( (char*)memcpy ((void *) *data_buf, (void *) bp, len) )[len] = '\0';

*TAKE NOTE of the enclosing parenthesis:
((char*)SOMETHING)[index] ='\0'   

(assuming of course SOMETHING is something that could safely be treated as char *)

and like what George stated earlier... this one-liner thing is a maintenance 
headache(a code readability issue), and thus, not advisable.
better chop that one-liner down to something more readable/maintanable.

-Ron

P.S. Hmmmm... u seem to have trouble understanding what a "void*" is.
Void * could be anything.. thus u cant simply go around indexing a void*
and treating it like an array without properly casting it...



Scott wrote:

>On Wed, Jan 26, 2005 at 08:45:09AM -0500, Jeff.Fellin@rflelect.com wrote:
>  
>
>>The reason you are getting the references to void is the function prototype
>>for memcpy is:
>>
>>      memcpy (void *dest, void *src, size_t n);
>>
>>You are passing char* pointers which are not void * pointers. You have to
>>correct your arguments
>>to remove the error messages. Please use man memcpy() for more details.
>>    
>>
>
>So I should use
>
>   memcpy ((void *) *data_buf, (void *) bp, len) [len] = '\0';
>
>(len is already type size_t) 
>
>Or, I guess, to follow Ron's suggestion too:
>
>   ((char*) memcpy ((void *) *data_buf, (void *) bp, len)) [len] = '\0';
>
>Just curious as to what evil all of this extra typing is supposed to
>be protecting me from?
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>


