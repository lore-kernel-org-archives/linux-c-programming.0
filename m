From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: A Calendar app on C
Date: Wed, 2 Jun 2004 11:07:17 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16573.42709.469676.426778@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.58.0406012354140.12322@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0406012354140.12322@ns.isi.ulatina.ac.cr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: linux-c-programming@vger.kernel.org


Fabio Miranda Hamburger wrote:

> I am trying to program a basic calendar software in C. The idea is to ask
> for a year and display all the calendar from january to december. How to
> code such app taking care of 31/28 days month and check each 4 year for a
> leap year? Any idea/comment/advice/code is welcome.

A year is a leap year if:

	static int is_leap(int year)
	{
		return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
	}

Thus:

	static int days_in_year(int year)
	{
		return is_leap(year) ? 366 : 365;
	}

So the number of days in a month is:

	static int days_in_month(int year, int month)
	{
		static const int days[2][12] = {
			{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
			{31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
		};

		return days[is_leap(year)][month-1];
	}

As for the relationship between days of the year and the days of the
week, note that the 400-year cycle for leap years is an exact number
of weeks (400 years == 400 * 365 + 97 == 146097 days == 20871 * 7
days), and that 2000-01-01 was a Saturday, so:

	int year_start(int year)
	{
		int day = 6;	/* Saturday */
		int i;

		year %= 400;

		for (i = 0; i < year; i++)
			day += days_in_year(i);

		return day % 7;
	}

This could easily be optimised (e.g. using a lookup table), but the
above is all of the information required to produce a calendar for any
given year.

[Unless, that is, you want it to work for years prior to the adoption
of the Gregorian calendar; note the output from "cal 1752".]

-- 
Glynn Clements <glynn.clements@virgin.net>
