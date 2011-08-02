From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Errors with ->*
Date: Tue, 02 Aug 2011 22:01:02 +0530
Message-ID: <4E382646.7060903@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070207040403090101080100"
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=bIOSi9rlWOCA+fW+oO7/nBAPsOcBJ9Y6iuKWNLV1Qqc=;
        b=FyrrYy7fWR6V7yQAfbc7Olm/0gKqIWdY6G3Uhq0jf3GcnnUV7Q5EElj+qcIcAyWmND
         5TETK2v6iBY5dsFQYTsnnrrHtTEvZJYiHkfKfShclGgDdCraRtLCqk0BW0R75djbmBtt
         oTPbjuFXVTnLYiwJW+fgpq0yKMTCQcrXSPzlA=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------070207040403090101080100
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hello -- long time since I posted on this list.

I'm trying to understand the use of ->* but in compiling the attached 
program which I thought was straightforward I am getting the following 
errors:

foo.cpp: In constructor ‘mystruct::mystruct()’:
foo.cpp:9:12: error: invalid conversion from ‘int*’ to ‘int’
foo.cpp: In function ‘int main()’:
foo.cpp:21:7: error: ‘xptr’ was not declared in this scope
foo.cpp:22:7: error: ‘yptr’ was not declared in this scope

Please help.

-- 
Shriramana Sharma

--------------070207040403090101080100
Content-Type: text/x-c++src;
 name="foo.cpp"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="foo.cpp"

struct mystruct 
{
public:
	int x, y ;
	int * xptr, yptr ;
	mystruct () 
	{ 
		xptr = & x ; 
		yptr = & y ; 
	}
} ;

int main ( void )
{
	mystruct a ;
	mystruct * aptr = & a ;

	a . x = 1 ; 
	a . y = 2 ;

	a .* xptr = 3 ;
	a .* yptr = 4 ;

	aptr ->* xptr = 5 ;
	aptr ->* yptr = 6 ;
}

--------------070207040403090101080100--
