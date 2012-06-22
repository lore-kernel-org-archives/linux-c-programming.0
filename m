From: Randi Botse <nightdecoder@gmail.com>
Subject: nanosleep over multiple processes
Date: Fri, 22 Jun 2012 12:07:03 +0700
Message-ID: <CAA6iF_7rzg8o0C5kbNgcRYmgj=t+0As-YQzP7Ddbmaz6yMAqLA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=ShaiHir+pjdXNkqLSuF5YbQ05pvbz5DuMk0uSxk5iF0=;
        b=eJazxcrN5DgkdfsMnXjOZudPgo7SFmW0zgnyjQtD5JN7JRQjC4OFY6Tc49NSC0IwKN
         LKTE5LwdZScgrthIllzRYfq3FA0rTpTqeqlTyDJdPwnChBMRIGhUl5fQFKbMqoqj0EmV
         yxHPITUkoSZzxXLuvKUQlJqQtX4jhq+E4ol5ewdz78d1e9KpzgT+7kvWhC5uet2W9EzG
         TPEJKdlyEAYHsoOj2f9dnkAVy7NDjG7pqw8sBh+BQBWAeTAwax4PfUsXlHLoMu+/O/Bw
         ykV38WALIRD8kOZZ/i8Oi5aWpwnQgYHf7RUcAYXH4IBA3xa+ZtDY83MlNLSQXK/YKaCG
         eKbA==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Hi All,

In nanosecond precision, if I have multiple processes run nanosleep(),
how possbile they will get the same struct timespec value? both the
tv_sec and tv_nsec value. Of course the tv_sec (second) is most
possible, but how about the tv_nsec (nanosecond)?

I wan't to create a simple stupid unique id or something like that,
but with without too much effort. The unique id will be tv_sec +
tv_nsec.

Cheers!
