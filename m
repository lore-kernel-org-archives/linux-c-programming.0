From: "David S. Miller" <davem@redhat.com>
Subject: Re: this code does not get called in dev.c so do we need it?
Date: Wed, 02 Oct 2002 17:10:42 -0700 (PDT)
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20021002.171042.42890215.davem@redhat.com>
References: <20021002140236.53405.qmail@web13107.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <20021002140236.53405.qmail@web13107.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux_learning@yahoo.co.uk
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org


Fast routing, although not implemented in any in-tree drivers,
does get used by some people who have hacked up drivers to support
this.

It allows IPv4 routing to occur right at the level of the device
driver, it directly pushes an input packet to the output routine
of the destination device all without leaving the driver.

This code is used.
