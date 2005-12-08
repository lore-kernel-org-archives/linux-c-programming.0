From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: type qualifiers on function return types?
Date: Thu, 8 Dec 2005 13:00:39 -0500 (EST)
Message-ID: <Pine.LNX.4.63.0512081259330.7428@localhost.localdomain>
References: <Pine.LNX.4.63.0512080728490.10304@localhost.localdomain>
 <6a00c8d50512080858n70ef1937n8ccc2c96b9eb799c@mail.gmail.com>
 <001401c5fc1e$d7963110$8e01a8c0@Nate>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <001401c5fc1e$d7963110$8e01a8c0@Nate>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nate Jenkins <nate@uniwest.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On Thu, 8 Dec 2005, Nate Jenkins wrote:

> I am sure I am not the only one here wondering what "type
> qualifiers" are. Could someone expound on what they are and why one
> would use them?

one of const, volatile or restrict.  chances are, unless you're doing
low-level hardware programming, "const" is what you'd use most often.
for further explanation, see any good C book.

rday
