From: Mat Harris <mat.harris@genestate.com>
Subject: reading the camera device
Date: Fri, 29 Nov 2002 10:30:43 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021129103043.GA24283@genestate.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--QKdGvSO+nmPlgiQ/
Content-Type: multipart/mixed; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

ok, i have this little bit of code to read the camera device and return the
buffer to another function for writing to a ppm image. the problem is that
when it gets to the read function, it hangs and never resumes. obviously
there is a problem somewhere in the way of length of reading the bytes in.

the program is attached.

--=20
Mat Harris			OpenGPG Public Key ID: C37D57D9
mat.harris@genestate.com	matthewh.genestate.com=09

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="grab.c"
Content-Transfer-Encoding: quoted-printable

/*Spiros Ioannou 2/2000 */
/*sivann@softlab.ece.ntua.gr*/
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <linux/types.h>=20
#include <errno.h>
/*#include <linux/videodev.h>*/
#include "../conf.h"

void save_ppm(char *filename, unsigned char *pic);

int main()
{
	int dev;				/* the device we will use */
	int len;
	char device[FILENAME_SIZE] =3D "/dev/video0";
	unsigned char pic[MAX_RGBA_IMAGE_SIZE];
  	char filename[FILENAME_SIZE] =3D "./test.ppm";

	dev =3D open (device, O_RDWR);
	if (dev < 0)
	{
		perror(device);
		exit(1);
	}

	fprintf(stderr, "about to read\n");
	len =3D read(dev, pic, MAX_RGBA_IMAGE_SIZE);
	if (len =3D=3D 0 || len =3D=3D -1)
	{
		fprintf(stderr, "error reading camera device\n");
		exit(0);
	}
	fprintf(stderr, "read\n");

	/*while((len =3D read(dev, pic, MAX_RGBA_IMAGE_SIZE)) <=3D 0)
	{
		if(errno !=3D 0 && errno !=3D EINTR)
		{
			fprintf(stderr, "Error read image\n");
			exit(0);
		}
	}*/

	save_ppm(filename, pic);
=09
	exit(0);=09
}

void save_ppm(char *filename, unsigned char *pic)
{
  FILE *outfile;
  unsigned char buff[3];
  int i;

    if (!(outfile=3Dfopen(filename,"w"))) {
      perror(filename);
      exit(errno);
    };
    fprintf (outfile, "P6\n%d %d\n%d\n", 640, 480, 255);
    for (i =3D 0; i < 640*480*3; i+=3D3) {
      buff[0] =3D pic[i];   /* r */
      buff[1] =3D pic[i+1]; /* g */
      buff[2] =3D pic[i+2]; /* b */
      fwrite (buff, 1, 3, outfile);
    }
    fclose(outfile);
}

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="conf.h"

/************************************************
 * this is the config file containing defaults	*
 * for the camera program. all defaults are	*
 * controlled with preprocessor macros		*
 ************************************************/

#define FILENAME_SIZE 20			/* char size for holding filenames */
#define DEFAULT_NOISE_THREASHOLD 60		/* level of noise */
#define DEFAULT_PIXEL_THREASHOLD 1500		/* number of changed pixels */
#define X_AXIS_IMAGE_SIZE 640			/* work it out */
#define Y_AXIS_IMAGE_SIZE 480			/* ditto */
#define DAY_LIGHT_LEVEL 180			/* mark to differentiate between day and night */
#define TIMEOUT_LEN 1000			/* ??? - doesn't seem to be used anywhere else */
#define MAX_RGBA_IMAGE_SIZE ((640*480*4)+256)	/* maximum size for capturing an image */

--7JfCtLOvnd9MIVvH--

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE950HTEsYvZsN9V9kRAq6ZAJ9MjseDd21cfVdM8YLSCcOSqw4gdwCfUzoM
yrW+DCmWBGWvK3sS1UcnFGg=
=KgHr
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
