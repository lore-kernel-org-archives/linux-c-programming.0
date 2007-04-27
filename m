From: Shriramana Sharma <samjnaa@gmail.com>
Subject: How did KDbg find out the source corresponding to my executable?
Date: Fri, 27 Apr 2007 20:36:20 +0530
Message-ID: <4632116C.70109@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Has someone here used KDbg?

Just a few minutes ago, I tried KDbg, the KDE front-end to gdb. (The 
change in position of g between the two names amuses me for some reason.)

When I selected an executable which was located at a location different 
from its source, KDbg automatically found out the location of the 
source-file and opened it for setting breakpoints etc.

Is the path to the source embedded in every executable? Upon examining 
the executable by nm for symbols I did not find the source path, but 
maybe that is not a symbol. Okay: readelf has an entry corresponding to 
the source filename but not the source path. Does KDbg search the home 
directory for the source filename?

If not, how could KDbg correctly open the source file?

Shriramana Sharma.

P.S: I realize this is slightly OT since it asks a question about a KDE 
application albeit most related to programming. I'm taking the chance 
that someone here has used KDbg.

