From: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Subject: IntToChar now NumberToString
Date: Mon, 30 Dec 2002 18:10:36 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001201c2b061$0c46ad70$0d75d73f@joe>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0013_01C2B02E.C1AC3D70"
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org
Cc: redhat-devel-list@redhat.com, kb9mnx@fourway.net

This is a multi-part message in MIME format.

------=_NextPart_000_0013_01C2B02E.C1AC3D70
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Special thanks to J. Apple Muncy [kb9mnx@fourway.net] I was able to =
reduce
my original code from 60 lines to 3 lines.  (Oh, my original code was
pathetic, wasn't it?)

This new and improved template function will convert any number of any =
kind
(signed, unsigned, int, double, short, long, float, etc.) to its string
equivalent.

For example:

int myInt =3D 923746;

becomes

string myString("923746");

This isn't exactly how it works but I wrote that little bit just to =
complete
your mental picture.

Joseph Wagner

------=_NextPart_000_0013_01C2B02E.C1AC3D70
Content-Type: text/plain;
	name="NumberToString.hpp"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="NumberToString.hpp"

// Template Function: NumberToString

// Copyright =A9 2002 Joseph Wagner.  All rights reserved.
// Email: wagnerjd@users.sourceforge.net
//=20
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 2.1 of the License, or (at your option) any later version.
//=20
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
//=20
// You should have received a copy of the GNU Lesser General Public
// License along with this library; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA

#pragma once

#include <sstream>
using std::ostringstream;

template<typename NumberType>
const string NumberToString(const NumberType number) {
	// Declares variable used as a medium in conversion
	ostringstream numberStream;

	// Converts number into output string stream
	numberStream << number;

	// Converts output string stream to string, and returns a copy
	return numberStream.str();
}

------=_NextPart_000_0013_01C2B02E.C1AC3D70--

