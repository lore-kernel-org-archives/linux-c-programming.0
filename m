From: Dennis Heuer <dh@triple-media.com>
Subject: how to stay acid-compliant when using mmap'ed files
Date: Tue, 9 Oct 2007 17:54:40 +0200
Message-ID: <20071009175440.ac8f8efe.dh@triple-media.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

hello,

i don't really understand the implications of using mmap. for example,
will linux write out changes to an mmap'ed file as is or as part of a
full page-write? if the latter is true, what happens if the program
reads from mmap'ed pages but writes directly to the file? as far as i
see it, linux will catch the writing and divert it to the mmap'ed page.
this implies that only full page-writes will reach the file.

i ask about this because if i want to write a transaction-safe layer
for a database in a file and linux always affects more bytes in the
file than the program actually commanded, there's no way, after a crash,
to know about what area was actually affected and possibly crippled up.

am i right or is there something i miss? how is it with common file
accesses (via write or fwrite). are they paged automatically by the os
too?

regards,
dennis heuer
