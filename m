From: kaushal <kaushal@rocsys.com>
Subject: readline display
Date: Wed, 20 Apr 2005 17:21:46 +0530
Message-ID: <1113997906.5041.50.camel@localhost.localdomain>
Reply-To: kaushal@rocsys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>

Hello all,
	 After many days,I got the solution for the problem now,which  I
mentioned previously:in the tab handling function I need to call the
function:

rl_on_new_line()

kaushal-

