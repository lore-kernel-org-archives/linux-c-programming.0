From: "Raseel Bhagat" <raseelbhagat@gmail.com>
Subject: Re: Anonymous structures
Date: Sat, 5 Aug 2006 07:58:12 +0530
Message-ID: <f68850780608041928j6c417b5bs161805a207847ae9@mail.gmail.com>
References: <16D08C962563664288C2B2EC23C47FCB2364A0@BLR-SJP-MBX01.wipro.com>
	 <17619.33371.576220.777404@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17619.33371.576220.777404@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi Glynn,

On 8/4/06, Glynn Clements <glynn@gclements.plus.com> wrote:
> No. An anonymous structure has an unknown size, so the compiler cannot
> generate code to copy them.
>
> Anonymous structures are only useful as pointer targets, i.e.
> "struct A *foo". You can pass around pointers to structures without
> knowing the size of the structure, although you can't dereference them.
>
>

If we can't dereference them, then what would be the use of such a call ?
Can you cite a example for the above scenario ?

-- 
Raseel.
http://osd.byethost8.com
http://raseel.livejournal.com
