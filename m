From: "Paul Gimpelj" <pgimpelj@sympatico.ca>
Subject: compression heuristic algorithm
Date: Fri, 25 Jun 2004 16:40:08 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <004001c45af4$9b7da7c0$c901010a@zoom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

hi,

I am looking for an algorithm.

Can anyone help.

Hypothesis:  There is a shift register system that will produce a repeatable
and predictable sequence of values. This sequence can be totally defined
with a starting value and the input parameters to the shift register system.

In other words 700mb of file can be compacted to one byte and a matrix of
parameters to input into the shift register system.
And the file will be compacted by 99.9% or greater. So 10 cds can be
distributed in 1.44 floppy format.

The pratical aspect is to have an heuristic to determine the matrix of
parameters, Time to compute is relatively unimportant since the file is to
be archived.

Thanks,

regards,
Paul ( operations research graduate)

