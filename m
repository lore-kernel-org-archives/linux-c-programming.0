From: "J." <mailing-lists@xs4all.nl>
Subject: optimal exchange of data inbetween 2 processes
Date: Mon, 10 May 2004 04:52:41 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0405100438130.16456-100000@hestia>
References: <409DAB41.1000608@sancharnet.in>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <409DAB41.1000608@sancharnet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Monday, May 10 04:38:13

Hello, 

I have almost fininshed the code for a program which is split in to two
processes. The only thing I have to do now is to connect them so that they
can exchange data.

One process generates data, the other one reads it. The amount of data
which needs to be transfered is fairly small, roughly 800 bytes a second.

What is the best way to implement this, with sockets or with pipes ?
Are there any 'general' guidelines for what option to use and what not to
use regarding the amount of data that needs to be transfered ?

Thnkx a lot.. If you guys could give me some thoughts.. 

J.

