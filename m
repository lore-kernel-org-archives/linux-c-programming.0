From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: Function pointers to inline functions
Date: Tue, 29 May 2007 18:33:22 +0530
Message-ID: <465C249A.4000007@gmail.com>
References: <4613DBC2.8060708@gmail.com>	<17939.60731.269679.612012@cerise.gclements.plus.com>	<46566CC5.6080904@gmail.com> <18007.26131.433749.106380@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18007.26131.433749.106380@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

Glynn Clements wrote:

>> I mean, if I use -fkeep-inline-functions to get the function output in 
>> the object file, and if the static keyword also meant that the function 
>> is visible only in the translation unit in which it appears, then 
>> -fkeep-inline-functions would be rendered useless, 

... in the case of static inline functions.

Is this correct or no?

Would a function visible only in its translation unit be accessible from 
a debugger, as you say? I would test it myself, but I haven't any idea 
how to load just a single object file in gdb and test it so I am asking.

Shriramana Sharma.

