From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Implementing a file counter (like "ls | wc")
Date: Wed, 07 Apr 2004 11:27:02 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40740FB6.9020805@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

We implemented a program that use "opendir()", "readdir()", and 
"closedir()" to scan a directory and count the files contained into it.

But, it program have taking more time than "ls | wc" to count files.

Does have any other way to count files faster?

PS: Our program needs sometime to filter files by extension (like: *.c, 
*.cpp, and so on. Thus we use strcmp() to compare last letters of both 
strings).

Luciano

