From: Rafael Santos <rafael@thinkfreak.com.br>
Subject: Re: struct passwd usage
Date: Wed, 30 Apr 2003 23:10:26 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <FEUT6Z4ECRPPLPLKEA7253UTBAWU74.3eb08212@rafaelnote.ns1.lhost.com.br>
Reply-To: rafael@thinkfreak.com.br
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

A complete functional program solving your problem:

#include <pwd.h>
#include <sys/types.h>

#include <stdio.h> //stdin

#define MAX_LOGIN_SIZE 100

int main(void)
{
        char name[MAX_LOGIN_SIZE+1];
        struct passwd* pwd;

        printf("Digite o Username: ");

        // Gets "Username" from the keyboard
        fgets(name,MAX_LOGIN_SIZE,stdin);

        // Exchanges the character '\n' for '\0'
        name[strlen(name) - 1] =3D '\0';

        printf("\n");

        // Reads from /etc/passwd
        if( (pwd =3D getpwnam(name)) !=3D NULL )
        {
                printf("Username:%s\n", pwd->pw_name);
                printf("Passwrod:%s\n", pwd->pw_passwd);
                printf("Real Name:%s\n", pwd->pw_gecos);
                printf("Directory:%s\n", pwd->pw_dir);
                printf("Shell:%s\n",pwd->pw_shell);
                printf("UserID:%d\n",pwd->pw_uid);
        }
        else
                printf("The user was not found on the system.\n");
}


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
