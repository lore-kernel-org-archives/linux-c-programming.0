From: Progga <abulfazl@juniv.edu>
Subject: Re: linking at run time.
Date: Fri, 11 Jul 2003 15:51:31 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030711155131.C240@Imrashi.net.bd>
References: <00be01c34553$57ea97a0$caba0ba4@uwe.ac.uk> <16138.54505.701672.164306@cerise.nosuchdomain.co.uk> <012101c3462f$ec43a810$caba0ba4@uwe.ac.uk> <16140.52121.385331.351810@cerise.nosuchdomain.co.uk> <003501c346c8$d32cd4c0$ed64a8c0@descartes>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <003501c346c8$d32cd4c0$ed64a8c0@descartes>; from jtwilliams@vt.edu on Thu, Jul 10, 2003 at 02:50:48AM -0700
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: linux-c-programming@vger.kernel.org

On Thu, Jul 10, 2003 at 02:50:48AM -0700, John T. Williams wrote:
 
> I was wondering if there was any way to run my program, getmail, so that ldd
> would link it against a specified file so that I didn't have to put a
> library that I'm developing into my /usr/lib folder.  nor have to run
> ldconfig as root.

 To link and then exec using an uninstalled lib:

 c++ -o hihi hihi_main.c++ path/libvovo.so -Wl,-rpath,path,-rpath,/usr/local/lib


 Khoda Hafez
 Progga

 
