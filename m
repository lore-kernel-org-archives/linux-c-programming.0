From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: ioctl command FIONREAD
Date: Mon, 20 May 2002 21:01:46 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020520210146.B1152@neutrino.particles.org>
References: <3CE8B6A8.92F8E7E@unidec.ro>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3CE8B6A8.92F8E7E@unidec.ro>; from bubulac@unidec.ro on Mon, May 20, 2002 at 11:41:12AM +0300
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bubulac Tatiana <bubulac@unidec.ro>
Cc: linux-c-programming@vger.kernel.org

On Mon, May 20, 2002 at 11:41:12AM +0300, Bubulac Tatiana wrote:

> Does anyone know what FIONREAD ioctl command does means? I use SCO Open
> Server 5.05.
> In Linux this command does not exist.

You have already got the answer. Just to add that FIONREAD applies only to
non-blocking I/O.

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
