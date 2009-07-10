From: David Lee <live4thee@gmail.com>
Subject: Re: Help on pipe
Date: Fri, 10 Jul 2009 15:27:07 +0800
Message-ID: <8f62e1cd0907100027h6579e99ckf2db4226776c9868@mail.gmail.com>
References: <34e1241d0907092322h5aea016cj437168a43ebfe50e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=/LsMU0IX6JCTfg/0vbK8ifwnVPKYEcAhViXxAm5Q1Bo=;
        b=JdpbjAJeMEP/ewJZSsDL6JsaT2N6izJ8ReSpA67UnVuESicBCQb/rzCoSDuSf6X6VU
         bDFqHfRLXEPH+Dk4ZbD6OlBWOeYftLsr9ENDGb63ACO0DO2cdA3TYj1/CnwavZCvI9dm
         MzQyipKJ+iqTyBnMbMEd2g6rn2p/If4A5VDGU=
In-Reply-To: <34e1241d0907092322h5aea016cj437168a43ebfe50e@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ardhan Madras <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Fri, Jul 10, 2009 at 2:22 PM, Ardhan Madras<nightdecoder@gmail.com> =
wrote:
> Hi,
>
> I'm writing pipe demo:
>
> #include <sys/types.h>
> #include <sys/wait.h>
> #include <unistd.h>
> #include <stdio.h>
> #include <string.h>
>
> int main(void)
> {
> =A0pid_t pid;
> =A0int fds[2], ret;
> =A0const char *sort =3D "/usr/bin/sort";
> =A0char *argv[2] =3D { "sort", NULL };
>
> =A0ret =3D pipe(fds);
> =A0if (ret =3D=3D -1) {
> =A0 =A0perror("pipe");
> =A0 =A0return -1;
> =A0}
> =A0pid =3D fork();
> =A0if (pid =3D=3D -1) {
> =A0 =A0perror("fork");
> =A0 =A0return -1;
> =A0}
>
> =A0if (pid =3D=3D 0) {
> =A0 =A0int ret;
>
> =A0 =A0close(fds[1]);
> =A0 =A0dup2(fds[0], STDIN_FILENO);
>
> =A0 =A0ret =3D execve(sort, argv, NULL);
> =A0 =A0if (ret =3D=3D -1) {
> =A0 =A0 =A0perror("execve");
> =A0 =A0}
> =A0 =A0close(fds[0]);
> =A0 =A0_exit(0);
> =A0}
> =A0else {
> =A0 =A0FILE *stream;
>
> =A0 =A0close(fds[0]);
> =A0 =A0stream =3D fdopen(fds[1], "w");
> =A0 =A0if (!stream) {
> =A0 =A0 =A0perror("fdopen");
> =A0 =A0 =A0return -1;
> =A0 =A0}
> =A0 =A0fprintf(stream, "this\n");
> =A0 =A0fprintf(stream, "means\n");
> =A0 =A0fprintf(stream, "war\n");
> =A0 =A0fflush(stream);
> =A0 =A0waitpid(pid, &ret, 0);
> =A0 =A0close(fds[1]);
> =A0}
> =A0return 0;
> }
>
> I want to send parent's data to the child as "sort" input, i don't
> know why sort doesn't receive the data. Did i made mistake here?
>
> Thanks before.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

The sort program is waiting for an EOF (^D).

--- sort.c.orig 2009-07-10 15:54:36.000000000 +0800
+++ sort.c      2009-07-10 15:53:35.000000000 +0800
@@ -49,6 +49,7 @@
                fprintf(stream, "means\n");
                fprintf(stream, "war\n");
                fflush(stream);
+              fclose(stream);
                waitpid(pid, &ret, 0);
                close(fds[1]);
        }


--=20
Thanks,
Li Qun
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
