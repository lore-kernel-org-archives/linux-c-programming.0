From: Erik Mouw <erik@harddisk-recovery.com>
Subject: Re: Random number generator in Linux kernel
Date: Tue, 8 Mar 2005 14:31:49 +0100
Message-ID: <20050308133149.GC31844@harddisk-recovery.com>
References: <20050307231853.9F661B6E7@xprdmailfe20.nwk.excite.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050307231853.9F661B6E7@xprdmailfe20.nwk.excite.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vineet Joglekar <vintya@excite.com>
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

On Mon, Mar 07, 2005 at 06:18:53PM -0500, Vineet Joglekar wrote:
> I want a function where I will be supplying a seed to that function
> as an input, and will get a random number back. If same seed is used,
> same number should be generated again.

Google for "Numerical recipes in C", it has a complete section about
random numbers, including a couple of functions that do what you want.


Erik

-- 
+-- Erik Mouw -- www.harddisk-recovery.com -- +31 70 370 12 90 --
| Lab address: Delftechpark 26, 2628 XH, Delft, The Netherlands
