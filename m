From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: setenv and dlopen
Date: Wed, 26 Oct 2005 15:46:33 +0100
Message-ID: <17247.38601.989240.506155@cerise.gclements.plus.com>
References: <1130262724.7414.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1130262724.7414.14.camel@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Henry Margies <henry.margies@gmx.de>
Cc: linux-c-programming@vger.kernel.org


Henry Margies wrote:

> I have a problem using dlopen and setting the LD_LIBRARY_PATH with
> putenv or setenv. 

ld-linux.so.2 reads the value into a variable at startup, and uses the
stored value thereafter.

-- 
Glynn Clements <glynn@gclements.plus.com>
