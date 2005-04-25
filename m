From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: HOME directory
Date: Tue, 26 Apr 2005 00:46:04 +0800
Message-ID: <426D1ECC.3000307@hq.ntsp.nec.co.jp>
References: <200504251826.36321.hitoc_mail@yahoo.it> <426D1DC8.2080900@hq.ntsp.nec.co.jp> <426D1E0B.6020307@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <426D1E0B.6020307@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Ooops... inapplicable solution...
scratch it...


Ron Michael Khu wrote:

> I dont know what specific system calls are used for retreiving the 
> current user or home dir(if there are any).
> But perhaps u can make use of the getenv() function to retrieve the 
> value of $HOME and $USER
> (it may not work on some shells, though, didnt test it)
>
>
>
>
> HIToC wrote:
>
>>> Hello all!
>>>     I am writing a piece of code that makes files, open directories 
>>> in my
>>> HOME directory. All worked well until I changed the name of my HOME 
>>> dir.
>>> To make the code portable I tried with use of '~' character:
>>>
>>>     const char*    filename = "~/file.txt";
>>>     ofstream     my_file(filename, ios::out);
>>>
>>> but this solution does not work.
>>> Have you any suggestion to find the path of the current home 
>>> directory or
>>> the current user name?
>>>
>>> Thanks for any suggestion.
>>>  
>>>
>>
>>
>
>


