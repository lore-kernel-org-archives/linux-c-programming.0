From: "Chandan Chopra" <chandan.chopra@patni.com>
Subject: RE: Memory Allocation Problem
Date: Wed, 15 Sep 2004 12:08:08 +0530
Sender: gcc-help-owner@gcc.gnu.org
Message-ID: <000201c49aee$90a80180$c55ba8c0@patni.com>
References: <ci8ne4$j4k$1@sea.gmane.org>
Reply-To: <chandan.chopra@patni.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----------=_1095230136-9496-72"
Return-path: <gcc-help-return-17893-gcc-help=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
In-Reply-To: <ci8ne4$j4k$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: 'Suciu Flavius' <suciuflavius@tiscali.de>, linux-c-programming@vger.kernel.org
Cc: gcc-help@gcc.gnu.org

This is a multi-part message in MIME format...

------------=_1095230136-9496-72
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Or workaround could be you make declaration of 'a' global.

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of Suciu
Flavius
Sent: Wednesday, September 15, 2004 9:06 PM
To: linux-c-programming@vger.kernel.org
Cc: gcc-help@gcc.gnu.org
Subject: Re: Memory Allocation Problem


1450 * 1450 * 8 = 16 MEGA!!!!!!!!!
So, you need a 16 mega of stack which I think is a little too much  ;)

The solution is to malloc() but check if you have 16 mega of ram ;)


Ankit Jain wrote:
>       1 #include <stdio.h>
>       2 int main()
>       3 {
>       4    double a[1450][1450];
>       5
>       6    a[1449][0] = 999;
>       7    printf( "%lf\n", a[1449][0] );
>       8    return 1;
>       9 }
>
>
> it gives segementation fault
>
> if i use malloc also it gives wrong result
>
> what to do?
>
> ankit
>
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping"
> your friends today! Download Messenger Now
> http://uk.messenger.yahoo.com/download/index.html
>

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



http://www.patni.com
World-Wide Partnerships. World-Class Solutions.
_____________________________________________________________________

This e-mail message may contain proprietary, confidential or legally
privileged information for the sole use of the person or entity to
whom this message was originally addressed. Any review, e-transmission
dissemination or other use of or taking of any action in reliance upon
this information by persons or entities other than the intended
recipient is prohibited. If you have received this e-mail in error
kindly delete  this e-mail from your records. If it appears that this
mail has been forwarded to you without proper authority, please notify
us immediately at netadmin@patni.com and delete this mail. 
_____________________________________________________________________

------------=_1095230136-9496-72--
