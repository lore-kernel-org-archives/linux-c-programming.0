From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Curious segmentation fault - please help
Date: Sat, 13 May 2006 17:09:08 +0200
Message-ID: <6a00c8d50605130809pba67862gd981f8bf0fa6927f@mail.gmail.com>
References: <200605131958.39156.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200605131958.39156.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 5/13/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Attached: valgrind output; used electric fence too
> Attached: original source code (licence: Artistic Licence v2)
>
> I am getting a segmentation fault. I have compiled using electric fence, and
> used valgrind to debug. (Not got used to gdb yet.)
>
> For some reason, while I have initialized the array grahanaama[] (line 64 of
> monthpan.c), grahanaama[0] gives an error at line 593 [added for debugging].
> Similarly initialized array tithinaama does not give an error for accessing
> tithinaama[0].

Looks like the function 'listsplpanchaanga' tries to access the
'grahanaama' array's nth element with only n - 1 being present
('vaasara = 6' accesses the last, 7th, element), thus causing a
segfault.  This is what valgrind means by an "Invalid read of size 1".
 Make sure you do not read past the array by simply #defining a
constant like NUM_GRAHANAAMA and using an if-statement to check for
the correctness of 'vaasara', which is calculated dynamically on each
step in the loop.  Maybe you can simply correct the error by accessing
'grahanaama' using 'vaasara - 1': grahanaama[vaasara - 1] if this is
what you wanted to achieve.

At least, this is my first guess.  I have not yet fully grasped the
meaning of the code, due to difficulties in understanding the variable
and function names :-)

	\Steve
