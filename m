From: "Ali Reza" <alireza@ascindia.com>
Subject: RE: if somebody can tell why this warnign is there?/
Date: Mon, 10 Jan 2005 18:14:41 +0530
Message-ID: <200501101317.IAA02648@mailp.ascindia.com>
References: <20050110124028.40060.qmail@web52904.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050110124028.40060.qmail@web52904.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Ankit Jain' <ankitjain1580@yahoo.com>, 'linux prg' <linux-c-programming@vger.kernel.org>

I don't know if this group is the right place to post such queries...well
its quite obvious - you are using the deprecated headers i.e. thos that end
with .h - Instead use the standardized iostream with namespace std
The following code should do fine!

#include <iostream>
int main()
{
        std::cout << "It is working " << std::endl;
return 0;
}

OR

#include <iostream>
Using namespace std
int main()
{
   cout << "It is working " << endl;
   return 0;
}

 
Cheers / Ali
-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of Ankit Jain
Sent: Monday, January 10, 2005 6:10 PM
To: linux prg
Subject: if somebody can tell why this warnign is there?/

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
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

