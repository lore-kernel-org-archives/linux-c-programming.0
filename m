From: Helmut Djurkin <djh@tscheinig.com>
Subject: Re: structure size
Date: Wed, 05 Mar 2003 08:27:26 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3E65B4EE.8080803@tscheinig.com>
References: <Pine.LNX.4.33.0303051227480.30291-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0303051227480.30291-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>

hi,
it's the alignment.

with gcc and this:
struct node {
	/* member here */
} __attribute__((packed));

you will get the your "collective sizes".


Mohammed Khalid Ansari wrote:
> Hi,
> 
> why the sizeof sturcture is alway greater than the collective sizes of all 
> the elements in it.
> 
> eg
> struct node {
> 	int	a;
> 	char	c;
> 	int	b;
> };
> 
> int main()
> {
> 	printf ("%d\n", sizeof (struct node));
> 	return 0;
> }
> 
> 
> it prints 12 in my case.
> 
> where is the catch.
> 



