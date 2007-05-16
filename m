From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: C or C++
Date: Wed, 16 May 2007 19:14:33 +0530
Message-ID: <464B0AC1.2070501@gmail.com>
References: <463B1244.6080802@gmail.com> <17979.14634.85216.727844@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17979.14634.85216.727844@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Glynn Clements wrote:
> If it's likely to be useful to other libraries, there's a strong
> incentive to use C, or at least to provide a C API (the standard
> implementation of GLU is written in C++, although the public API only
> uses C).

Would it be enough if I ensure that the API header file does not contain 
any C++-only usages for such a library internally implemented in C++ to 
be linkable from a C program or library?

Or would there be problems with the C linker not being able to resolve 
references from the C object code to C++ symbols in the library? (I hope 
I got that terminology correct.)

Thanks again.

Shriramana Sharma.

