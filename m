From: Rafael Santos <rafael@thinkfreak.com.br>
Subject: Re: struct passwd usage
Date: Wed, 30 Apr 2003 19:37:52 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <52WQUR4X51XS1YTP4173HGJGKJC0RQ3Z.3eb05040@rafaelnote.ns1.lhost.com.br>
References: <Pine.LNX.4.44.0304301445001.29006-100000@ns.isi.ulatina.ac.cr>
Reply-To: rafael@thinkfreak.com.br
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0304301445001.29006-100000@ns.isi.ulatina.ac.cr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

4/30/03 5:49:13 PM, Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>=
 wrote:

>what is wrong with this code:
>
>main(){
>struct passwd *pwd;
>char *user;

Your string (user) does not have a defined size, so it won't work.

>puts("username:");

The parameter for puts() is the array that you want to recieve, but this is=
 not good, because it can=20
cause memory overflow, when you have an array smaller then the entry.

>pwd=3Dgetpwnam(user);
>puts(pwd->pw_name);
>}
>

#define USERNAME_MAX 100

main()
{
	struct passwd* pwd;
	// What is between [] defines the size of the string + 1 (the last one ind=
icates the
	// of the string (\0)
	char user[USERNAME_MAX+1];

	printf("username: ");
	// Gets the string of maximum size USERNAME_MAX, from the keyboard (STDIN)
	fgets(user,USERNAME_MAX,STDIN);

	pwd=3Dgetpwnam(user);
	puts(pwd->pw_name);
}

Maybe you will have to allocate memory for structure passwd. I don't know t=
hat for sure, because I have=20
never used that before.

>
>---
>Fabio Andres Miranda
>Ingenieria de sistemas informaticos
>Universidad Latina - Costa Rica
>
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programm=
ing" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
Rafael Costa dos Santos
ThinkFreak Com=E9rcio e Solu=E7=F5es em Hardware e Software
Rio de Janeiro / RJ / Brazil
rafael@thinkfreak.com.br
+ 55 21 9432-9266


-
To unsubscribe from this list: send the line "unsubscribe linux-c-programmi=
ng" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
