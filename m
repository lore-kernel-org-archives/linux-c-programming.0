From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: offsets of fields in a structure
Date: Fri, 19 Oct 2007 19:11:15 +0100
Message-ID: <18200.62275.395794.626200@cerise.gclements.plus.com>
References: <4718CCE2.9060202@infocamere.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4718CCE2.9060202@infocamere.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Giulio Rossato <giulio.rossato@infocamere.it>
Cc: linux-c-programming@vger.kernel.org


Giulio Rossato wrote:

> I want write a function that receives as parameters a start address and 
> a "description of a structure" and returns the offsets of the fields. 
> The structure is not known at compile time. The offsets should be 
> calculated at runtime and the code should be independent of the machine.
> How should be written this function?

Your code will need to express the rules which the compiler uses to
lay out structures; there is no mechanism to obtain this information
from the compiler.

-- 
Glynn Clements <glynn@gclements.plus.com>
