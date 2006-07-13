From: Mihai Dontu <mdontu@bitdefender.com>
Subject: Re: How to write apps dependent on external libraries?
Date: Thu, 13 Jul 2006 19:13:52 +0300
Message-ID: <44B67140.10208@bitdefender.com>
References: <200607132134.57378.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200607132134.57378.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Shriramana Sharma wrote:
> Often I see apps which are dependent on this .so file or that. I don't know 
> how apps can be written that depend on libraries that are not linked into the 
> executable. So far I have been linking all needed libraries into the 
> executable.
> 
> A .so is a collection of what? An .a is a collection of .o-s, right? What is 

A .so (Shared Object) is a "collection of code". Basically the code from 
all .o-s is gathered _and_ _linked_ into this file.

> a .la? I am so very confused.
> 

.la is a libtool thinggy which contains different informations about how 
to create/load/link a .so

> I don't know what keywords to search for on Google. Which is why I ask here. 
> If it is a detailed subject please give me keywords so I can search and find 
> on my own.
> 
> Thanks for your help.
> 
> 
> 
> ------------------------------------------------------------------------
> 
> 



-- 
This message was scanned for spam and viruses by BitDefender.
For more information please visit http://www.bitdefender.com/

