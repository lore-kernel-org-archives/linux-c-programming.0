From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Anonymous structures
Date: Fri, 4 Aug 2006 18:22:35 +0100
Message-ID: <17619.33371.576220.777404@cerise.gclements.plus.com>
References: <16D08C962563664288C2B2EC23C47FCB2364A0@BLR-SJP-MBX01.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16D08C962563664288C2B2EC23C47FCB2364A0@BLR-SJP-MBX01.wipro.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: krishna.vamsi@wipro.com
Cc: linux-c-programming@vger.kernel.org


krishna.vamsi@wipro.com wrote:

> Can I pass anonymous structures as function arguments, 
> 
> Struct A{ int a; int b};
> 
> F(struct A a)
> {
> }
> 
> Int main()
> {
> 	f({a,b})
> }
> 
> If I can how can I do that ?

No. An anonymous structure has an unknown size, so the compiler cannot
generate code to copy them.

Anonymous structures are only useful as pointer targets, i.e.
"struct A *foo". You can pass around pointers to structures without
knowing the size of the structure, although you can't dereference them.

-- 
Glynn Clements <glynn@gclements.plus.com>
