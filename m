From: Ken Martwick <kenm@efn.org>
Subject: substring offset
Date: Sat, 31 Aug 2002 11:11:25 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.GSU.4.21.0208311110210.17325-100000@garcia.efn.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

In this code snippet,
 
          findptr = strstr(realine[n], search);
          if(findptr)
               {
               diff = (int)(findptr - realine[n]);
 
why isn't "diff" the offset of "search" in "realine[n]"?  How
can I calculate the offset?
Ken Martwick


