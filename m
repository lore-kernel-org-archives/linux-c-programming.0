From: HIToC <hitoc_mail@yahoo.it>
Subject: Remote host name
Date: Wed, 15 Dec 2004 16:45:40 +0100
Message-ID: <200412151636.28714.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all.
I am writing a function that returns the name of the remote host which we are
connected to. About the remote host I only know its IP address...I have tried
to use function "gethostbyname" passing for argument the IP address in
standard dot notation:

[man 3 gethostbyname: The gethostbyname() function returns a structure of 
type hostent for the given host name. Here name is either a host name, or
an IPv4 address in standard dot notation, or an IPv6 address in colon
(and possibly dot) notation.]


struct sockaddr_in destination;

char* get_remote_host_name()
{
  hostent* remote_host_information;
  char* host_IP;

  host_IP =  inet_ntoa(destination.sin_addr);
  remote_host_information = gethostbyname(host_IP);

  return remote_host_information->h_name;
}


This function returns the IP address of the remote host, not its (DNS) name!
Can anybody help me?
-- 

With regards,
				HIToC 
				hitoc_mail@yahoo.it

