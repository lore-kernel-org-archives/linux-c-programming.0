From: "M.Baris Demiray" <baris@labristeknoloji.com>
Subject: fprintf() and duplicate IP addresses
Date: Tue, 31 May 2005 02:19:03 +0000
Message-ID: <429BC997.6000909@labristeknoloji.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040903090408060400080808"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------040903090408060400080808
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello,
I have encountered with a strange problem using fprintf(). I'm
working on a packet sniffer using raw sockets and printing header
details as usual. But when I try to print source and destination IP
addresses, if I use a single fprintf() they're printed as duplicates.
But if I separate them into two fprintf()s everything is OK. Here are
some code snippets and corresponding outputs.

First; with one fprintf():

fprintf(stdout, "%s:%d -> %s:%d  ", \
         inet_ntoa(*(struct in_addr *)&ip_header->ip_src.s_addr), \
         ntohs(tcp_header->source), \
         inet_ntoa(*(struct in_addr *)&ip_header->ip_dst.s_addr), \
         ntohs(tcp_header->dest));

And output after tapping Enter key on a ssh session opened at
10.0.0.50..

TCP IPv4 10.0.0.50:22 -> 10.0.0.50:34001
TCP IPv4 10.0.0.50:22 -> 10.0.0.50:34001
TCP IPv4 10.0.0.50:22 -> 10.0.0.50:34001
TCP IPv4 10.0.0.50:22 -> 10.0.0.50:34001

Second; with two fprintf()s:

fprintf(stdout, "%s:%d ", \
         inet_ntoa(*(struct in_addr *)&ip_header->ip_src.s_addr),
         ntohs(tcp_header->source));
fprintf(stdout, "-> %s:%d  ", \
         inet_ntoa(*(struct in_addr *)&ip_header->ip_dst.s_addr),
         ntohs(tcp_header->dest));

And tapping in remote session again.. (Connected from 10.0.0.23)

TCP IPv4 10.0.0.50:22 -> 10.0.0.23:34001
TCP IPv4 10.0.0.50:22 -> 10.0.0.23:34001
TCP IPv4 10.0.0.50:22 -> 10.0.0.23:34001
TCP IPv4 10.0.0.50:22 -> 10.0.0.23:34001

That's weird. Missing something?

As extra information; I'm using ip struct in netinet/ip.h and
getting IP header from raw data as below:

         memcpy((struct ip *)ip_header, buffer, SIZE_IP_HDR);

And using gcc-3.2.3 and glibc-2.3.4.

Any idea?

Regards,

-- 
"You have to understand, most of these people are not ready to be
unplugged. And many of them are no inert, so hopelessly dependent
on the system, that they will fight to protect it."
                                                         Morpheus

--------------040903090408060400080808
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
--------------040903090408060400080808--
