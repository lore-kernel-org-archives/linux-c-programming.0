From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: code to list contents of zip files
Date: Fri, 30 Oct 2009 20:36:47 +0000
Message-ID: <19179.20063.832503.999859@cerise.gclements.plus.com>
References: <4ADDADEE.1060806@sun.com>
	<19165.47003.922855.202636@cerise.gclements.plus.com>
	<4ADEFDE3.9000303@sun.com>
	<19167.22609.946075.575192@cerise.gclements.plus.com>
	<4AE04FD0.9080603@sun.com>
	<4AE94373.8020702@sun.com>
	<4AE96180.8000807@sun.com>
	<19178.20399.326515.377343@cerise.gclements.plus.com>
	<4AEA8F99.3090201@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4AEA8F99.3090201@sun.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Prasanta Sadhukhan wrote:

> Thanks. I tried finding the central directory and list the contents 
> which I am now able to do. I got the match also but I am not sure how 
> would I get the contents once I get the match.

Once you've located the correct file header in the central directory,
the "relative offset of local header" field will allow you to find the
corresponding local file header, and the compressed data will be after
that.

-- 
Glynn Clements <glynn@gclements.plus.com>
