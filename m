From: "M.Baris Demiray" <baris@labristeknoloji.com>
Subject: Re: Fw: Array Empty Slots
Date: Tue, 05 Apr 2005 16:48:55 +0000
Message-ID: <4252C177.7020601@labristeknoloji.com>
References: <004f01c539e0$ad829180$0101010a@dioxide>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060506080906050709080005"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <004f01c539e0$ad829180$0101010a@dioxide>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Chris <nanakos@wired-net.gr>
Cc: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------060506080906050709080005
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Chris,

Chris wrote:
>  Thank you very much for your response.
>  The problem maybe is in the DBMS query.I am not a DBA guru but i cant find
>  until now an atomic operation (query ) that can handle this kind of
>  procedural algorithm.Do you have sth to suggest?

No, the algorithm is already in the DBMS. You should only SELECT the
records WHERE their values is empty. And that's what you need, array of
empty records. Take a look at the index hint in my previous reply.

>  Another problem is that in the next version of this application the C
>  interface will go away and the application will be a Web based one.This is
> a
>  bigger problem cause php is much slower in array searching operations.I
> have
>  looked a lot of bench's for this subject and i dont see positive results.>  Do you know or have sth to suggest for the web based operation? 

Sorry, neither i'm a web developer, nor this is the proper place to
discuss.

 > Its gone be
>  much more difficult to solve this problem because the bottleneck there,
>  should not concern only the computer but the language and the algorithm
>  also.Please if you have sth to suggest, can you include some source code
> for
>  benchmarking if its no trouble for you?

A basic benchmarking can be done with usual library functions and system
calls. For example, gettimeofday [1] system call can return milliseconds
sensitive and clock_gettime [2] function can return nanoseconds
sensitive time information. These sensitivity will be enough i think.

Write tiny array searching and database querying codes and get time
differences. These will give some idea.

Regards.

[1] man 2 gettimeofday
[2] man 3 clock_gettime

> 
>  Best regards,
>  Chris.

-- 
"You have to understand, most of these people are not ready to be
unplugged. And many of them are no inert, so hopelessly dependent
on the system, that they will fight to protect it."
                                                         Morpheus

--------------060506080906050709080005
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
--------------060506080906050709080005--
