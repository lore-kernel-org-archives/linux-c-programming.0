From: "M.Baris Demiray" <baris@labristeknoloji.com>
Subject: Re: Array Empty Slots
Date: Tue, 05 Apr 2005 15:03:45 +0000
Message-ID: <4252A8D1.1070100@labristeknoloji.com>
References: <Pine.LNX.4.58.0503221104060.30671@ns.isi.ulatina.ac.cr> <200503221305.32606.eric@cisu.net> <Pine.LNX.4.58.0503221215250.31636@ns.isi.ulatina.ac.cr> <001301c53923$2804a9c0$0101010a@dioxide> <002c01c539be$cecdcb10$0101010a@dioxide>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000409070802050307010905"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <002c01c539be$cecdcb10$0101010a@dioxide>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Chris <nanakos@wired-net.gr>
Cc: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------000409070802050307010905
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Chris,

Chris wrote:
 > ..
> The well known constraints are small memory footprint 

Well, then using a bitmap looks like a better solution. Since a minimal
node (a integer value and the next one's address) in a linked list takes
~64 bits but it'll take 1 bit in a bitmap.

But, you should calculate and compare the possible memory requirements
before ignoring the use of separate empty record list method. Since its
implementation will be much more easier than the former.

> and lack of
> computing power is really a concern, 

I think the computer itself is the real bottleneck :-)

 > but most of all is that the array is
> bigger and bigger over time, because it is and array constructed from a
> database query through a C API interface.

May be you should leave the job to DBMS by querying empty
records. I'm sure that it'll handle it more efficiently.

Also, adding a Boolean field for empty/full status and creating
an index for it will also be a good solution. But, this path ends
in off-topic.

Some benchmarking is required to tell the final word.

Regards.

> The bottleneck in the final application is this point, where the algorithm
> searches the array to find the empty slots and then fill those slots with
> data.
> Is there really sth that can 'dissapear' that bottleneck? Do u have any
> suggestions??
> 
> 
> Best regards,
> Chris.

-- 
"You have to understand, most of these people are not ready to be
unplugged. And many of them are no inert, so hopelessly dependent
on the system, that they will fight to protect it."
                                                         Morpheus

--------------000409070802050307010905
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
--------------000409070802050307010905--
