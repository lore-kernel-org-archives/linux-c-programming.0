From: a.biardi@tiscali.it
Subject: C++ temporaries
Date: Wed, 19 Jan 2005 21:56:00 +0100
Message-ID: <200501192156.00928.a.biardi@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi all,

I have a function similar to the following, which returns a string:

  std::string foo() {
    return <whatever>;
  }

..then I want to use its c_str(), say like this (sorry for the silly 
example):

  int main() {
    printf("foo is %s",foo().c_str());
  }

Of course, for printf() to work, the temporary object that is returned 
by foo() should not be (automatically) destroyed too early, or the 
pointer returned by c_str() would not be valid anymore.

So, my question is: *when* is that temporary string created and 
destroyed? is it safe to assume that it exists until printf() 
returns, and thus that I can use its c_str() this way?

I've always thought that the temporary would be destroyed *before* 
calling printf() [ create a string, get the value for c_str(), 
destroy the string, invoke printf() ] thus actually passing an 
invalid pointer in this case, but to my surprise I put together some 
lines and gcc proved me wrong. Is it just gcc? Or is it a standard 
C++ behavior?

Thanks,
Andrea.
