From: "Vineet Joglekar" <vintya@excite.com>
Subject: Random number generator in Linux kernel
Date: Mon,  7 Mar 2005 18:18:53 -0500 (EST)
Message-ID: <20050307231853.9F661B6E7@xprdmailfe20.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-c-programming@vger.kernel.org


Hi all,



Can someone please tell me where can I find and which random/pseudo-random number generator can I use inside the linux kernel? (2.4.28)



I found out 1 function get_random_bytes() in linux/drivers/char/random.c but thats not what I want.



I want a function where I will be supplying a seed to that function as an input, and will get a random number back. If same seed is used, same number should be generated again.



Can anybody please help me with that?



Thanks and regards,



Vineet.

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
