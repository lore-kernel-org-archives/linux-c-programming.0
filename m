From: zavandi <zavandi@easynet.ro>
Subject: Re: Value to subtract from ESP register?
Date: Wed, 24 Mar 2004 21:39:53 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4061E409.30602@easynet.ro>
References: <4061B5C4.7040907@easynet.ro> <001601c411c4$f6b02e20$8b1705d5@carlos>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <001601c411c4$f6b02e20$8b1705d5@carlos>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Chris Nanakos wrote:
> This is the optimazation code that gcc uses.It differs from version to
> version and you can discover it only if you work with different
> arguments(values) in your arrays.After a step the subtraction of ESP is the
> same e.g for 128 and so on.But i think that somewhere on the documentation
> of gcc is already written.

Thanks. I've looked in the gcc's documentation but I was unable to find 
the answer to my problem (or maybe I didn't look in the right 
documentation).

Anyway, about my specific example, how subtracting 24 instead of 4 is 
gonna optimize anything?

