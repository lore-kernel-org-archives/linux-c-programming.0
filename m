From: Jeff Woods <Kazrak+kernel@cesmail.net>
Subject: Re: Question about Malloc
Date: Sun, 10 Oct 2004 00:13:29 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <6.1.1.1.0.20041009235942.02fad7f8@no.incoming.mail>
References: <1097386256.6100.16.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1097386256.6100.16.camel@localhost.localdomain>
References: <1097386256.6100.16.camel@localhost.localdomain>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Edward Parrilla <eparrilla@comcast.net>
Cc: linux prg <linux-c-programming@vger.kernel.org>

At 10/10/2004 12:31 AM -0500, Edward Parrilla wrote:
>I got the following structure:
>typedef struct  {
>         char *file;
>         char *ip_addres;
>         }TABLE;
>
>then define a pointer to it:
>
>typedef TABLE *Recpointer;
>Recpointer r;
>
>I'm trying to use malloc as:
>
>r=malloc(Recpointer);
>but it gives me error.
>
>What should be the right sintax?

The word in "syntax".  (A "sin tax" would be too expensive.)

"man malloc" says (in part):

>>         void *calloc(size_t nmemb, size_t size);
>>         void *malloc(size_t size);
>>
>>         calloc()  allocates memory for an array of nmemb elements of 
>> size bytes each and returns a pointer to the allocated memory.  The 
>> memory is  set to zero.
>>
>>         malloc()  allocates  'size'  bytes and returns a pointer to the 
>> allocated memory.  The memory is not cleared.

If you want to allocate exactly one TABLE struct, it should be something 
more like:

         r=malloc(sizeof(TABLE));
         assert(NULL != r);

If you want to allocate an array of TABLE structs (which the name implies), 
use something like:

         #define TABLE_MAX       100
         r = calloc(TABLE_MAX, sizeof(TABLE));
         assert(NULL != r);

>Any help would be appreciated.

RTFM:  Read the manpage.  Or, "Use the manpage, Luke!"  It wouldn't hurt to 
read K&R 2nd edition either.

--
Jeff Woods <kazrak+kernel@cesmail.net> 


