From: nanakos@wired-net.gr
Subject: Re: linking at run time.
Date: Thu, 10 Jul 2003 10:18:14 +0300 (EEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1185.195.251.244.232.1057821494.squirrel@webmail.wired-net.gr>
References: <00be01c34553$57ea97a0$caba0ba4@uwe.ac.uk> 
     <16138.54505.701672.164306@cerise.nosuchdomain.co.uk> 
     <012101c3462f$ec43a810$caba0ba4@uwe.ac.uk> 
     <16140.52121.385331.351810@cerise.nosuchdomain.co.uk> 
     <003501c346c8$d32cd4c0$ed64a8c0@descartes>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Received: from wired-net.gr (localhost.localdomain [127.0.0.1])
	by enigma.wired-net.gr (******/******) with SMTP id h6A7IE4x015874;
	Thu, 10 Jul 2003 10:18:14 +0300
In-Reply-To: <003501c346c8$d32cd4c0$ed64a8c0@descartes>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: linux-c-programming@vger.kernel.org

Just check dlopen,dlclose,dlsym.I think that it should be fine with your
problem.

Best regards,
Chris.
