From: John de la Garza <john@jjdev.com>
Subject: byte-copy
Date: Sun, 19 Oct 2014 17:44:57 -0400
Message-ID: <20141019214454.GA14560@John-de-la-Garzas-Macbook-Pro.local>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

firgured it out...

I was passing size, but needed to pass size * sizeof(int)
