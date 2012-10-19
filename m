From: Lorenzo Beretta <lory.fulgi@infinito.it>
Subject: Re: UDP message boundary
Date: Fri, 19 Oct 2012 16:15:20 +0200
Message-ID: <k5rn9n$iep$1@ger.gmane.org>
References: <CAA6iF_7Hmu4c2FyGFRUw12QxK=t_tMvyu_xhMUjFGe7fCTxw5Q@mail.gmail.com> <CAA6iF_5RAWCB47=woDjb39aTfRH6qzUVsn2YdyTydUbyreL7Yg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAA6iF_5RAWCB47=woDjb39aTfRH6qzUVsn2YdyTydUbyreL7Yg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 17/10/2012 05:24, Randi Botse wrote:
> Anyone can share? :)
>
> Thanks
>
>
> On Mon, Oct 15, 2012 at 11:50 AM, Randi Botse<nightdecoder@gmail.com>  wrote:
>> Hi All
>>
>> When using TCP socket, I loop send() or recv() until ALL the data has
>> been transmitted (or error, disconnect, etc.), because TCP socket
>> packet is transmitted in stream nature, maybe a byte, bytes or all
>> bytes in one transfer.
>>
>> The UDP socket preserve message boundary which TCP socket doesn't.
>> Does this means single call to sendto() will processed by single call
>> recvfrom()?, and how about packet that exceeds UDP data MAX size?.
>>
>> So in code, do I need to loop sendto() or recvfrom() to transmit the data?.
>>
>> Example codes is:
>>
>> char packet[100];
>> size_t nbytes = 0;
>> int ret;
>>
>> while (nbytes<  sizeof(packet)) {
>>      ret = recvfrom(socket, packet + nbytes, addr, 0,  sizeof(packet) - nbytes);
>>      if (ret<= 0) {
>>          /* deal with recvfrom() error */
>>      }
>>      nbytes += ret
>> }
>>
>>
>> Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
Almost:
1. udp is not reliable, so transmission may just fail
2. there's a maximum lenght of 64k (16 bit size counter)
3. ip fragmentation: as packet size grows, iirc one fragment lost means 
you loose everything

You can start from the wikipedia page and explore from that, or read the 
source of any program doing serious stuff with udp(*)


(*) there's an ftp alternative called fsp which uses udp, but I can't 
comment on the source code because I've never read it

