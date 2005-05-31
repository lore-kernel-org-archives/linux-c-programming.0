From: "mikael-aronsson" <mikael-aronsson@telia.com>
Subject: Re: fprintf() and duplicate IP addresses
Date: Tue, 31 May 2005 08:53:37 +0200
Message-ID: <004101c565ad$7946fc50$b54be051@w128mtec>
References: <429BC997.6000909@labristeknoloji.com> <d7h00u$q8r$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: linux-c-programming@vger.kernel.org

That's correct, most implementations use a static buffer, even though most 
modern applications has a separate buffer for each thread.

Mikael

----- Original Message ----- 
From: "SVisor" <svisor@lycos.com>
To: <linux-c-programming@vger.kernel.org>
Sent: Tuesday, May 31, 2005 8:28 AM
Subject: Re: fprintf() and duplicate IP addresses


> M.Baris Demiray wrote:
>
> ...
>> addresses, if I use a single fprintf() they're printed as duplicates.
> ...
>> fprintf(stdout, "%s:%d -> %s:%d  ", \
>>         inet_ntoa(*(struct in_addr *)&ip_header->ip_src.s_addr), \
>>         ntohs(tcp_header->source), \
>>         inet_ntoa(*(struct in_addr *)&ip_header->ip_dst.s_addr), \
>>         ntohs(tcp_header->dest));
>
> I have nothing to back my suspection with. But probably inet_ntoa(...) 
> uses an internal buffer.
>
> printf( ) solves variables from the right, _before_ adding the result to 
> the output (only the "pointer" to char* is saved), you only get the result 
> from the first one (as they "point" to same memory).
>
> // Jarmo
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html 

