From: Adam Dyga <adeon@tlen.pl>
Subject: Re: HOME directory
Date: Tue, 26 Apr 2005 13:26:19 +0200
Message-ID: <426E255B.3050805@tlen.pl>
References: <200504251826.36321.hitoc_mail@yahoo.it>	 <6a00c8d50504251005110319f2@mail.gmail.com> <426D38D3.5060901@tlen.pl> <6a00c8d505042511529bd72c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d505042511529bd72c8@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Steve Graegert wrote:

>On 4/25/05, Adam Dyga <adeon@tlen.pl> wrote:
>  
>
>>>All SUSv2/3 compliant systems know the system call getpwnam() to
>>>obtain information about a given user by querying the passwd database.
>>>The following (untested) code snippet  demonstrates its usage.  Hope
>>>this is what you're lookin' for.
>>>
>>>      
>>>
>>Note that for security reasons this way much better.
>>    
>>
>Relying on the shell environment is
>usually a bad idea since it can be manipulated and tweaked in many
>different ways.
>
That's exactly what I meant ;)

Cheers
AD

PS: Sorry, my previous reply should have gone to the group....
