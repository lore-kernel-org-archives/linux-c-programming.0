From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: Re: structure size
Date: Thu, 6 Mar 2003 09:33:05 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0303060932260.11625-100000@soochak.ncst.ernet.in>
References: <65256CE0.00269E0A.00@sandesh.hss.hns.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <65256CE0.00269E0A.00@sandesh.hss.hns.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hbajaj@hss.hns.com
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>


On Wed, 5 Mar 2003 hbajaj@hss.hns.com wrote:

> 
> 
> the structure size is always multiple of the size of element with max size in
> that structure.
> Suppose
> struct {
> int a;
> char b;
> }
> then size of struct will be multiple of the size of int i.e 4 on solaris.So size
> will be 8 bytes as sizeof(a)+sizeof(b) = 5 so to make it multiple of 4 it pads
> it with 3 bytes.

Why it is so? any specific reason!

> if we have
> struct {
> short int a;
> char b;
> }
> then size of struct will be multiple of the size of int i.e 2 on solaris.
> 
> Rgds
> Harvinder Bajaj
> 
> 
> 
> 
> Mohammed Khalid Ansari <khalid@ncst.ernet.in> on 05-03-2003 12:32:01 PM
> 
> To:   linux c programming mailing list <linux-c-programming@vger.kernel.org>
> cc:    (bcc: Harvinder Bajaj/HSS)
> 
> Subject:  structure size
> 
> 
> 
> 
> 
> Hi,
> 
> why the sizeof sturcture is alway greater than the collective sizes of all
> the elements in it.
> 
> eg
> struct node {
>      int  a;
>      char c;
>      int  b;
> };
> 
> int main()
> {
>      printf ("%d\n", sizeof (struct node));
>      return 0;
> }
> 
> 
> it prints 12 in my case.
> 
> where is the catch.
> 
> --
> 
> **************************************************************************
> 
> Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
> Assistant Manager II                          (off) : 0091-022-2024641
> National Centre for Software Technology   Fax       : 0091-022-2049573
> 8th flr,Air India Build. Nariman Point,   E-Mail    : khalid@ncst.ernet.in
> Mumbai 400021.
> 
> Homepage : http://soochak.ncst.ernet.in/~khalid
> 
> **************************************************************************
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
> 

