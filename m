From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: whether the placement of "volatile" makes a difference
Date: Wed, 1 Nov 2006 05:19:28 -0500 (EST)
Message-ID: <Pine.LNX.4.64.0611010502530.1573@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  from the definition of an "atomic" variable in the linux kernel,
there are numerous arch-specific header files that define an atomic
variable in one of two ways:

  1) typedef struct { int counter; } atomic_t;
  2) typedef struct { volatile int counter; } atomic_t;

the purported need for the "volatile" type qualifier is to guarantee
that the (gcc) compiler doesn't try to do anything clever with code
generation, of course, which makes sense.

  the problem is that some architectures add the "volatile" qualifier,
while others don't.  but whether it's necessary isn't just related to
the architecture, is it?  wouldn't it be related to just the
properties of the compiler itself?

  second, even if an architecture didn't strictly *need* that
qualifier, would it hurt to have it there?  surely having an
unnecessary "volatile" qualifier couldn't break code that would
otherwise work, could it?  it would only prevent some possible
optimization, no?

  and, finally, in some of those header files, even if the typedef
doesn't use "volatile", some of the function definitions do:

static inline int atomic_add_return (int i, volatile atomic_t *v) {
                                            ^^^^^^^^

  i find this curious.  in this particular header file, while the
typedef doesn't use the type qualifier "volatile", every routine that
refers to that typedef *does*.  would that be considered equivalent?
that is, would the compiler treat identically the cases where either
1) the typedef itself has a volatile member, or 2) every reference is
to a such a typedef which is declared "volatile".  (and on a related
note, would that mean that having "volatile" in both places would be
utterly redundant?  and it would make more sense to just centralize
that qualifier in a single place, in the typedef?)

  thanks.

rday

