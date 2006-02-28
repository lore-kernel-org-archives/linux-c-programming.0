From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: A safe scanf function
Date: Tue, 28 Feb 2006 09:59:21 +0530
Message-ID: <200602280959.21099.samjnaa@gmail.com>
References: <200602261347.20494.samjnaa@gmail.com> <200602272045.54327.samjnaa@gmail.com> <17411.7908.386568.805492@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17411.7908.386568.805492@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Monday, 27 February 2006 21:16 samaye tvayaa likhitam:

> And scanf() isn't "unsafe"; it just doesn't do what you want in your
> particular application. There are plenty of situations where scanf()
> does the right thing and getline() + sscanf() doesn't; e.g.:

OK, so scanf does have its own applications. 

I would like to place on record that I used fgets and sscanf and the problem I 
was experiencing was totally removed.

-- 

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-02-28 W09-2 UTC+0530
