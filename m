From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: GCC and Memory Organization
Date: Thu, 11 Apr 2002 15:07:19 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15541.39063.416148.351041@cerise.nosuchdomain.co.uk>
References: <3CB3039C.4070404@veritel.com.br>
	<15539.26431.760192.203498@cerise.nosuchdomain.co.uk>
	<3CB58E28.1030201@veritel.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3CB58E28.1030201@veritel.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "William N. Zanatta" <william@veritel.com.br>
Cc: "'linux-c-programming@vger.kernel.org'" <linux-c-programming@vger.kernel.org>


William N. Zanatta wrote:

> > This isn't a compiler issue. The different layouts would require
> > different source code. The former corresponds to a one-dimensional
> > array, while the latter corresponds to a two-dimensional array.
> > 
> 
> I guess I found something. Looks like I'm talking about the concepts of 
> segmentation and paging. Is that right?

Maybe, but segmentation and paging are only really relevant if you're
designing a CPU or an OS kernel. A program just sees a flat address
space.

-- 
Glynn Clements <glynn.clements@virgin.net>
