From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: array pointer
Date: Tue, 18 Jan 2011 15:46:48 +0100
Message-ID: <op.vpid0asz3l0zgt@mnazarewicz.zrh.corp.google.com>
References: <AANLkTi=n0P0DQSU8a2OMgEaeUAeCNuecjSg0+2MdF8+_@mail.gmail.com>
 <AANLkTi=DzN67nS=+s4408dBkAptJsA97=0EkYY+8WX9d@mail.gmail.com>
 <AANLkTim=n1tgwJgxnrtsdH0itKew7M2AD5C_Q_qkmtGX@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:content-type:to:subject:references:date
         :mime-version:content-transfer-encoding:from:organization:message-id
         :in-reply-to:user-agent;
        bh=TDh4hegyD3HASFO/O/aNm52HFB4a3x0qGLs9KdpcUeI=;
        b=De8V9cHIAjCinPsBeYZIW3iMcqG4NPaDwmcmfojHB14WeHav1MT+Y528iX7nzn/4gw
         YcvgSIzg1bgVgcPfDb0EKUOIJRvoiZk6fYTRjrmySgFc5NYSellU+9I6fgWdH0PQggpJ
         PusWC98El4Z6cvTaZnk6EkdDumD/xTQ35QWLs=
In-Reply-To: <AANLkTim=n1tgwJgxnrtsdH0itKew7M2AD5C_Q_qkmtGX@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-c-programming@vger.kernel.org, ratheesh k <ratheesh.ksz@gmail.com>

On Tue, 18 Jan 2011 14:32:43 +0100, ratheesh k <ratheesh.ksz@gmail.com>  
wrote:

> int  *s_ptr;
> int  **d_ptr;
> int arr[2][2]={1,2,3,4};

One image is worth a thousand words, so here it goes:

arr is something like this in memory:

+---+---+---+---+
| 1 | 2 | 3 | 4 |
+---+---+---+---+

d_ptr would require something like:

+---------+---------+
| pointer | pointer |
+----|----+----|----+
      |         |     +---+---+
      |         +---> | 3 | 4 |
      |     +---+---+ +---+---+
      +---> | 1 | 2 |
            +---+---+

Ie. in arr all the numbers are lied linearly in memory whereas
int **d_ptr is an array of pointers to array of ints.
