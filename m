From: "Govind Raghuram" <Govind_Raghuram@Sifycorp.com>
Subject: Re: strange gcc warning
Date: Tue, 14 Jan 2003 12:31:41 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <65256CAE.00269D5F.00@Sifycorp.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shanks <mshanks79@yahoo.co.in>
Cc: Elias Athanasopoulos <eathan@otenet.gr>, linux-c-programming@vger.kernel.org



Your definition will remain local as long as you dont include errno.h



                                              Placed At :


Shanks <mshanks79@yahoo.co.in> on 01/13/2003 11:37:50 PM

To:   Elias Athanasopoulos <eathan@otenet.gr>
cc:   linux-c-programming@vger.kernel.org (bcc: Govind Raghuram/Satyam)

Subject:  Re: strange gcc warning




--- Elias Athanasopoulos <eathan@otenet.gr> wrote:
> On Mon, Jan 13, 2003 at 09:57:55AM -0800, Shanks wrote:
> > my_print(int errno)
>
> errno is defined in errno.h. You shouldn't use a new variable with this
> name.
Yes i am aware of errno being defined in errno.h
But isn't my definition local to my func.
Any technical reason why i am getting such a gdb output(pasted in prev mail)

> Elias
-Shanks

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-programming"
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html





