From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: buggy_double_use_of _scanf
Date: Mon, 1 Nov 2004 17:25:17 -0500
Message-ID: <E3E30069B061524E90BCEE4417E30661138548@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?Q?=27F=E1bio_Russo=27?= <russo@bluecup.com.br>, Glynn Clements <glynn@gclements.plus.com>, simon <simon.guinot@laposte.net>
Cc: linux-C-programming <linux-c-programming@vger.kernel.org>

Hi,

Russo wrote:

[... snip ...]

>The problem, I beleve is in the fflush function. I Have the same behaviour
>with this source code, but when I put a additional scanf in the line, all 
>works fine -;)

>Now I ask:
>Why the fflush function did not remove the new line caracter when it
should?

quoteth the man page:

'The function fflush forces a write of all user-space buffered data for
 the given output or update stream via the stream's underlying write 
 function.'

Thus fflush only causes user-space buffered data to write their contents to 
the kernel-space buffers (which can be forced to update to the storage
medium
via a call to sync or fsync).  fflush has no effect when called on stdin - 
you are reading data not writing it.

George
