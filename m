From: Henry Margies <henry.margies@gmx.de>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Tue, 29 Jun 2004 19:26:21 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040629192621.1a99c86c.henry.margies@gmx.de>
References: <40E09FC4.50800@ig.com.br>
	<16608.44836.384260.844173@cerise.nosuchdomain.co.uk>
	<40E17D0A.2030206@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40E17D0A.2030206@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Just put the definition in the cpp file.

Header File:
class Foo
{
	public:
		static const int DEFSIZE;
};

in CPP-File:

const int Foo::DEFSIZE=100


Why does this not work for you?


Henry

-- 

Hi! I'm a .signature virus! Copy me into your
~/.signature to help me spread!

