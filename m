From: Rik van Riel <riel@redhat.com>
Subject: Re: Garbage Collection and Swap
Date: Sat, 10 Jul 2004 20:57:56 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0407102057230.14732-100000@chimarrao.boston.redhat.com>
References: <40EF3BCD.7080808@comcast.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40EF3BCD.7080808@comcast.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Richard Moser <nigelenki@comcast.net>
Cc: linux-kernel@vger.kernel.org, linux-c-programming <linux-c-programming@vger.kernel.org>

On Fri, 9 Jul 2004, John Richard Moser wrote:

> I've been researching garbage collection.

Look up "generational garbage collection".

I suspect that, when tuned right, generational garbage
collection could actually be quite VM friendly...

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

