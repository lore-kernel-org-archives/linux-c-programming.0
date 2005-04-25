From: Luciano Moreira - ht <lucianomx@hotpop.com>
Subject: Re: HOME directory
Date: Mon, 25 Apr 2005 13:50:34 -0300
Message-ID: <426D1FDA.2020709@hotpop.com>
Reply-To: lucianolnx@ig.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Yeah ! You need to read the desired environment variable (like HOME), 
using a API like "|char *getenv(const char */name/);".

After read, you shall concatenate the 2 strings:

char *pHome;
char *pMyDir="mydir/mysubdir";
char sFullPath[_MAX_PATH];

pHome = getenv("HOME");
sprintf(sFullPath, "%s/%s", pHome, pMyDir);

WARNING: "sprintf()" isn't the faster way to build a concatenated 
string. If you'll need to repeat this in a long loop, try another way 
using only a single call to "strcat()".

Luciano
|

HIToC escreveu:

>Hello all!
>	I am writing a piece of code that makes files, open directories in my
>HOME directory. All worked well until I changed the name of my HOME dir.
>To make the code portable I tried with use of '~' character:
>
>	const char*	filename = "~/file.txt";
>	ofstream	 my_file(filename, ios::out);
>
>but this solution does not work.
>Have you any suggestion to find the path of the current home directory or
>the current user name?
>
>Thanks for any suggestion.
>  
>

