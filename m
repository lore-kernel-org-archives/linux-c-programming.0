From: "Gre Taguran" <gtaguran@sni.ph>
Subject: Re: array size 1 ? 	All headers
Date: Wed, 21 Jul 2004 10:27:35 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040721015338.M80608@sni.ph>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

i think its not array of 1 but instead array of 2 which is 0 and 1 index. maybe 
it is because u were thinking that the last array index (in this case is 1) is 
null, but it is only applicable when handling string because string needs a 
terminated string. ex.

char tst[1];
tst[0]='g';
tst[1]='r';
printf("%s",tst); //this would print gr<and more chars here because it is not 
terminated
printf("%c=%c"); //this will print gr meaning tst[1] is alocated by 'r'

try this out.

>Hi, 
>What does an array of size 1 mean? or maybe I might be putting it wrong, so 
>here's the declaration - 
>
>struct option_state { 
>   int refcnt; 
>   int universe_count; 
>   int site_universe; 
>   int site_code_min; 
>   VOIDPTR universes[1]; 
>}; 
>
>(code from ISC DHCP sources includes/dhcpd.h) 
>
>What does universes[1] mean here? 
>
>Thanks. 
>-Anshu


GRETAGS
http://www.sni.ph/~gtaguran
Research & Software Development
SNI Phils. CDO 
Tel no. 8585773/720011

--
Message sent using e-Finity WebMail 2.0
System Net International, Philippines, Inc.
an affiliate of SNI, Virginia, USA
www.sni.ph www.sni-inc.com

