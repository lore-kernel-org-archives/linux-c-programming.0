From: SVisor <svisor@lycos.com>
Subject: Re: Directory contents
Date: Sat, 27 Nov 2004 19:26:28 +0100
Message-ID: <coagsk$afm$1@sea.gmane.org>
References: <200411271900.48627.hitoc_mail@yahoo.it>
Reply-To: svisor@lycos.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200411271900.48627.hitoc_mail@yahoo.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

HIToC wrote:
...
> I want to write a function that can read the contents of a specified directory
> in order to find a certain type of file or to copy a directory-tree or
> something else.
> Neverthless I need of some system functions that find the files that are
> contained in that directory (like FINDFIRST and FINDNEXT under ms-dos).

opendir( ) and readdir( ) might be what you are looking for?

