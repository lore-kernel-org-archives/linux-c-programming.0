From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: if somebody can tell why this warnign is there?/
Date: Mon, 10 Jan 2005 12:40:28 +0000 (GMT)
Message-ID: <20050110124028.40060.qmail@web52904.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>

[ankit@rinku ankit]$ g++ test.cpp
In file included from
/usr/include/c++/3.2.2/backward/iostream.h:31,
                 from test.cpp:1:
/usr/include/c++/3.2.2/backward/backward_warning.h:32:2:
warning: #warning This
file includes at least one deprecated or antiquated
header. Please consider usin
g one of the 32 headers found in section 17.4.1.2 of
the C++ standard. Examples
include substituting the <X> header for the <X.h>
header for C++ includes, or <s
stream> instead of the deprecated header
<strstream.h>. To disable this warning
use -Wno-deprecated.
[ankit@rinku ankit]$ cat test.cpp
#include<iostream.h>
int main()
{
        printf("It is working\n");
return 0;
}
[ankit@rinku ankit]$     

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
