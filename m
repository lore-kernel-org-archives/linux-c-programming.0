From: HIToC <hitoc_mail@yahoo.it>
Subject: Host IP address
Date: Tue, 22 Feb 2005 17:53:46 +0100
Message-ID: <200502221751.44585.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello all!
Sometimes is useful to know the IP address of the machine we are working on,
for example when we connect a SMTP server and do the EHLO <domain> command.
I have written a short C++ program that first prints the host name and the
host IP address, then if arguments from command line are passed prints
the IP address of each domain name.

/*		IPadress.cpp
		Author:	HIToC
*/

#include <iostream.h>
#include <unistd.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <string>
#include <stdio.h>

int main(int argc, char* argv[])
{
	hostent	*hh;
	string	IP, my_name;
	char*	host_name = new char[64];

	gethostname(host_name, 64);
	my_name = host_name;

	cout <<"Host name:\t\t" <<my_name <<'\n';

	hh = gethostbyname(host_name);
	IP = inet_ntoa(*((struct in_addr *)hh->h_addr));
	cout <<"My IP address:\t\t" <<IP <<"\n\n";

	for(int i = 1; i<argc; i++) {
		hh = gethostbyname(argv[i]);
		if(hh == NULL) {
			cerr <<"Error with \"" <<argv[i] <<"\" !\n";
			continue;
		}
		IP = inet_ntoa(*((struct in_addr *)hh->h_addr));
		cout <<"IP address of " <<argv[i] <<" :\t" <<IP <<'\n';
	}

	return 0;
}

If called without any parameter, the output is always:
Host name:		linux
My IP address:	127.0.0.2

If like argument I pass localhost, thw output is:
Host name:		linux
My IP address:	127.0.0.2
IP address of localhost:	127.0.0.1


My intent is to know my real IP address!
Can anybody help me?
Thaks for any suggestion.

-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
