From: ework0 <ework0@gmail.com>
Subject: pointers
Date: Sun, 30 Oct 2005 02:11:03 -0600
Message-ID: <43648017.7040700@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello,

I would like to know what are the advantages of use pointers to 
insert/modify values in an array of characters for example.

char myword[2];
*myword = 'h';
*(myword + 1)='i';

why would i use this ( the intruction: *(myword + offset))?
what is the advantages of use this manipulation of array with these 
pointers ?
In the last line, do I increment the address that contains what s points 
to right ??
Why I increment it in '1' instead of a memory word concept?

Thanks
