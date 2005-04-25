From: HIToC <hitoc_mail@yahoo.it>
Subject: HOME directory
Date: Mon, 25 Apr 2005 18:27:59 +0200
Message-ID: <200504251826.36321.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello all!
	I am writing a piece of code that makes files, open directories in my
HOME directory. All worked well until I changed the name of my HOME dir.
To make the code portable I tried with use of '~' character:

	const char*	filename = "~/file.txt";
	ofstream	 my_file(filename, ios::out);

but this solution does not work.
Have you any suggestion to find the path of the current home directory or
the current user name?

Thanks for any suggestion.
-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
