From: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Subject: IntToChar template function
Date: Sat, 28 Dec 2002 20:18:22 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001501c2aee0$908703f0$d02c3a41@joe>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0016_01C2AEAE.45EC93F0"
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_0016_01C2AEAE.45EC93F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I created a template function that will convert an integer of any form
(unsigned/signed, short/long) to its char array equivalent.

For example,

int myInt =3D 768;

is converted into

char myChar[] =3D {"768"};

This isn't exactly how it works but I wrote that little bit just to =
complete
your mental picture.

You pass to the function IntToChar an integer of any type and it will =
return
a pointer to a char array.

I tested it, and it works.  It's fully operational, but I'm sure =
somebody
out there will find bugs and/or qwerks that can be tweaked.

Any such comments would be appreciated!

TIA

Joseph Wagner

------=_NextPart_000_0016_01C2AEAE.45EC93F0
Content-Type: text/plain;
	name="IntToChar.hpp"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="IntToChar.hpp"

// Class: IntToChar
// Requires file(s): IntToChar.cpp

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

// Allows Ports to Non-Windows
#if !defined(_WIN32) && !defined(_WIN64)
	typedef long long int __int64;
#endif

template<typename IntegerType>
char *IntToChar(IntegerType number);
------=_NextPart_000_0016_01C2AEAE.45EC93F0
Content-Type: text/plain;
	name="IntToChar.cpp"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="IntToChar.cpp"

// Class: IntToChar
// Requires file(s): IntToChar.hpp

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

#include "IntToChar.hpp"

#include <bitset>
using std::bitset;
#include <typeinfo>
#include <cstring>
#include <cmath>

template<typename IntegerType>
char *IntToChar(IntegerType number) {
	// Supports 64-bit integers
	const bitset<64> number64 =3D number;
	char dataType[64] =3D {0};
	static char character64[22] =3D {0};	// 64-bit numbers never have more =
than 20 digits
	unsigned short pointer =3D 0;
	unsigned short digitHolder =3D 0;
	const unsigned short AsciiOffset =3D 48;
   =20
	// Determines size in bits
    const unsigned short sizeInBits =3D sizeof(IntegerType) * 8;
	const unsigned short lastBit =3D sizeInBits - 1;

	// Obtains type information
	//const char *rawDataType =3D typeid(IntegerType).name();
	strncpy(dataType, typeid(IntegerType).name(), 64);

	// Determines if signed or unsigned
	bool isUnsigned =3D false;
	char *tokenDataType =3D strtok(dataType, " ");
	while(tokenDataType !=3D NULL) {
		if(strcmp(tokenDataType, "unsigned")) {
			isUnsigned =3D true;
		}
		tokenDataType =3D strtok(NULL, " ");
	}

	// Deals with sign
	if(!isUnsigned && number64[lastBit] =3D=3D 1) {
        character64[pointer] =3D '-';
        pointer++;
	}

    // Converts individual digits to characters
	for(unsigned __int64 divisor =3D 10000000000000000000; divisor >=3D 1; =
divisor /=3D 10) {
		if(divisor < number) {
			digitHolder =3D floor(number / divisor);
			character64[pointer] =3D static_cast<char>(digitHolder + =
AsciiOffset);
			number -=3D (digitHolder * divisor);
			pointer++;
		}
	}

	// Finishes up with terminating null character
	character64[pointer] =3D '\0';

	return character64;
}
------=_NextPart_000_0016_01C2AEAE.45EC93F0--

