From: Vidya Kotamraju <vidyakr@darya.nio.org>
Subject: Control key with Ncurses
Date: Thu, 03 Jul 2003 12:30:17 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F03D481.1080008@darya.nio.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi all,

I am writing a graphics-based application in Linux by making use of C 
and ncurses library.
The application needs that i take two numbers as input ( i make use of 
scanw for the same).
However at this point in the program i want the user to obtain the 
flexibility of exiting gracefully from the program(by pressing a cntrl 
key,like say F5).

Cntrl-D doesnt seem to work with ncurses..

Heres a snippet of the code.....



/*FORM INITIALIZATION*/

my_form = new_form(field);
post_form(my_form);
refresh();

mvprintw(1,8,"NOTE:THE ROW AND COLUMN ARE AS DEFINED IN MATRIXALGEBRA");
mvprintw(2,8,"Enter the row and column coordinates(i and j values):");

mvprintw(3,8,"i and j: ");
scanw("%d %d",&i,&j);

// at this point i want to exit from the program if F5 key is pressed.



Any pointers ?

Regards,
Vidya

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

