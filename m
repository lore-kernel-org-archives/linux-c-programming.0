From: Jeff Woods <Kazrak+kernel@cesmail.net>
Subject: Re: Some question about one method.
Date: Mon, 24 May 2004 18:06:30 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <6.0.1.1.0.20040524175732.02d159a0@no.incoming.mail>
References: <1085135081.21344.21.camel@relay.localnet>
 <20040521211714.GP1912@lug-owl.de>
 <c8sab1$biq$1@sea.gmane.org>
 <20040524173017.GW1912@lug-owl.de>
 <c8u049$b00$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <c8u049$b00$1@sea.gmane.org>
References: <1085135081.21344.21.camel@relay.localnet>
 <20040521211714.GP1912@lug-owl.de>
 <c8sab1$biq$1@sea.gmane.org>
 <20040524173017.GW1912@lug-owl.de>
 <c8u049$b00$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Charlie Gordon <gmane@chqrlie.org>
Cc: linux-c-programming@vger.kernel.org

At 5/25/2004 01:24 AM +0200, Charlie Gordon wrote:
>>char *a;
>>short *b;
>>int *c;
>>long *d;
>>long long *e;
>>
>>--> What's the difference between a++ and e++?
>
>it makes them point to the next element in the arrays of respective types, 
>and as such increments the binary value by a different amount.
>
>More interestingly what is the difference between e[5] and 5[e] ?

Since pointer addition is commutative [i.e., *(e+5) == *(5+e) ] they're the 
same thing.

My favorite C obfuscation.  (And I only use it when I intend to be obtuse! 
:)  Note below that "j" is an int and "t" is an array of char and there's a 
"putchar(j[t])" in there.  [Yes, it compiles and runs.]

--
int main(void){int j=2003;/*(c)2003 cishikawa.*/
char t[]="+<WJ> @abcdefghijklmnopqrstuvwxyz.,\n\"";
char*i="y>b<+x,m+tie@.juswndnc@dt<Wupi\"JWhysbJirviiy";
while(*i)((j+=strchr(t,*i++)-(int)t),(j%=sizeof t-1),
(putchar(j[t])));return 0;}/* under GPL */ 


