From: "Chris" <nanakos@wired-net.gr>
Subject: Re: Array Empty Slots
Date: Tue, 5 Apr 2005 12:06:49 +0300
Message-ID: <002c01c539be$cecdcb10$0101010a@dioxide>
References: <Pine.LNX.4.58.0503221104060.30671@ns.isi.ulatina.ac.cr> <200503221305.32606.eric@cisu.net> <Pine.LNX.4.58.0503221215250.31636@ns.isi.ulatina.ac.cr> <001301c53923$2804a9c0$0101010a@dioxide>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all, thanks for your quick responses on the subject.
What i am looking for is a procedural algorithm that has to provide a fast
solution.The well known constraints are small memory footprint and lack of
computing power is really a concern, but most of all is that the array is
bigger and bigger over time, because it is and array constructed from a
database query through a C API interface.
The bottleneck in the final application is this point, where the algorithm
searches the array to find the empty slots and then fill those slots with
data.
Is there really sth that can 'dissapear' that bottleneck? Do u have any
suggestions??


Best regards,
Chris.

