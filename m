From: p.boehm@d-trust.net
Subject: different access to structs
Date: Mon, 4 Oct 2004 12:15:59 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OF3FF607B8.2DEFEA3E-ONC1256F23.0035E913@bln.d-trust.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,
in last time I played a little bit with structures. There are two types of access to it and I want
to know where are the differences.
Or better: when it makes sense to use type one and when type two ?

struct xy {
     int id;
     char *name;
};

struct abc {
     int id;
     char *name;
     struct xy st_name;            /* <-- type 1 ( ...via name(=address) ) */
     struct xy *st_ptr;            /* <-- type 2 ( ...via pointer(=address) ) */
};

void init_abc(struct abc *pt) {          /* pt points to ptr ... */
     pt->id=0;
     pt->name="test";

     pt->st_name.id=0;             /* <-- type 1 (access via name of variable) */
     pt->st_name.name="test";

     pt->st_ptr->id=0;             /* <-- type 2 (access via pointer) */
     pt->st_ptr->name="test";
}

void main(void) {
     struct abc ptr;               /* name of struct = ptr */

     init_abc(&ptr);               /* call init_abc(<address of ptr>) */
}

thanks in advance!
pb

