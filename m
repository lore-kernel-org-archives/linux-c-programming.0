From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: getopt() library function options
Date: Fri, 4 Mar 2005 10:42:19 -0500
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA3657@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Fabio wrote:

>I am coding a small utility for system administrator. The following command line options will be accepted:
>
>$apstat 
>$apstat -t 1
>$apstat -n 1
>$apstat -t 2 -n 2
>$apstat -v
>$apstat -t 1 -v
>$apstat -v -t 1 -n 2

>unaccepted command line options:

>$apstat -t
>$apstat -n 
>$apstat -t <<non integer value>>
>$apstat -n <<non integer value>>

with the getopt function, a colon after a flag will designate that an argument is required.  For example,

while(-1 != (choice = getopt(argc, argv, "t:n:vh")))
{
   ... stuff
}

would require that t and n require and argument while v and h do not.  This means that the following 
command lines would be accepted:

apstat
apstat -t 1
apstat -t a

while the line apstat -t would not be accepted.  If getopt encounters an option not in the list, or if 
a required argument is missing then the character `?' is returned.  The argument is returned in the 
buffer `optarg'.  So in your case I would do this:

while(-1 != (choice = getopt(argc, argv, "t:n:vh")))
{
    switch(choice)
    {
        case 't':
            if(IsInteger(optarg))
                  _t = atoi(optarg);
            else
	         printf("Argument of t flag must be an integer");
     
            break;

        case 'n':
            if(IsInteger(optarg))
                  _n = atoi(optarg);
            else
	         printf("Argument of n flag must be an integer");
     
            break 

        case 'v':
            // Print version information??
            break;

        case '?':
        case 'h':
            // display help information
            break;
     }
}

In the above, I assume the existance of an IsInteger function with the signature, 
bool IsInteger(const char*);
Because I do most of my programming using C++ my implementation of IsInteger is:

bool IsInteger(const char* cp)
{
    const char* ep = cp + strlen(cp);
    return(std::find_if(cp, ep, std::not1(std::ptr_fun(isdigit))) == ep);
}

but the idea is the same in C - check to see if each element on optarg is an integer
and return true if its is.

George
