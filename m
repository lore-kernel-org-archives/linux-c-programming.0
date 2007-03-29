From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Custom defined object in a signal handler
Date: Thu, 29 Mar 2007 01:09:01 +0100
Message-ID: <17931.925.199685.326663@cerise.gclements.plus.com>
References: <460b0048.12917d31.29d5.102f@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <460b0048.12917d31.29d5.102f@mx.google.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sreevathsa <sreevathsa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Sreevathsa wrote:

> I have a question regarding signals. Is there a way you can pass some custom
> defined parameter (say, a struct foo * ) to a signal handler??

No (other than by using a global variable).

As you can only install a single handler for any given signal, there
isn't any real need to support closures.

-- 
Glynn Clements <glynn@gclements.plus.com>
