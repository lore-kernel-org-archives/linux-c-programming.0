From: ronkhu <ronkhu@ntsp.nec.co.jp>
Subject: Re: question on socket connection
Date: Mon, 26 May 2003 16:43:28 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3ED1D3B0.9060505@hq.ntsp.nec.co.jp>
References: <EF836A380096D511AD9000B0D021B527013AD275@narmada.techmas.hcltech.com>
Reply-To: ronkhu@ntsp.nec.co.jp
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

hmmm..
have u tried using select()?
instead of  invoking recv() on a socket that has no data? (in this case, 
u dont have to use MSG_DONTWAIT)

I dont know about the underlying TCP/IP mechanism.....
but recv() will still return -1  when the remote side of the socket 
closes... or when the application making use of that socket crashes for 
that matter....





Ranga Reddy M - CTD ,Chennai. wrote:

>Error -1: because of recv/send fail.
>Error EGAIN: this is because of MSG_DONTWAIT.
>
>Client and Server Both are running on different systems.What if client
>crashes or powered off.How does the underlaying TCP/IP layer works
>here,There is no time for TCP/IP to say socket close to server.
>
>Client does not give any indication of socket close.Then, I think server
>will does not know about the status of the client.
>
>I have read the article about the "Nagles allgoritham" . It sets a default
>time out of 2 hours. If there is not data on the socket for 2 hrs this will
>disconnect the socket.
>
>Is there any way to trace???
>
>
>-----Original Message-----
>From: ronkhu [mailto:ronkhu@ntsp.nec.co.jp]
>Sent: Monday, May 26, 2003 1:04 PM
>To: linux-c-programming
>Subject: Re: question on socket connection
>
>
>i think
>recv() would still return 0 if the remote side of the socket connection 
>has disconnected...
>
>if ur using MSG_DONTWAIT... -1 will be returned if there is no data to 
>be read...(as well as EGAIN)....
>thus, making it possible to differentiate from "no data" from 
>"disconnection event"
>
>
>
>
>
>
>Ranga Reddy M - CTD ,Chennai. wrote:
>
>  
>
>>If the socket is non-blocking mode, I mean if MSG_DONTWAIT send/recv of
>>flag is set....
>>If , the other end is no proper socket closing is done (system crash or
>>power down).
>>Then how to find the socket connection....?????
>>
>>
>>-----Original Message-----
>>From: Glynn Clements [mailto:glynn.clements@virgin.net]
>>Sent: Monday, May 26, 2003 11:28 AM
>>To: Lejanson C. Go
>>Cc: linux-c-programming
>>Subject: Re: question on socket connection
>>
>>
>>
>>Lejanson C. Go wrote:
>>
>> 
>>
>>    
>>
>>>how do you check if the socket has been disconnected?
>>>   
>>>
>>>      
>>>
>>Try reading from it; if read/recv return zero bytes, it's closed.
>>
>> 
>>
>>    
>>
>
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe
>linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>



