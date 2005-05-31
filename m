From: SVisor <svisor@lycos.com>
Subject: Re: fprintf() and duplicate IP addresses
Date: Tue, 31 May 2005 08:28:06 +0200
Message-ID: <d7h00u$q8r$1@sea.gmane.org>
References: <429BC997.6000909@labristeknoloji.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <429BC997.6000909@labristeknoloji.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

M.Baris Demiray wrote:

...
> addresses, if I use a single fprintf() they're printed as duplicates.
...
> fprintf(stdout, "%s:%d -> %s:%d  ", \
>         inet_ntoa(*(struct in_addr *)&ip_header->ip_src.s_addr), \
>         ntohs(tcp_header->source), \
>         inet_ntoa(*(struct in_addr *)&ip_header->ip_dst.s_addr), \
>         ntohs(tcp_header->dest));

I have nothing to back my suspection with. But probably inet_ntoa(...) 
uses an internal buffer.

printf( ) solves variables from the right, _before_ adding the result to 
the output (only the "pointer" to char* is saved), you only get the 
result from the first one (as they "point" to same memory).

// Jarmo

