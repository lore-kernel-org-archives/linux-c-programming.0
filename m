From: Balachandar <bala1486@gmail.com>
Subject: Error in compiling a module
Date: Tue, 27 Jul 2010 17:17:48 -0400
Message-ID: <AANLkTikcGVVaofeUZtvPs+jpA11uXs-baTZ8O8NvH94i@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=WYuoMDMEht+4Wj/rPpN2HRjZwHCoG2wj38unAqfDQ20=;
        b=qwiJ2BswWuacFYWOEzICEsSAsKc0WIFR2CjV4mitukvyGvrj8gDhIEBEAPWzjwzkGj
         sg2j6Kd67clxkJj89GRPSv57vIQd09Sx+ci8TAEk2roqu3lxlmZQxt2aTo4/F/SdkkRQ
         ZaHcUpAm6JF4Rsi+YUWag6vKtgC+jk6KekH9A=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org

Hello,
 I am trying add a new network protocol family to the kernel. But i
get the following error for .h file  '11: two or more data types in
declaration specifiers


In .c file

18: static struct net_proto_family ucnet_family_ops = {
19:	.family = PF_UCNET,
20:	.create = sock_ucnet_create,
21:	.owner = THIS_MODULE,
22:        } ;


In .h file

11: int sock_ucnet_create(struct net *net, struct socket *sock, int
protocol, int KERN);


I appreciate any help
