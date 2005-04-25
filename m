From: "Richard Nairn" <Richard@nairnconsulting.ca>
Subject: Re: HOME directory
Date: Mon, 25 Apr 2005 10:59:00 -0600
Message-ID: <op.spsr4morizdgzp@mail.nairnconsulting.ca>
References: <200504251826.36321.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200504251826.36321.hitoc_mail@yahoo.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: HIToC <hitoc_mail@yahoo.it>, linux-c-programming@vger.kernel.org

You can use the environment variables to determine what the home directory  
is. Look at the manpage for getenv(3) and environ(5)

On Mon, 25 Apr 2005 10:27:59 -0600, HIToC <hitoc_mail@yahoo.it> wrote:

> Hello all!
> 	I am writing a piece of code that makes files, open directories in my
> HOME directory. All worked well until I changed the name of my HOME dir.
> To make the code portable I tried with use of '~' character:
>
> 	const char*	filename = "~/file.txt";
> 	ofstream	 my_file(filename, ios::out);
>
> but this solution does not work.
> Have you any suggestion to find the path of the current home directory or
> the current user name?
>
> Thanks for any suggestion.



-- 
  |       Richard Nairn          Specializing in Linux
  |     Nairn Consulting         Web / Database Solutions
  |        Calgary, AB
  | Richard@NairnConsulting.ca
