From: "Raseel Bhagat" <raseelbhagat@gmail.com>
Subject: Re: how to implement routines that return general strings?
Date: Fri, 11 Aug 2006 12:33:48 +0530
Message-ID: <f68850780608110003u78bc0f1albc7551f30599be27@mail.gmail.com>
References: <Pine.LNX.4.64.0608101004460.13097@localhost.localdomain>
	 <17627.40966.748782.988469@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17627.40966.748782.988469@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: C programming list <linux-c-programming@vger.kernel.org>

Hi Glynn,

On 8/11/06, Glynn Clements <glynn@gclements.plus.com> wrote:

> Avoid the second form. Apart from not being re-entrant, it can lead to
> bugs which can be hard to find, particularly if the function in
> question is relatively general-purpose and may be used from various
> places in your code.

Can you please ellaborate how you came to the conclusion that that
second form cannot be re-entrant  and thus implying the first form is
?
-- 
Raseel.
http://osd.byethost8.com
http://raseel.livejournal.com
