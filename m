From: Christopher Quinn <cq@htec.demon.co.uk>
Subject: defining a #define
Date: Thu, 05 Dec 2002 12:17:57 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3DEF43F5.7050907@htec.demon.co.uk>
References: <200211071046.24987.abulfazl@juniv.edu> <200211072135.59164.abulfazl@juniv.edu> <20021107200436.C1136@neutrino.particles.org> <200211081504.01461.abulfazl@juniv.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200211071046.24987.abulfazl@juniv.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

if i compile a library with a certain build flag
there are times when i would like to reflect that flag
into the header file for the library, so that larger
compilations involving the library are built the same
way.

ie. something like

---library.h---
#ifdef BUILD_THIS_WAY
#text "#define BUILD_THIS_WAY"
#endif

i could not find anything in the gnu cpp docs.
but does anyone know for sure there *is* a way?

thanks.
- chris


