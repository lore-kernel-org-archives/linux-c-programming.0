From: "Daniel" <uval@rz.uni-karlsruhe.de>
Subject: Re: Newbie Questions
Date: Thu, 25 Apr 2002 10:10:02 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000b01c1ec30$99ce6430$444615ac@stud.unikarlsruhe.de>
References: <200204070157.g371vDs24544@superglide.netfx-2000.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

1) if you can use cin.getline(), for parameters see in doc
2) to convert you can use atoi-i for int (const char *) or atol - l for
long,
    see man atoi, also you have to include stdlib (man tells you the needed
header also)
3) include <time.h> and use gmtime, it returns a pointer to a struct with
all information
    you will not need to convert the year at all, it is in this struct .(as
member)
4) I don't know what is wrong, but try it in this way
    int c;
    while((c=fgetc(pF))!=EOF){// it reads first from file, c is an int !!}
Ok , good luck

----- Original Message -----
From: "The Gyzmo" <gyzmobro@linuxfreemail.com>
Newsgroups: ka.lists.linux.c.programming
Sent: Sunday, April 07, 2002 3:57 AM
Subject: Newbie Questions


> Hello. I'm new to C and I'm working on an age program. I have some
> questions:
>
> 1) Gcc tells me that the gets() function is dangerous and should not be
> used - which function could I replace gets() with that does exactly the
> same thing?
>
> 2) In my program, I want to calculate the age of people from their birth
> date whithout having to make the user input the current year. Which time
> funciton should I use to get the year and if it outputs a string, how
> would I convert that string to an integer?
>
> 3) One of the goals of my program is to input birth dates from a
> database file, display them all, and then find the average. I have a
> 'while(!feof(fp))' loop that takes each line in the file and extracts
> the birth dates and counts how many entries there are in the file, but
> it loops one too many times - that is it also loops after it reaches the
> EOF. This results in 2 of the same entry being displayed and the counter
> for how many entries there are being 1 too high. Which function can I
> use to loop only before it reaches the EOF?
>
> Thanks for any help in advance,
> Serban Giuroiu
>
> Get your own FREE E-mail address at http://www.linuxfreemail.com
> Linux FREE Mail is 100% FREE, 100% Linux, 100% better, and 100% yours!
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --------------------------------------------------------------------------
-----
>    Achtung: diese Newsgruppe ist eine unidirektional gegatete
Mailingliste.
>      Antworten nur per Mail an die im Reply-To-Header angegebene Adresse.
>                    Fragen zum Gateway -> newsmaster@inka.de.
> --------------------------------------------------------------------------
-----

