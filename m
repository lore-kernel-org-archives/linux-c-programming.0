From: Michael Iatrou <m.iatrou@freemail.gr>
Subject: Re: displaying time_t values
Date: Sun, 23 Oct 2005 13:07:45 +0300
Message-ID: <200510231307.45916.m.iatrou@freemail.gr>
References: <435ACAD8.8090909@crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <435ACAD8.8090909@crearium.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

When the date was Sunday 23 October 2005 02:27, fabio wrote:

> I would like to know how to display the full seconds and miliseconds
> transacurrent since 2 points in a program.

difftime(t2, t1)
But time won't give you msec resolution. 

-- 
 Michael Iatrou
 Electrical and Computer Engineering Dept.
 University of Patras, Greece
