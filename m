From: leslie.polzer@gmx.net
Subject: Re: Handling ioctl() argp memory
Date: Sun, 4 Mar 2007 18:04:02 +0100
Message-ID: <20070304170402.GA7625@wintermute.farpoint>
References: <20070304164844.GA7231@wintermute.farpoint> <d9def9db0703040852m2df3b0d8l42cf57b0c8ae9e15@mail.gmail.com>
Reply-To: leslie.polzer@gmx.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d9def9db0703040852m2df3b0d8l42cf57b0c8ae9e15@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Markus Rechberger <mrechberger@gmail.com>
Cc: linux-c-programming@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 04, 2007 at 05:52:20PM +0100, Markus Rechberger wrote:

> could you show us the sourcecode?
Take a look at the main function of the attached file.
I'm allocating memory at the start for new_map, but when I attempt
to free it at the end, libc complains.

I think now it's not related to the ioctl, since freeing 'map' works
(which is also used with ioctl), but freeing 'mapping' does not, despite
it being not passed via ioctl.

The problem has to be somewhere else, but I cannot see where...

  Leslie

-- 
gpg --keyserver pgp.mit.edu --recv-keys DD4EBF83
http://nic-nac-project.de/~skypher/

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="joymap.c"

/* gcc -o joymap joymap.c */

/*
 * joymap -- map Joystick/Joypad keys via Linux JSIOSBTNMAP ioctl 
 *
 * Copyright (C) 2007  Leslie P. Polzer <polzer@gnu.org>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the
 *
 *      Free Software Foundation, Inc.,
 *      51 Franklin Street,
 *      Fifth Floor, Boston,
 *      MA  02110-1301, USA.
 */

/* strsep */
#include <string.h>

#include <unistd.h>

/* ?int?_t */
#include <stdint.h>

/* perror */
#include <stdio.h>

/* exit, malloc */
#include <stdlib.h>

/* open */
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <sys/ioctl.h>

#include <linux/input.h>
#include <linux/joystick.h>


#undef NDEBUG

static int get_buttons(int fd)
{
    int i;
    uint8_t nb;

    if (ioctl(fd, JSIOCGBUTTONS, &nb) == -1)
    {
        perror("JSIOCGBTNMAP");
        return -1;
    }

    return nb;
}


static void print_map(int fd)
{
#ifndef NDEBUG
    uint16_t* map = malloc(KEY_MAX - BTN_MISC + 1);
    int i;

    if (ioctl(fd, JSIOCGBTNMAP, map) == -1)
        perror("JSIOCGBTNMAP");

    printf("Current button map:\n");
    for (i=0; i<get_buttons(fd); ++i)
        printf("\tButton %d -> %hd\n", i, map[i]);

    free(map);

    return;
#endif
}

int main(int argc, char** argv)
{
    int fd, nb, i;

    uint16_t* map = malloc(KEY_MAX - BTN_MISC + 1);
    uint16_t* new_map = malloc(KEY_MAX - BTN_MISC + 1);
    int* mapping;


    if (argc < 2)
    {
        printf("Usage: %s DEVICE [MAP]\n\n"
               "where DEVICE may be /dev/input/js0 and MAP may be '2 1 3 4'\n"
               "to swap the first two buttons of a device with four buttons\n"
               "total.  If the number of buttons specified is lower than the\n"
               "device's total number of buttons, these buttons are assumed\n"
               "to stay like they are, i.e. '2 1' for a four button device\n"
               "will become '2 1 3 4'.\n\n"
               "Mappings will stay until the driver is reset (e.g. by\n"
               "reinserting the 'joydev' module.\n\n"
               "If MAP is not specified, the current map is printed.\n",
               argv[0]);
        exit(1);
    }

    fd = open(argv[1], O_RDWR);

    if (fd == -1)
    {
        perror("open");
        exit(1);
    }

#ifndef NDEBUG
    fprintf(stderr, "KEY_MAX: %d   BTN_MISC: %d\n", KEY_MAX, BTN_MISC);
#endif

    nb = get_buttons(fd);

    fprintf(stderr, "Device has %d buttons.\n", nb);

    if (argc < 3)
    {
        print_map(fd);
        return 0;
    }

    mapping = malloc(nb);

    i = 0;
    while (1)
    {
        char* next;
        next = strsep(&argv[2], " ,");

        if (next == NULL)
            break;

        if (atoi(next) > nb || atoi(next) < 1)
        {
            printf("Mapped buttons must be between 1 and %d.\n", nb);
            return 1;
        }

        if (i == nb)
        {
            printf("Warning: too many mappings specified, ignoring remaining.\n");
            break;
        }

        mapping[i++] = atoi(next) - 1;
    }

    /* fill */
#ifndef NDEBUG
    printf("i=%d\n", i);
#endif
    for (; i<nb; ++i)
        mapping[i] = i;

#ifndef NDEBUG
    for (i=0;i<nb; ++i)
        printf("\tmapping[%d] = %d\n", i, mapping[i]);
#endif

    if (ioctl(fd, JSIOCGBTNMAP, map) == -1)
        perror("JSIOCGBTNMAP");

    print_map(fd);

#ifndef NDEBUG
    printf("Calculating new map...\n");
#endif

    for (i=0; i<nb; ++i)
        new_map[i] = map[mapping[i]];

#ifndef NDEBUG
    for (i=0; i<nb; ++i)
        printf("\tnew_map[%d] = %hd\n", i, new_map[i]);
#endif

    if (ioctl(fd, JSIOCSBTNMAP, new_map) == -1)
        perror("JSIOCSBTNMAP");
    else
    {
        printf("New map:");
        for (i=0;i<nb;++i)
            printf(" %d", new_map[i]);
        printf("\n");
    }

    print_map(fd);

    goto EXIT;


    printf("test mode, signal to exit.\n");
    printf("waiting for events...\n");
    struct js_event e;

    while (1)
    {
        read (fd, &e, sizeof(struct js_event));
        printf("\tgot one: %d=%d\n", e.number, e.value);
    }


EXIT:
    free(map);
    //free(new_map);
    //free(mapping);

    close(fd);

    return 0;

}


--2oS5YaxWCcQjTEyO--
