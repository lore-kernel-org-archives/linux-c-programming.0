From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Syntax of constructor
Date: Mon, 20 Mar 2006 08:41:16 +0530
Message-ID: <200603200841.16674.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

A header file contains the following class declaration:

class CAA2DCoordinate
{
public:
//Constructors / Destructors
	CAA2DCoordinate(): X(0), Y(0) {};

//member variables
  double X;
  double Y;
};

Now what I do not understand is the line:

	CAA2DCoordinate(): X(0), Y(0) {};

I would have thought it would be:

CAA2DCoordinate() { X = 0; Y = 0; }

just like the QDate constructor:

    QDate() { jd = 0; }

What is the meaning of the colon ":" here, and what are the (0) things, and 
why are X and Y *outside* the braces?

Thanks for your patience.

-- 

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-03-20 W12-1 UTC+0530
