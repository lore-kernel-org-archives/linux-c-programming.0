From: vignesh1988i <softvig88@gmail.com>
Subject: Re: C program help
Date: Mon, 28 Dec 2009 20:50:32 -0800 (PST)
Message-ID: <26951151.post@talk.nabble.com>
References: <25522429.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <25522429.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org



           1) SEE , wat i feel is that you can have a count after u answer
for the question u ask using printf statement... that count must be
initilized to 0 which will act as a question number. . 
           2) And since u are a beginner in C , iam suggesting u to make use
of two arrays where u can have one for right answers and other for wrong
answers.... 
           3) In the array of right answers  where u are checking ur answer
== x+x , inside that statement assign the count to the right answerd array
as:
                              right[i]=count;
           4) if ur if becomes false , in else same u must do as above but
that should be :
                              wrong[j]=count;
after this u would get ur desired output....... any doubts , mail me
:softvig88@gmail.com
thank u
-- 
View this message in context: http://old.nabble.com/C-program-help-tp25522429p26951151.html
Sent from the linux-c-programming mailing list archive at Nabble.com.

