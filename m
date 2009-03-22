From: Volker Kokula <kokula@informatik.uni-wuerzburg.de>
Subject: Re: Socket programming
Date: Sun, 22 Mar 2009 14:41:22 +0100
Message-ID: <49C64002.2040007@informatik.uni-wuerzburg.de>
References: <20090322063116.1C31F627@resin17.mta.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20090322063116.1C31F627@resin17.mta.everyone.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ajhwb@knac.com
Cc: linux-c-programming@vger.kernel.org

Hi Ardhan,


you're going to write an enterly unportable and insecure program. If you 
want just send a structure from one host to another look for a library 
which does the packing and unpacking over the network for you.

For example json-c [1] or csoap [2]


Volker



[1] http://oss.metaparadigm.com/json-c/
[2] http://sourceforge.net/projects/csoap/
