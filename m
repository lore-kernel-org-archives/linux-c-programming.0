From: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>
Subject: Re: ioperm() and setuid()
Date: Mon, 13 Oct 2003 14:42:56 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20031013134256.GA24603@lsd.di.uminho.pt>
References: <3F89EB91.7070509@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3F89EB91.7070509@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Cc: linux-c-programming@vger.kernel.org

On Mon, Oct 13, 2003 at 08:02:25AM +0800, Lejanson C. Go wrote:
> Hello,
> 
> Does anyone know how to allow non root users in linux to
> access to i/o ports using ioperm() and setuid().

I think you're misunderstanding setuid(). For a program to have I/O access,
it needs root permissions.

For a normal user to gain those permissions, the executable needs to be
owned by root and have the set-user-id bit set.

Or you can use the userhelper package to give temporary root permissions
to the user for that program.

Here's code I use for that purpose (changed a little):

int main(int ac, char *av[])
{

        /* parse and check args */
        if (parse(ac, av))
                return 1;
        /* check if enough privileges for io ops */
        if (geteuid()) {
                if (!helped)
                        /* haven't tried consolehelper yet, try it */
                        use_ch(ac, av);
                fprintf(stderr, "%s: must run with superuser privileges\n",
                        pname);
                return 1;
        }
        /* get privileges for out|in_p delay */
        if (ioperm(0x80, 1, 1)) {
                err("port 0x80 (pause)");
                return 1;
        }
        /* get privileges for out|in to lp ports */
        if (ioperm(port, IORANGE, 1)) {
                err2("port %#03x", port);
                return 1;
        }
	...
}

/* not running with root privileges, try consolehelper */
void use_ch(int oac, char *oav[])
{
        extern char **environ;
        char **nav;
                                                                                
        if (!(nav = calloc(oac + 2, sizeof(char *)))) {
                err("new args");
                return;
        }
        /* copy old args */
        memcpy(nav, oav, oac * sizeof(char *));
        /* args = args + "-c" */
        nav[oac] = "-c";
        execve("/usr/bin/consolehelper", nav, environ);
        err("consolehelper");
}

Regards,
Luciano Rocha
