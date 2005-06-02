From: "M.Baris Demiray" <baris@labristeknoloji.com>
Subject: Re: fprintf() and duplicate IP addresses
Date: Thu, 02 Jun 2005 09:11:27 +0000
Message-ID: <429ECD3F.2070508@labristeknoloji.com>
References: <429BC997.6000909@labristeknoloji.com> <d7h00u$q8r$1@sea.gmane.org> <004101c565ad$7946fc50$b54be051@w128mtec>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080905000005050003020809"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <004101c565ad$7946fc50$b54be051@w128mtec>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: mikael-aronsson <mikael-aronsson@telia.com>
Cc: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------080905000005050003020809
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello again,
Thanks for the comments Mikael and Jarmo. As you said, the problem was
caused by the usage of static buffers in inet_ntoa() and fprintf() was
innocent at all. Since only the char * values are saved in fprintf(),
every inet_ntoa() overwrites the previous' values.

This was also written in man page (argh!):
"The string is returned in a statically allocated buffer, which
  subsequent  calls  will  overwrite."

I think I didn't searched enough to see that this is a common problem.

Everything is more clear now, thanks.

mikael-aronsson wrote:
> That's correct, most implementations use a static buffer, even though 
> most modern applications has a separate buffer for each thread.
> 
> Mikael

 > [...]

>> I have nothing to back my suspection with. But probably inet_ntoa(...) 
>> uses an internal buffer.
>>
>> printf( ) solves variables from the right, _before_ adding the result 
>> to the output (only the "pointer" to char* is saved), you only get the 
>> result from the first one (as they "point" to same memory).
>>
>> // Jarmo

-- 
"You have to understand, most of these people are not ready to be
unplugged. And many of them are no inert, so hopelessly dependent
on the system, that they will fight to protect it."
                                                         Morpheus

--------------080905000005050003020809
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
--------------080905000005050003020809--
