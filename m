From: "Carlos Fernandez Sanz" <cfernandez@myalert.com>
Subject: Re: Adding 'random' features
Date: Thu, 27 Jun 2002 10:27:38 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <005301c21db4$7f9c3e60$0b40440a@madcfernandez>
References: <20020627032052.A993@nietzsche>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

That doesn't seem like C to me...
Anyway instead of using the existance of a file (which obviously only has
two possible status) try storing something in the file :-)

----- Original Message -----
From: "xlp" <xlp@emtel.net.co>
To: <linux-c-programming@vger.kernel.org>
Sent: Thursday, June 27, 2002 10:20 AM
Subject: Adding 'random' features


> hi, i have certain binary and I want that each 3 times the file is
executed, it perform different things that it does normally.
> I can do that one time YES and other no:
> if file a exists -> then do smthg; rm file a
> if ! file a exists -> then do smthg; touch file a
>
> Now, I want to 3 times!.
>
> anyone?
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

