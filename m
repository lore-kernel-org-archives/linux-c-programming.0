From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: strange gcc warning
Date: Mon, 13 Jan 2003 21:25:09 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030113212508.B1128@neutrino.particles.org>
References: <20030113175755.71066.qmail@web8001.mail.in.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030113175755.71066.qmail@web8001.mail.in.yahoo.com>; from mshanks79@yahoo.co.in on Mon, Jan 13, 2003 at 09:57:55AM -0800
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shanks <mshanks79@yahoo.co.in>
Cc: linux-c-programming@vger.kernel.org

On Mon, Jan 13, 2003 at 09:57:55AM -0800, Shanks wrote:
> my_print(int errno)

errno is defined in errno.h. You shouldn't use a new variable with this
name.

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
