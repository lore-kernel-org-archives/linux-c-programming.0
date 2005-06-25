From: HIToC <hitoc_mail@yahoo.it>
Subject: Re: comparing char to other known char's
Date: Sat, 25 Jun 2005 13:58:53 +0200
Message-ID: <200506251323.31271.hitoc_mail@yahoo.it>
References: <42B9F2C7.2030205@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42B9F2C7.2030205@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Colannino <james@colannino.org>
Cc: Linux C programming <linux-c-programming@vger.kernel.org>

On Thursday 23 June 2005 01:22, James Colannino wrote:
> Hey everyone.  I hope this isn't a stupid question.  I've been googling
> around trying to find a function that I can use but haven't been
> successful.  Here's what I want to be able to do:
>
> let's say I have a char called 'character.'  I want to compare
> 'character' to see if it's any one of the characters in a list.  For
> example, maybe I would want to test character to see if it's either 'e',
> 'r', '*', etc.
>
> Is this easy enough to implement?  I could do if (character == 'e' ||
> character == [...] and so on and so forth, but this seems much to
> tedious and unreadable to be my only solution.  If anyone has any ideas
> I'd be extremely grateful :)  Thanks very much in advance.
>
> James


If you prefer a Object Oriented solution, take the example:


/*	char.cpp

	Author:	HIToC
	E-mail:	hitoc_mail@yahoo.it
	Date:	06/25/2005




	Purpose:	Example
*/




#include <iostream>
#include <algorithm>
#include <string>
#include <list>


class	valid_char {
	list<char>	char_list;

public:
	valid_char(const string&);

	bool	find_char(char);
	bool	operator()(char c) { return find_char(c); }

	~valid_char() { }
};

valid_char::valid_char(const string& s)
: char_list()
{
	for(string::const_iterator i = s.begin(); i != s.end(); i++)
		char_list.push_back(*i);
}

bool valid_char::find_char(char c)
{
	if(find(char_list.begin(), char_list.end(), c) != char_list.end())
		return true;
	else return false;
}




int main(int argc, char* argv[])
{
	const char*	alpha = "QWERTY";
	valid_char	vchar(alpha);
	string		str;
	char		c;

	if(argc != 2) {
		cerr <<"Usage: char <string>\n";
		return 1;
	 }

	str = argv[1];
	for(int i = 0; i < str.size(); i++) {
		c = str[i];
		cout <<"Character [" <<c <<"]:\t";
		if(vchar(c)) cout <<"FOUND!\n";
		else cout <<"NOT found!\n";
	}

	return 0;
}


-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
