From: xlp <xlp@emtel.net.co>
Subject: Problem with "chars"
Date: Wed, 17 Jul 2002 04:08:16 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020717040816.A54117@nietzsche.metrotel.net.co>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi C people, first of all, I'd like to thank you this mailing list and kernel.org project to give us a place where C programmers feel free to ask their questions and the support is excellent.
I dont understand what's the way I should handle 'chars' on C. 
I need to code a C function that returns a char, I want to do this:
char foo();
main(){
	char bar*;
	bar=foo();
}
How should i declare the 'char' inside foo()?
How should i 'return' the char inside foo()?
How can i understand "chars" and pointers to chars?, I have a C books, but I dont get it, because ALL THE EXAMPLES are with chars like char foo[20], that is the easy way!, I want to handle char without a specific length!.

bye.


