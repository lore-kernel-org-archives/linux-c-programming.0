From: Vidya Kotamraju <vidyakr@darya.nio.org>
Subject: Re: Control key with Ncurses
Date: Fri, 04 Jul 2003 16:14:25 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F055A89.4000401@darya.nio.org>
References: <3F03D481.1080008@darya.nio.org> <16131.55520.62578.551805@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

I had enabled the keypad() along with the other graphics initializations.
Also, Control codes do work with getch().
But what i need to know is how to make use of a control key to exit out 
of a scanw input. (As control-D would work with scanf without needing to 
make use of getchar)


Regards,
Vidya.

Glynn Clements wrote:

 > Vidya Kotamraju wrote:
 >
 >
 >>I am writing a graphics-based application in Linux by making use of C
 >>and ncurses library.
 >>The application needs that i take two numbers as input ( i make use of
 >>scanw for the same).
 >>However at this point in the program i want the user to obtain the
 >>flexibility of exiting gracefully from the program(by pressing a cntrl
 >>key,like say F5).
 >>
 >
 > You need to call keypad() to enable the use of "extended" keys
 > (funcion keys, arrow keys etc). The various KEY_* macros define the
 > codes for the extended keys; for function keys, use KEY_F(), e.g.
 > KEY_F(5) for F5.
 >
 >
 >>Cntrl-D doesnt seem to work with ncurses..
 >>
 >
 > Control codes should be reported by getch() etc as a code in the range
 > 0 to 31 (e.g. Ctrl-D should be code 4).
 >
 >


-- 
--------------------------------------------------------------------------
As far as the laws of mathematics refer to reality,they are not certain;
and as far as they are certain, they do not refer to reality.
                                        - Albert Einstein (1879-1955)
--------------------------------------------------------------------------
Kotamraju Vidya
Marine HydroDynamics Lab,
Physical Oceanography Division,
National Institute of Oceanography,
Dona Paula, Goa 403 004, India.
Ph.: +91-832-2456700 *4400 (O)
       +91-832-2541756 (R)
e-mail: vidyakr@darya.nio.org


