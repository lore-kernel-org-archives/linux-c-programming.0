From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: mmap() to a specific address
Date: Mon, 1 Jul 2002 22:03:51 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020701220351.A2129@neutrino.particles.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi all,

Can I force a mmap() to a specific address? As I read in the man page the
address which is passed in mmap() is only a hint; the kernel will eventual-
ly decide in which page the object will be mapped. But, is there any ugly
hack to accomplish a very specific mmap()?

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
