From: HIToC <hitoc_mail@yahoo.it>
Subject: Re: Remote host name
Date: Thu, 16 Dec 2004 16:03:38 +0100
Message-ID: <200412161601.20474.hitoc_mail@yahoo.it>
References: <31E38B53D182D51195FA00508BE3A33405200607@zwnbc004.cala.nortel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <31E38B53D182D51195FA00508BE3A33405200607@zwnbc004.cala.nortel.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sandro Dangui <sdangui@nortelnetworks.com>, Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Cc: Linux C programming <linux-c-programming@vger.kernel.org>

On Wednesday 15 December 2004 17:01, Sandro Dangui wrote:
> Try to use gethostbyaddr()
> This is the function that returns the host name.
>
>
>
> -----Original Message-----
> From: linux-c-programming-owner@vger.kernel.org
> [mailto:linux-c-programming-owner@vger.kernel.org]
> Sent: Wednesday, December 15, 2004 1:46 PM
> To: linux-c-programming@vger.kernel.org
> Subject: Remote host name
>
>
> Hi all.
> I am writing a function that returns the name of the remote host which we
> are connected to. About the remote host I only know its IP address...I have
> tried to use function "gethostbyname" passing for argument the IP address
> in standard dot notation:
>
> [man 3 gethostbyname: The gethostbyname() function returns a structure of
> type hostent for the given host name. Here name is either a host name, or
> an IPv4 address in standard dot notation, or an IPv6 address in colon (and
> possibly dot) notation.]
>
>
> struct sockaddr_in destination;
>
> char* get_remote_host_name()
> {
>   hostent* remote_host_information;
>   char* host_IP;
>
>   host_IP =  inet_ntoa(destination.sin_addr);
>   remote_host_information = gethostbyname(host_IP);
>
>   return remote_host_information->h_name;
> }
>
>
> This function returns the IP address of the remote host, not its (DNS)
> name! Can anybody help me?


Thanks Sandro!
The function now works well using the gethostbyaddr() function:

struct sockaddr_in destination;

char* get_remote_host_name()
{
  hostent* remote_host_information;

  remote_host_information = gethostbyaddr(&destination.sin_addr,
                                                    sizeof(in_addr), AF_INET);
  return remote_host_information->h_name;
}      //...


Thanks Ron, but remember that the function gethostname() is used to access
the host name of the current processor, not the name of the remote host!
Refer to man 2 gethostname...

-- 

With regards,
				HIToC 
				hitoc_mail@yahoo.it

