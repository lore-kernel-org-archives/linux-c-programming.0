From: joy <gracecott@sancharnet.in>
Subject: Re: Serial revisited
Date: Mon, 10 May 2004 20:51:08 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <409F9DE4.9000000@sancharnet.in>
References: <409DAB41.1000608@sancharnet.in>
Reply-To: gracecott@sancharnet.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

joy wrote:

> Hi again,
>
> I had a small doubt  about serial transmission,(AGAIN:-(  )
> it's just this:
> If I want to send an int through the port, which is stored as 32 bytes 
> in any comp, but my target platform is an 8 bit one, how can I do
> it without losing information(Eg:    opcodes for any 8 bit processor 
> cross assembled on the PC)

figured it out. I just had to write the whole code into a char .looks 
funny, but after all, its a binary file

sorry for wasting  your time, thanx to all.

>
> Thanx in advance,
> Joy.M.M
>
>                          




