From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Need for const in function argument list
Date: Sun, 26 Mar 2006 16:14:39 +0530
Message-ID: <200603261614.39708.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

In the Qt constructor for the DateTime class, I see:

QDateTime::QDateTime(const QDate &date)

what is the need for the keyword const here? If it is to indicate that the 
date variable does not change, then in very many such places should the const 
keyword be used. But it is not.

As a related question, in the syntax for printf, we have printf(const char 
*format) -- why should we have const here?

-- 

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-03-26 W12-7 UTC+0530
