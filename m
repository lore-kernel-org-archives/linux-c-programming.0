From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: Re: strange behavious
Date: Wed, 25 Dec 2002 13:39:44 -0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.2.0.9.0.20021225132730.01d204d0@fluent2.pyramid.net>
References: <5.2.0.9.0.20021224020627.01e09340@fluent2.pyramid.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0212251757430.11856-100000@soochak.ncst.erne
 t.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: Glynn Clements <glynn.clements@virgin.net>, linux c programming mailing list <linux-c-programming@vger.kernel.org>

At 05:58 PM 12/25/02 +0530, Mohammed Khalid Ansari wrote:
> > Look at the type for string constants.  It is "const array of char".
>
>I haven't defined them to be const, please see above.

You misunderstand, the inherent type for string constants is "const array 
of char".  Let's look at what you are doing.

the statement

    char        *words[] = {"mohammed", "khalid", "ansari"};

defines a array of three pointers to char, and initializes those pointer to 
three strings which have the type "const array of char", which is promoted 
to "pointer to const char".  A way to rewrite this statement so the result 
is identical but shows the exact typing is this:

   const char w1[9] = {'m','o','h','a','m','m','e','d',0};
   const char w2[7] = {'k','h','a','l'.'i'.'d',0};
   const char w3[7] = {'a','n','s','a','r','i',0};

   char *words[3] = {w1, w2, w3};

That is what the "shorthand" in the first statement expands to, if you 
apply the rules of ANSI to it.

Just remember that constants have a type associated with them, and you HAVE 
LITTLE CONTROL OF THE TYPE assigned to constants.  GCC allows you to say 
whether a "plain" char is signed or unsigned, but not (to the best of my 
knowledge) whether you can remove the "const" attribute from a constant 
character.

Investigate whether you can ask GCC to use the old Unix conventions for 
strings...but I wouldn't recommend it for new programs, and would strongly 
recommend doing the Right Thing(tm) and port the old code to the new 
semantics, for they will keep you from going down a road that is full of 
astonishment.

Stephen

