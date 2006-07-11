From: Fabio Miranda Hamburger <fabmirha@ulatina.ac.cr>
Subject: Remove x number of decimals from a float value
Date: Tue, 11 Jul 2006 12:10:13 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0607111209430.16861@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello,

I am trying to implement a 100% math function ( avoid handle the float as 
a char array), that remove x number of decimals from the right to the 
float point.

Example:
Given x= 12345.6789 I call the function with (x,2) and the returned number 
is: x= 12345.67, for (x,4) returned value is x=12345

I was trying to implement this function using datatype casting, abs() and 
other functions from math.h library.

Thanks for any advice,


---
Fabio Andres Miranda
Ingenieria de sistemas informaticos
Universidad Latina - Costa Rica

