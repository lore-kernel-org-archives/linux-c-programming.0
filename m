From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Remote host name
Date: Thu, 16 Dec 2004 01:41:09 +0800
Message-ID: <41C07735.6060405@hq.ntsp.nec.co.jp>
References: <200412151636.28714.hitoc_mail@yahoo.it> <41C06000.4040503@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <41C06000.4040503@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Cc: HIToC <hitoc_mail@yahoo.it>, linux-c-programming@vger.kernel.org

oops..
i meant [gethostname()]  not [gethostbyname()]
=(

sorry

Ron Michael Khu wrote:

> use gethostbyname().....
>
> example:
> gethostname( strVariable, len );
> printf( "hostname: %s\n", strVariable );
>
> gethostbyname(), on the other hand, is for returning the equivalent ip 
> address of  the specified name..
> hence the name "gethostbyname"...
>
>
>
> HIToC wrote:
>
>> Hi all.
>> I am writing a function that returns the name of the remote host 
>> which we are
>> connected to. About the remote host I only know its IP address...I 
>> have tried
>> to use function "gethostbyname" passing for argument the IP address in
>> standard dot notation:
>>
>> [man 3 gethostbyname: The gethostbyname() function returns a 
>> structure of type hostent for the given host name. Here name is 
>> either a host name, or
>> an IPv4 address in standard dot notation, or an IPv6 address in colon
>> (and possibly dot) notation.]
>>
>>
>> struct sockaddr_in destination;
>>
>> char* get_remote_host_name()
>> {
>>  hostent* remote_host_information;
>>  char* host_IP;
>>
>>  host_IP =  inet_ntoa(destination.sin_addr);
>>  remote_host_information = gethostbyname(host_IP);
>>
>>  return remote_host_information->h_name;
>> }
>>
>>
>> This function returns the IP address of the remote host, not its 
>> (DNS) name!
>> Can anybody help me?
>>  
>>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>


