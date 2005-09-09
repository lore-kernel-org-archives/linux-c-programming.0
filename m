From: _z33 <timid.Gentoo@gmail.com>
Subject: default function parameters
Date: Fri, 09 Sep 2005 11:43:44 -0700
Message-ID: <dfr8v1$kn7$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

   I had a wierd doubt today morning. If a function's return type is not 
defined, "C" takes it as returning "int". Now, what does it do when I 
don't specify the arguments of the function. Something like this -

   void sampleFunc ()
   {
	/* ... */
   }

   Is this equivalent to saying,

   void sampleFunc (void)
   {
	/* ... */
   }

_z33
-- 
I love TUX; well... that's an understatement :)

