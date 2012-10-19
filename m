From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: UDP message boundary
Date: Fri, 19 Oct 2012 22:03:29 +0700
Message-ID: <CAA6iF_5ze-JXtJxULm_KsX301PjfqyFmjcRBHZYZreQFtgN_gA@mail.gmail.com>
References: <CAA6iF_7Hmu4c2FyGFRUw12QxK=t_tMvyu_xhMUjFGe7fCTxw5Q@mail.gmail.com>
	<CAA6iF_5RAWCB47=woDjb39aTfRH6qzUVsn2YdyTydUbyreL7Yg@mail.gmail.com>
	<k5rn9n$iep$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=3w51piOOZJ3v4q1Mtwx/wHmTmTVlY1gPR+xtfsalXiY=;
        b=x45cZG2CUrwz+uRJxcTBpL65Az18F/XHAqSKX++INlFOns8WxyfQWEHRX3G0iFvmf2
         4cM2sWfDK308q5ySzVfw/RKlAplrXOhPq0RmhRe2H+ko96yiwr+jrhtO1Ot9agLd6Vm3
         sr0OAs1hWo2D6t6wLK0gkocpO6rQMKmzn7oGlv7loxeamb+CO68elPeLrdYvTsbN39yP
         3C8fbCnfnE3kQl+AM1aJPc/BB/aqQ1wcihfsF0Rf4WcmM3F4Xbdhp3gQGluiIAIaqXFo
         lsjCsllPjvy7TJC3Qd4ZBJAGU6Lu3zzgzIgDh7EfbNTR8umrQoSbcM+IvFbQGUQLby/y
         Y6kA==
In-Reply-To: <k5rn9n$iep$1@ger.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Beretta <lory.fulgi@infinito.it>
Cc: linux-c-programming@vger.kernel.org

Hi

> On Fri, Oct 19, 2012 at 9:15 PM, Lorenzo Beretta <lory.fulgi@infinito.it> wrote:
> Almost:
> 1. udp is not reliable, so transmission may just fail
> 2. there's a maximum lenght of 64k (16 bit size counter)
> 3. ip fragmentation: as packet size grows, iirc one fragment lost means you
> loose everything

Lorenzo: Yes, I already know what UDP socket is, I'm asking about UDP
message boundary behaviour.






> On 17/10/2012 05:24, Randi Botse wrote:
>>
>> Anyone can share? :)
>>
>> Thanks
>>
>>
>> On Mon, Oct 15, 2012 at 11:50 AM, Randi Botse<nightdecoder@gmail.com>
>> wrote:
>>>
>>> Hi All
>>>
>>> When using TCP socket, I loop send() or recv() until ALL the data has
>>> been transmitted (or error, disconnect, etc.), because TCP socket
>>> packet is transmitted in stream nature, maybe a byte, bytes or all
>>> bytes in one transfer.
>>>
>>> The UDP socket preserve message boundary which TCP socket doesn't.
>>> Does this means single call to sendto() will processed by single call
>>> recvfrom()?, and how about packet that exceeds UDP data MAX size?.
>>>
>>> So in code, do I need to loop sendto() or recvfrom() to transmit the
>>> data?.
>>>
>>> Example codes is:
>>>
>>> char packet[100];
>>> size_t nbytes = 0;
>>> int ret;
>>>
>>> while (nbytes<  sizeof(packet)) {
>>>      ret = recvfrom(socket, packet + nbytes, addr, 0,  sizeof(packet) -
>>> nbytes);
>>>      if (ret<= 0) {
>>>          /* deal with recvfrom() error */
>>>      }
>>>      nbytes += ret
>>> }
>>>
>>>
>>> Thanks
>>
>> --
>>
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>

>
> You can start from the wikipedia page and explore from that, or read the
> source of any program doing serious stuff with udp(*)
>
>
> (*) there's an ftp alternative called fsp which uses udp, but I can't
> comment on the source code because I've never read it
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
