From: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Tue, 2 Aug 2005 17:04:45 +0530
Message-ID: <038e01c59756$3c8fdd10$9900a8c0@ispl091>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091><6eee1c40508010514517b5b90@mail.gmail.com><015a01c59694$80662070$9900a8c0@ispl091><20050801161125.716db5ff@localhost.localdomain><003b01c59715$d3ffef00$9900a8c0@ispl091><6a00c8d5050801234267dd0f7f@mail.gmail.com><01dd01c5972f$5c3b62a0$9900a8c0@ispl091> <17135.20687.821822.269575@cerise.gclements.plus.com> <02c401c59745$2aaa0410$9900a8c0@ispl091> <20050802170826.D276@Imrashi.net.bd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi Progga,
    Thanks for the reply. Yes, __attribute__(packed) can be used but that
comes with processing overhead. I read some where on net (I am not very sure
about that), all compilers do not support such construct.

Regards,
Amit Dang
----- Original Message ----- 
From: "Progga" <abulfazl@juniv.edu>
To: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>
Cc: <linux-c-programming@vger.kernel.org>
Sent: Tuesday, August 02, 2005 4:38 PM
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
On Tue, Aug 02, 2005 at 03:02:35PM +0530, Amit Dang wrote:

>     You are very right in saying that "there is no need for structures to
> have same layout on different platform" until structures are being written
> directly to the file system. But many time there is a requirement that the
> data file can be moved across platforms.

 In that case use __attribute__ ((packed)) after the structure definition.
There'll be no alignment then and the size will always be the same.

 struct hihi{
  int a ;
  char b ;
 } __attribute__ ((packed)) ;



