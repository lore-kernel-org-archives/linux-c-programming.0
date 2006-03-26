From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Accessing a class' member functions
Date: Sun, 26 Mar 2006 08:15:58 +0000
Message-ID: <6a00c8d50603260015ud777b7fgfbfa02f567cf8b@mail.gmail.com>
References: <200603260931.05639.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603260931.05639.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 3/26/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> I need to use a class' member functions without creating an instance of that
> class. Is that possible? I have seen someone do this in their C++ library but
> it does not work for me, so I am wondering what I did wrong.

What you've have seen are static member functions.  They can be called
withouth creating an instance of the class they are defined in.

Please note that static member functions can only access global data
or static class data and can not be declared virtual.  Since stattic
member functions exist without class instances, you cannot use the
implicit this pointer to access non-static members.

To access static members you simply use the class name and append the
member using the scope operator: MyClass::myStaticMember.

Example:

-- BEGIN ---
#include <iostream>
#include <cstdlib>
#include <ctime.h>

class C {
private:
    static const int MAX_NUM = 10;
public:

    static void get_num () {
        srand((unsigned)time(NULL));
        return (int)(MAX_NUM * rand() / (RAND_MAX + 1.0));
    }
};

int main(void) {
    cout << C::get_num() << "\n";
}

--- END ---

	\Steve
