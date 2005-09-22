From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Automake (off topic)
Date: Thu, 22 Sep 2005 19:31:03 +0100
Message-ID: <17202.63591.294652.653986@cerise.gclements.plus.com>
References: <4332F335.9080206@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4332F335.9080206@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: oracle nine <oracle.nine@gmail.com>
Cc: linux-c-programming@vger.kernel.org


oracle nine wrote:

> im writing a gtk app with glade that uses automake, autoconfig, libtool 
> ,etc. When I add new source files to the project, make does not build 
> them. What file do you edit before you run autogen to ensure that all 
> the source files are included. thanks

Makefile.am

-- 
Glynn Clements <glynn@gclements.plus.com>
