From: Jeff Woods <kazrak+kernel@cesmail.net>
Subject: Re: Newbie Question -> writing Hexadecimal values
Date: Thu, 25 Sep 2003 15:36:42 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.2.1.1.0.20030925145528.02e64a88@no.incoming.mail>
References: <3F735CC4.5030507@ig.com.br>
 <20030925181117.256d0a31.sapuglha@yahoo.com.br>
 <3F735CC4.5030507@ig.com.br> <20030925183510.239df26c.sapuglha@yahoo.com.br>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030925183510.239df26c.sapuglha@yahoo.com.br>
References: <3F735CC4.5030507@ig.com.br>
 <20030925181117.256d0a31.sapuglha@yahoo.com.br>
 <3F735CC4.5030507@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: sapuglha@yahoo.com.br
Cc: Luciano Moreira - igLnx <lucianolnx@ig.com.br>, linux-c-programming@vger.kernel.org

There is at least one bug in your code below:

At 9/25/2003 06:35 PM -0300, Sapuglha wrote:
>#define DecValFromHexaChar(c) ((c)>='A' && (c)<='F' ?'A'-(c)+10 :(c))
>         int hexaVal=0;


I think you mean:
#define DecValFromHexaChar(c) ((c)>='A' && (c)<='F' ?(c)-'A'+10:(c)-'0')
         char hexaVal=0;


Simple function to convert an arbitrary ASCII string from any numeric base 
(up to 36) to an unsigned binary:

int str2int(const char *str, const int base)
{
         int     result = 0;
         char    digit;
         assert(base>1);
         assert(str != NULL);
         while (digit = *str++) {
                 if (digit >= '0' && digit <= '9') digit -= '0';
                 else if (digit >= 'A' && digit <= 'Z') digit -= 'A'-10;
                 else if (digit >= 'a' && digit <= 'z') digit -= 'a'-10;
                 else assert(("invalid digit",0));
                 assert(digit<base);
                 result=result*base+digit;
         }
         return result;
}

int main(void) {        /* sample call */
         printf("%X\n", str2int("DeadBeef", 16));
         return 0;
}

P.S.  That's off the top of my head and there may be logic or other errors, 
but you probably get the gist of the code.

--
Jeff Woods <kazrak+kernel@cesmail.net> 


