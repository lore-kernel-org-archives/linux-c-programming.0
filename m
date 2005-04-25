From: Steve Graegert <graegerts@gmail.com>
Subject: Re: HOME directory
Date: Mon, 25 Apr 2005 19:05:07 +0200
Message-ID: <6a00c8d50504251005110319f2@mail.gmail.com>
References: <200504251826.36321.hitoc_mail@yahoo.it>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200504251826.36321.hitoc_mail@yahoo.it>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: HIToC <hitoc_mail@yahoo.it>
Cc: linux-c-programming@vger.kernel.org

On 4/25/05, HIToC <hitoc_mail@yahoo.it> wrote:
> Hello all!
>         I am writing a piece of code that makes files, open directories in my
> HOME directory. All worked well until I changed the name of my HOME dir.
> To make the code portable I tried with use of '~' character:
> 
>         const char*     filename = "~/file.txt";
>         ofstream         my_file(filename, ios::out);
> 
> but this solution does not work.
> Have you any suggestion to find the path of the current home directory or
> the current user name?

All SUSv2/3 compliant systems know the system call getpwnam() to
obtain information about a given user by querying the passwd database.
 The following (untested) code snippet  demonstrates its usage.  Hope
this is what you're lookin' for.

----- BEGIN -----

#include <stdio.h>
#include <errno.h>
#include <pwd.h>

int main(int argc, char **argv)
{
    char *login_name;
    struct passwd *p;

    if (argc == 1) {
        if ((login_name = getlogin()) == NULL) {
            perror("getlogin() failed.\n");
            exit(errno);
        }
    } else if (argc == 2) {
        login_name = argv[1];
    }

    if ((p = getpwnam(login_name)) == NULL) {
        perror("getpwnam() failed.\n");
        exit(errno);
    }

    printf("HOME dir for %s: %s\n", login_name, p->pw_dir);

    return (0);
}

----- END -----

If you have questions or suggestions, feel free to drop me a line.

Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
