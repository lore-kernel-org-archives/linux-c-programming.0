From: "Jamie Risk" <jamie_risk@yahoo.ca>
Subject: warnings appearing during preprocessor string concatenation (##)
Date: Wed, 5 Mar 2003 15:34:39 -0500
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <b45mva$re8$2@main.gmane.org>
Reply-To: "Jamie Risk" <jamie_risk@yahoo.ca>
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gcc@vger.kernel.org
Cc: linux-newbie@vger.kernel.org, linux-c-programming@vger.kernel.org

I have the following line in my code,

#define FEATURE(select)     feature_structure. ## select ## .member
  ...
   FEATURE(test);

and when I run it through the compiler (gcc 3.2.2 on Linux x86) I get the
_warning_

  file.c:111:32: warning: pasting "." and "test" does not give a valid
preprocessing token
  file.c:111:32: warning: pasting "test" and "." does not give a valid
preprocessing token

If I look at the preprocessor output, (gcc's -E option) it produces what I'm
hoping for, although I'd like to avoid the warning.  Suggestions?

- Jamie

Reply to "gmane.linux.c-programming" or me directly.




