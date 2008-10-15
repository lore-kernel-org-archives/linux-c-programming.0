From: Per Jessen <per@computer.org>
Subject: Re: How to call another separate program and passing some variables
 in C?
Date: Wed, 15 Oct 2008 11:05:23 +0200
Message-ID: <48F5B253.4010200@computer.org>
References: <DF93814AEDB44B7484B8BF8F416AA50D@johnny> <c15440c50810140412r7df6c411xdf24dd6a16590132@mail.gmail.com> <0E415EA45AC641298E702FBDEDADEA87@johnny> <4f5c2ba10810142334o6dbca046r52eb267c8da28aa9@mail.gmail.com> <528704E66F154167B2EA3F70DDCFFF94@johnny>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <528704E66F154167B2EA3F70DDCFFF94@johnny>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: C programming list <linux-c-programming@vger.kernel.org>

johnny_xing wrote:
> Hi,
>=20
> I tried as what Hlalesh said and it doesn=E2=80=99t work.
>=20
> Here is what I have:
>=20
> In program 1:
>=20
> system(=E2=80=9C/usr/local/src/program2 1=E2=80=9D);
>=20
> In program 2:
> int main(int argc, char *argv[])
> {
> int input1;
> char buffer[10];
> sprintf(buffer, argv[0]);
>=20
> printf("buffer is %s\n", buffer);
> input1 =3Datoi(buffer);
> printf("input1 value is %d\n",input1);
> }
>=20
> The output is:
>=20
> buffer is /usr/local/src/parallel/asterisk
> input1 value is 0
>=20

argv[0] is always the name of the called binary.  To get the arguments,=
=20
you need to start with argv[1].

Surely you can see that atoi("/usr/local/src/parallel/asterisk") is 0 a=
s=20
there is no way to convert "/usr/local/src/parallel/asterisk" to an int=
eger.


/Per Jessen, Zurich
=09

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
