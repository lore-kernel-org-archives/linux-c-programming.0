From: Libin Yang <lbyang@marvell.com>
Subject: RE: macro to print filename
Date: Wed, 1 Jun 2011 19:10:32 -0700
Message-ID: <A63A0DC671D719488CD1A6CD8BDC16CF19D9D799D5@SC-VEXCH4.marvell.com>
References: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
Content-Language: en-US
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: ratheesh kannoth <ratheesh.ksz@gmail.com>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

man 3 basename

Regards,
Libin 

> -----Original Message-----
> From: linux-c-programming-owner@vger.kernel.org
> [mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of ratheesh kannoth
> Sent: Thursday, June 02, 2011 12:08 AM
> To: linux-c-programming@vger.kernel.org
> Subject: macro to print filename
> 
> __FILE__ macro prints relative path name of the file. I need only
> filename. How to extract this ?
> 
> I dont want to use any string library - since it includes more
> Processing and needs to store the character array in executable. IS
> there any method at preprocessing level to do this .
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
