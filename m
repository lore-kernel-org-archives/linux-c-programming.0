From: "M.Baris Demiray" <baris@labristeknoloji.com>
Subject: Re: Array Empty Slots
Date: Tue, 05 Apr 2005 08:39:59 +0000
Message-ID: <42524EDF.8040601@labristeknoloji.com>
References: <Pine.LNX.4.58.0503221104060.30671@ns.isi.ulatina.ac.cr> <200503221305.32606.eric@cisu.net> <Pine.LNX.4.58.0503221215250.31636@ns.isi.ulatina.ac.cr> <001301c53923$2804a9c0$0101010a@dioxide>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060101020403020907070601"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <001301c53923$2804a9c0$0101010a@dioxide>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Chris <nanakos@wired-net.gr>
Cc: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------060101020403020907070601
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Chris wrote:
> Hi all,

Hi,

> Lets assume we have a very very big array with sequential integer numbers
> from 1-30000, but we have some slots that are empty.
> Which is the faster way(algorithm maybe) that we can track those empty
> slots???

A very common approach is using a linked list. Also, if you implement
a separate list for empty slots, your searches will be much faster.
OTOH, as you may guess, additional overhead will occur because of the
maintenance of the extra list.

Another option could be using a bitmap for _all_ (not only for empty
ones) slots. There are special instructions in many architectures
(like bsfl in i386) for the job "find first bit set" (hint, this is
the search keyword) and could be used inlined. I think that will be
much faster than searching a linked list.

Regards

> 
> 
> Best regards,
> Chris.

-- 
"You have to understand, most of these people are not ready to be
unplugged. And many of them are no inert, so hopelessly dependent
on the system, that they will fight to protect it."
                                                         Morpheus

--------------060101020403020907070601
Content-Type: text/x-vcard; charset=utf-8;
 name="baris.vcf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="baris.vcf"

YmVnaW46dmNhcmQNCmZuOk0uQmFyaXMgRGVtaXJheQ0KbjpEZW1pcmF5O00uQmFyaXMNCm9y
ZzpMYWJyaXMgVGVrbm9sb2ppDQphZHI6OztUZWtub2tlbnQgU2lsaWtvbiBCaW5hIE5vOjI0
IE9EVFU7QW5rYXJhOzswNjUzMTtUdXJrZXkNCmVtYWlsO2ludGVybmV0OmJhcmlzQGxhYnJp
c3Rla25vbG9qaS5jb20NCnRpdGxlOllhemlsaW0gR2VsaXN0aXJtZSBVem1hbmkNCnRlbDt3
b3JrOis5MDMxMjIxMDE0OTANCnRlbDtmYXg6KzkwMzEyMjEwMTQ5Mg0KeC1tb3ppbGxhLWh0
bWw6RkFMU0UNCnVybDpodHRwOi8vd3d3LmxhYnJpc3Rla25vbG9qaS5jb20NCnZlcnNpb246
Mi4xDQplbmQ6dmNhcmQNCg0K
--------------060101020403020907070601--
