From: Jad Saklawi <Jad@Saklawi.info>
Subject: Re: circular linked list
Date: Sat, 27 Mar 2004 22:12:47 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4065E03F.9010306@Saklawi.info>
References: <c443sr$9f9$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <c443sr$9f9$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: MuthuKumar <ramana_muthu@yahoo.co.in>
Cc: linux-c-programming@vger.kernel.org

MuthuKumar wrote:

>Hai All,
>
>        what is the key concept of circular linked list.
>
>        My known method is we can do using head value of 1 (first data)
>        1 - > 2 -> 3 -> 4 ->1  (4 is the last data at this chain)
>        Is it correct to do the circular linked list.
>        how we have to delete some value in the list.
>        If i want to delete 3 means what steps we have to do.
>
>        Is there a way to simulate the list with out having the assignment
>of head.
>  
>
  Yes, this is done by passing a pointer to the start pointer. An 
implementation can be found here :  
http://annex.sagehall.com/~abukhzam/cp2/CPII.html

Greets,
Jad
