From: "J." <mailing-lists@xs4all.nl>
Subject: Re: file deletion
Date: Mon, 27 Dec 2004 04:50:15 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0412270410050.3874-100000@hestia>
References: <003f01c4e9ba$7679d020$316c4ed5@j0s6l8>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <003f01c4e9ba$7679d020$316c4ed5@j0s6l8>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Fri, 24 Dec 2004, Andy wrote:

> Does anybody know of any useful code or c commands that
> you can use to search for duplicate files within a linux/unix directory and
> its subdirectories and remove them?
> Thanks
> Andrew

Ehm.. Personally no.. However there is ftw, opendir, readdir, stat,
fstat... etc.. Ones you are able to access all the directory entries you
have to make a decision how you want to compare e.g. md5, crc32, only size
or name etc... Then there is the issue of choosing a optimal ADT and
access/retrieval algo.

If you dont have to c code the program but just looking for a solution I
would most certainly go for a: 
`find -type f -exec md5sum '{}' \; >> md5.log` 
and parse the md5.log with a simple shell or awk script. That would save
many headache's.. Plus you don't have to reinvent `find`... 

J.

--
http://www.rdrs.net

