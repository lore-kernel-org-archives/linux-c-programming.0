From: Glynn Clements <glynn@gclements.plus.com>
Subject: RE: deletion in singly linked list
Date: Tue, 23 Nov 2004 09:59:53 +0000
Message-ID: <16803.2585.613544.206103@cerise.gclements.plus.com>
References: <5959EA4638D8734599AB75EAAFBB6FEFA471DB@mtv01ex04.mindtree.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <5959EA4638D8734599AB75EAAFBB6FEFA471DB@mtv01ex04.mindtree.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming <linux-c-programming@vger.kernel.org>


Bakki Srinivas wrote:

> copy the content of the next item and place it in the current pointed
> item,check if the next item pointed by the next item is NULL if it is then
> delete the next item else move the pointer till it reaches NULL finally
> delete the last one.

That fails if there is no next item, i.e. you're deleting the last
element from the list.

-- 
Glynn Clements <glynn@gclements.plus.com>
