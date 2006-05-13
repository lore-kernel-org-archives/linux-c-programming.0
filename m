From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Curious segmentation fault - please help
Date: Sat, 13 May 2006 19:58:32 +0530
Message-ID: <200605131958.39156.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1957553.c2zspLIgd5";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

--nextPart1957553.c2zspLIgd5
Content-Type: multipart/mixed;
  boundary="Boundary-01=_Q0eZEShaabeJQ5Q"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_Q0eZEShaabeJQ5Q
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Attached: valgrind output; used electric fence too
Attached: original source code (licence: Artistic Licence v2)

I am getting a segmentation fault. I have compiled using electric fence, an=
d=20
used valgrind to debug. (Not got used to gdb yet.)

=46or some reason, while I have initialized the array grahanaama[] (line 64=
 of=20
monthpan.c), grahanaama[0] gives an error at line 593 [added for debugging]=
=2E=20
Similarly initialized array tithinaama does not give an error for accessing=
=20
tithinaama[0].

Please help.

=2D-=20

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.1
$ date [] CCE +2006-05-13 W19-6 UTC+0530

--Boundary-01=_Q0eZEShaabeJQ5Q
Content-Type: text/x-csrc;
  charset="us-ascii";
  name="monthpan.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="monthpan.c"

/* ---------------------- shuddha drik panchaanga ---------------------- */
/*                        version 1.43                                   */

/* ------------------- header includes ------------------- */
#include "swephexp.h"
#include "time.h"

/* ------------------- function declarations ------------------- */
/* display instructions to user */
void dispinstructsfordate(void);
/* convenience functions - general */
double mod360(double inbut);
/* convenience functions - output */
void writetithinaama(int tithi2);
void writekarananaama(int karana2);
void depwarn(const char *s);
/* validate and input functions */
void vinputdate(void);
void safeinput(void);
/* output formatting functions */
char *ppt_hm(double t);
char *ppd2(int mon, int day);
/* jyotisha functions */
void calcpananglesfor(double tjd2);
void searchforpan(int mode, int itemnum, double startjd, char searchspace);
double ayanaamshafor(double tjd2);
/* main output functions */
void listsplpanchaanga(double startjd2, double endjd2);

/* ------------------- variable declarations ------------------- */
char ppoutput[12];
char cvoutput[30];
char safeinputbuffer[30];
char serr[AS_MAXCH];
char chaandramaasa[80];
int jday, jmon, jyear, jhour, jmin, jsec;
int planet;
int tithi, vaasara, nakshatra, yoga, karana;
int rtu, saayanamaasa, nirayanamaasa;
int tzhour, tzmin;
int repeatinput, iteration;
int userinputjulianday, borderday;
int depwarned;
int sunatamaa0, sunatamaa1, sunatamaa2, chaandramaasatype;
int32 iflag, iflgret;
time_t nowval;
double jut, tjd, te, x2[6];
double startjd, endjd;
double xSpica[6], ayanaamsha;
double grahadata[9][2], saayanasuurya;
double tithiangle, nakshatraangle, yogaangle;
double stithiangle, snakshatraangle, syogaangle; // to be used during search
double sayanaamsha, ssunlong, smoonlong; // to be used during search
double tzoffset;
double low, high, border, borderoftithi; // borderoftithi used when karana =
is second half
double amaalow, amaahigh, amaa0, amaa1, amaa2;
struct tm now, nowut, ppbuffer;
=46ILE *fp;

/* ------------------- constant declarations ------------------- */
enum searchpanchoices { S_TITHI, S_NAKSHATRA, S_YOGA, S_KARANA };
double chennai[3] =3D {80.3, 13.1, 0.0};
char spicanaama[] =3D "Spica";
char *grahanaama[] =3D {"Bhaanu", "Soma", "Mangala", "Budha", "Guru", "Shuk=
ra", "Shani"};
char *tithinaama[] =3D {
	 "Pratham",   "Dvitii",   "Tritii",
	  "Chatur",   "Pancha",    "Shash",
	   "Sapta",    "Ashta",     "Nava",
	   "Dasha",   "Ekaada",   "Dvaada",
	 "Trayoda", "Chaturda" };
	// puurnimaa and amaavaasyaa will be handled separately
char *nakshatranaama[] =3D {
	"Ashvinii", "Bharanii",   "Kritti",
	 "Rohinii",    "Mriga",  "Aardraa",
	   "Punar",   "Pushya",   "Aashre",
	  "Maghaa",   "P Phal",   "U Phal",
	   "Hasta",  "Chitraa",  "Svaatii",
	  "Vishaa",   "Anuraa",    "Jyesh",
	   "Muula",  "P Ashaa",  "U Ashaa",
	"Shravana", "Shravish",    "Shata",
	 "P Prosh",  "U Prosh",  "Revatii" };
char *yoganaama[] =3D {
	 "Vishkam",   "Priiti",   "Aayush",
	 "Saubhaa", "Shobhana", "Atiganda",
	"Sukarman",   "Dhriti",   "Shuula",
	   "Ganda",  "Vriddhi",   "Dhruva",
	"Vyaaghaa", "Harshana",    "Vajra",
	  "Siddhi",   "Vyatii",  "Varigha",
	 "Parigha",    "Shiva",   "Siddha",
	 "Saadhya",   "Shubha",  "Shubhra",
	 "Braahma",   "Maahen",  "Vaidhri" };
char *karananaama[] =3D {
	"Bava", "Baalava", "Kaulava", "Taitila", "Garajaa", "Vanijaa", "Bhadraa" }=
;=20
	// sthira karana-s will be handled separately
double arcmin800 =3D 360.0 / 27.0;

/* ------------------- main function ------------------- */
int main(int argc, char *argv[])
{
	swe_set_ephe_path(".");

	iflag =3D SEFLG_SPEED;
	userinputjulianday =3D 0;
	depwarned =3D 0;
	tzoffset =3D 0;

	printf("\n");

	/* testing dependency files */

	if ((fp =3D fopen("fixstars.cat", "r")) =3D=3D NULL) depwarn("fixstars.cat=
"); else fclose(fp);
	if ((fp =3D fopen( "sepl_18.se1", "r")) =3D=3D NULL) depwarn( "sepl_18.se1=
"); else fclose(fp);
	if ((fp =3D fopen( "semo_18.se1", "r")) =3D=3D NULL) depwarn( "semo_18.se1=
"); else fclose(fp);

	/*
	ayanaamshafor(2451545.0);
	if (iflgret < 0) depwarn("fixstars.cat");
	iflgret =3D swe_calc(2451545.0, 0, iflag, x2, serr); // sun
	if ((iflgret < 0) || (iflgret !=3D iflag)) depwarn("sepl_18.se1");
	iflgret =3D swe_calc(2451545.0, 1, iflag, x2, serr); // moon
	if ((iflgret < 0) || (iflgret !=3D iflag)) depwarn("semo_18.se1");
	*/

	if (depwarned) printf("\n");
=09
	/* processing arguments */

	argc--;
	if (argc =3D=3D 0) // no commandline arguments
	{
		printf("Please provide the start and end Gregorian dates.\n");
		dispinstructsfordate();

		tzoffset =3D 5.5 / 24.0;
		printf("Please enter the start date.\n");
		vinputdate();
		startjd =3D swe_julday(jyear,jmon,jday,jut,SE_GREG_CAL) - tzoffset;
		printf("Please enter the end date.\n");
		do
		{
			repeatinput =3D FALSE;
			vinputdate();
			endjd =3D swe_julday(jyear,jmon,jday,jut,SE_GREG_CAL) - tzoffset;
			if ((int) endjd <=3D (int) startjd) repeatinput =3D TRUE;
			if (repeatinput) printf("Please enter an end date later than the start d=
ate.\n");
		}
		while (repeatinput);
		listsplpanchaanga(startjd, endjd);
	}
	else // too many parameters
	{
		printf ("Too many parameters.\n");
	}

	printf("\nWritten special panchaanga for given date range for Chennai to m=
onthpan.txt\n\n");
	return 1;
}

/* display instructions to user */

void dispinstructsfordate(void)
{
	printf("Years must be in the range 1800 to 2399 CCE (\"AD\"). Two-digit ye=
ars are not accepted.\n");
	printf("The timezone must be specified in terms of the UTC offset, positiv=
e east of Greenwich.\n\n");
}

/* convenience functions - general */

double mod360(double inbut)
{
	if (inbut >=3D 360.0) return (inbut - 360.0);
	if (inbut < 0.0) return (inbut + 360.0);
	return inbut;
}

/* convenience functions - output */

void writetithinaama(int tithi2)
{
	tithi2 %=3D 30;
	if (tithi2 =3D=3D 14)      fprintf(fp, "  Puurni ");
	else if (tithi2 =3D=3D 29) fprintf(fp, "    Amaa ");
	else fprintf(fp, "%8s ", tithinaama[(tithi2 > 14) ? (tithi2 - 15) : tithi2=
]);
}

void writekarananaama(int karana2)
{
	karana2 %=3D 60;
	switch(karana2)
	{
		case 0:  fprintf(fp, " Kimstu "); break;
		case 57: fprintf(fp, "Shakuni "); break;
		case 58: fprintf(fp, "Chatush "); break;
		case 59: fprintf(fp, "Naagava "); break;
		default:
			fprintf(fp, "%7s ", karananaama[(karana2 - 1) % 7]);
			break;
	}
}

void depwarn(const char *s)
{
	printf("WARNING: %12s not found. Internal medium-accuracy formulae will be=
 used.\n", s);
	// to change to "or corrupted" when the corruption checking is debugged
	depwarned =3D 1;
}

/* validate and input functions */

void vinputdate(void)
{
	do
	{
		repeatinput =3D FALSE;
		printf("Date as YYYY-MM-DD     : ");
		safeinput();
		if (sscanf(safeinputbuffer, "%d-%d-%d", &jyear, &jmon, &jday) < 1) repeat=
input =3D TRUE;
		if (swe_date_conversion(jyear, jmon, jday, 0.0, 'g', &tjd) =3D=3D ERR) re=
peatinput =3D TRUE;
		if (jyear < 1800 || jyear > 2399) repeatinput =3D TRUE;
		if (repeatinput) printf ("Please enter a valid date.\n");
	}
	while (repeatinput);
}

void safeinput(void)
{
	fgets(safeinputbuffer, 30, stdin);
}

/* formatting functions */

char *ppt_hm(double t) // pretty print time -- no seconds
{
	ppbuffer.tm_mday =3D 1; // since it's the only member without zero value
	ppbuffer.tm_hour =3D (int) t;
	t -=3D ppbuffer.tm_hour;
	t *=3D 60.0;
	ppbuffer.tm_min =3D (int) t;
	strftime (ppoutput, 6, "%H:%M", &ppbuffer);
	return ppoutput;
}

char *ppd2(int mon, int day) // pretty print date
{
	ppbuffer.tm_mon =3D mon - 1;
	ppbuffer.tm_mday =3D day;
	strftime (ppoutput, 11, "%b-%d", &ppbuffer);
	return ppoutput;
}

/* jyotisha functions */

void calcpananglesfor(double tjd2)
{
	/* calculate ephemeris time in julian days */
	te =3D tjd2 + swe_deltat(tjd2);

	/* calculate ayanaamsha */
	sayanaamsha =3D ayanaamshafor(te);

	/* calculate sun and moon */
	swe_calc(te, 0, iflag, x2, serr); // sun
	ssunlong =3D mod360(x2[0] - sayanaamsha);
	swe_calc(te, 1, iflag, x2, serr); // moon
	smoonlong =3D mod360(x2[0] - sayanaamsha);

	/* calculate the tithi, nakshatra and yoga angles for search */
	stithiangle =3D mod360(smoonlong - ssunlong); // lunar minus solar longitu=
de
	snakshatraangle =3D smoonlong; // lunar longitude
	syogaangle =3D mod360(smoonlong + ssunlong); // lunar plus solar longitude
}

void searchforpan(int mode, int itemnum, double startjd, char searchspace)
{
	low =3D startjd;
	switch (searchspace)
	{
		case 'h':	high =3D low + 0.5; break;
		case 'f':	high =3D low + 1.0; break;
		case 'x':	high =3D low + 1.5; break;
	}

	for (iteration =3D 1; iteration < 26; iteration++)
	{
		border =3D (low + high) / 2.0;
		calcpananglesfor(border);
		switch (mode)
		{
			case S_TITHI:
				if (itemnum > 29) itemnum -=3D 30; // needed because we search for tith=
i + 2 etc
				if (itemnum =3D=3D 0)
				{
					if (stithiangle > 330.0) low =3D border;
					if (stithiangle < 30.0) high =3D border;
				}
				else
				{
					if (stithiangle < (itemnum * 12.0)) low =3D border;
					else high =3D border;
				}
				break;
			case S_NAKSHATRA:
				if (itemnum > 26) itemnum -=3D 27; // needed because we search for naks=
hatra + 2 etc
				if (itemnum =3D=3D 0)
				{
					if (snakshatraangle > 330.0) low =3D border;
					if (snakshatraangle < 30.0) high =3D border;
				}
				else
				{
					if (snakshatraangle < (itemnum * arcmin800)) low =3D border;
					else high =3D border;
				}
				break;
			case S_YOGA:
				if (itemnum > 26) itemnum -=3D 27; // needed because we search for yoga=
 + 2 etc
				if (itemnum =3D=3D 0)
				{
					if (syogaangle > 330.0) low =3D border;
					if (syogaangle < 30.0) high =3D border;
				}
				else
				{
					if (syogaangle < (itemnum * arcmin800)) low =3D border;
					else high =3D border;
				}
				break;
			case S_KARANA:
				if (itemnum > 59) itemnum -=3D 60; // needed because we search for kara=
na + 2 etc
				if (itemnum =3D=3D 0)
				{
					if (stithiangle > 330.0) low =3D border;
					if (stithiangle < 30.0) high =3D border;
				}
				else
				{
					if (stithiangle < (itemnum * 6.0)) low =3D border;
					else high =3D border;
				}
				break;
		}
	}
}

double ayanaamshafor(double te2)
{
	iflgret =3D swe_fixstar(spicanaama, te2, iflag, xSpica, serr);
	if (iflgret >=3D 0) return (xSpica[0] - 180.0); // < 0 -> file not found o=
r corrupted

	/* the following section is evaluated only if the fixstars.cat file is not=
 found or is corrupted */

	double t;
	double ra_h, ra_m, ra_s, ra;
	double de_d, de_m, de_s, de;
	double ra_pm, de_pm;
	double parallax, r, radv;
	double sinra, cosra;
	double sinde, cosde;
	double x, y, z;
	double delx, dely, delz;
	double zeta, zee, theta;
	double cosraz;
	double sinth, costh;
	double A, B, C;
	double ep;
	double lambda, ayana;
	double obli_nut[6];

	t =3D te2 - 2451545.0; // days since J2000.0
	t /=3D 365.25; // convert to years

	/* spica value initialization */

	/* 1. x-y position */

	ra_h =3D 13.0;
	ra_m =3D 25.0;
	ra_s =3D 11.5793;
	ra =3D (ra_h + ra_m / 60.0 + ra_s / 3600.0) * 15.0; // convert to degrees
	ra *=3D DEGTORAD; // convert to radians;

	de_d =3D -11.0;
	de_m =3D -9.0;
	de_s =3D -40.759;
	de =3D de_d + de_m / 60.0 + de_s / 3600.0; // convert to degrees
	de *=3D DEGTORAD; // convert to radians

	/* 2. x-y motion */

	ra_pm =3D -42.50; // mas/yr
	de_pm =3D -31.73; // mas/yr

	ra_pm /=3D (3600.0 * 1000.0); // convert to degrees per year;
	de_pm /=3D (3600.0 * 1000.0);

	ra_pm *=3D DEGTORAD; // convert to radians per year
	de_pm *=3D DEGTORAD;

	/* 3. z position and motion */

	parallax =3D 12.44; // milliarcseconds
	parallax /=3D 1000.0; // convert to arcseconds
	r =3D 1 / parallax; // distance in parsecs

	radv =3D 1.0; // km/s
	radv /=3D 977792.0; // convert to parsecs per year

#if 0
	/* simple proper motion */

	ra +=3D ra_pm * t;
	de +=3D de_pm * t;
#endif

	/* rigorous proper motion */

	sinra =3D sin(ra); // convenience
	cosra =3D cos(ra);
	sinde =3D sin(de);
	cosde =3D cos(de);

	x =3D r * cosde * cosra;
	y =3D r * cosde * sinra;
	z =3D r * sinde;

	delx =3D (x / r) * radv - z * de_pm * cosra - y * ra_pm;
	dely =3D (y / r) * radv - z * de_pm * sinra + x * ra_pm;
	delz =3D (z / r) * radv + r * de_pm * cosde;

	x +=3D t * delx;
	y +=3D t * dely;
	z +=3D t * delz;

	ra =3D atan2(y, x);
	de =3D atan2(z, sqrt(x * x + y * y));

	/* precession */

	t /=3D 100.0; // convert to centuries

	zeta  =3D t * (2306.2181 + t * (0.30188 + t * 0.018998));
	zee   =3D t * (2306.2181 + t * (1.09468 + t * 0.018203));
	theta =3D t * (2004.3109 + t * (0.42665 + t * 0.041833));

	zeta  /=3D 3600.0;     // to degrees
	zee   /=3D 3600.0;
	theta /=3D 3600.0;

	zeta  *=3D DEGTORAD;   // to radians
	zee   *=3D DEGTORAD;
	theta *=3D DEGTORAD;
=09
	cosraz =3D cos(ra + zeta);
	sinth  =3D sin(theta);
	costh  =3D cos(theta);
	sinde  =3D sin(de);         // recalculation for changed de value
	cosde  =3D cos(de);

	A =3D cosde * sin(ra + zeta);
	B =3D cosde * cosraz * costh - sinth * sinde;
	C =3D cosde * cosraz * sinth + costh * sinde;

	ra =3D atan2(A, B) + zee;
	de =3D asin(C);

	/* find obliquity and nutation in longitude */

	swe_calc(te2, SE_ECL_NUT, 0, obli_nut, serr);
	ep =3D obli_nut[0];
	// ep =3D 23.0 + 26.0 / 60.0 + 21.448 / 3600.0; // J2000
	ep *=3D DEGTORAD;

	/* find ecliptic longitude */

	lambda =3D atan2(sin(ra) * cos(ep) + tan(de) * sin(ep), cos(ra));
	lambda /=3D DEGTORAD;
	lambda +=3D obli_nut[2];

	/* find and return ayanaamsha */

	ayana =3D lambda - 180.0;
	if (ayana < 0.0) ayana +=3D 360.0;
	return ayana;
}

/* main output function */

void listsplpanchaanga(double startjd2, double endjd2)
{
	fp =3D fopen("monthpan.txt", "w");

	int secondtithi, secondnakshatra, secondyoga, thirdkarana;
	char bsecondtithi[10], bsecondnakshatra[10], bsecondyoga[10], bthirdkarana=
[10];
	int extraexists;
	int endtithi, endnakshatra, endyoga, endkarana;
	int mendtithi, mendnakshatra, mendyoga, mendkarana;
	double prev_sunset, this_sunrise, this_sunset, this_braahma, this_noon;

	/* mend are modified end values use to prevent discontinuity at 0;
	if (start)tithi =3D=3D 29 and endtithi =3D=3D 0, endtithi would not be ide=
ntified as (start)tithi + 1=09
	similarly for other cases
	we cannot manipulate the end___ variables themselves since we need them to=
 assign their values to
	the start___ variables for the next day */

	calcpananglesfor(startjd2);

	tithi =3D stithiangle / 12.0; // prathamaa =3D=3D 0
	nakshatra =3D snakshatraangle / arcmin800; // ashvinii =3D=3D 0
	yoga =3D syogaangle / arcmin800; // vishkambha =3D=3D 0
	karana =3D stithiangle / 6.0; // kimstughna =3D=3D 0

	swe_rise_trans(startjd2 - 1, SE_SUN, NULL, SEFLG_SWIEPH,=20
			SE_CALC_SET + SE_BIT_DISC_CENTER + SE_BIT_NO_REFRACTION,
			chennai, 0, 25, &prev_sunset, serr);
	//fprintf(fp, "debug: first prev_sunset %f \n", prev_sunset);

	for (tjd =3D startjd2; tjd <=3D endjd2; tjd++)
	{
		extraexists =3D 0;
		secondtithi =3D secondnakshatra =3D secondyoga =3D thirdkarana =3D 300; /=
/ an illegal value for all these
		swe_revjul (tjd + tzoffset, SE_GREG_CAL, &jyear, &jmon, &jday, &jut);
		fprintf(fp, "%6s | ", ppd2(jmon, jday));

		swe_rise_trans(tjd, SE_SUN, NULL, SEFLG_SWIEPH,=20
			SE_CALC_RISE + SE_BIT_DISC_CENTER + SE_BIT_NO_REFRACTION,
			chennai, 0, 25, &this_sunrise, serr);
		swe_rise_trans(tjd, SE_SUN, NULL, SEFLG_SWIEPH,=20
			SE_CALC_SET + SE_BIT_DISC_CENTER + SE_BIT_NO_REFRACTION,
			chennai, 0, 25, &this_sunset, serr);

		this_braahma =3D this_sunrise - (this_sunrise - prev_sunset) / 5;
		this_noon =3D (this_sunrise + this_sunset) / 2;

		fprintf(fp, "%5s ", ppt_hm((this_braahma - tjd) * 24.0));
		fprintf(fp, "%5s ", ppt_hm((this_sunrise - tjd) * 24.0));
		fprintf(fp, "%5s ", ppt_hm((this_noon - tjd) * 24.0));
		fprintf(fp, "%5s | ", ppt_hm((this_sunset - tjd) * 24.0));

		calcpananglesfor(tjd + 1);

		vaasara =3D fmod(tjd + tzoffset + 1.5, 7);
		mendtithi =3D endtithi =3D stithiangle / 12.0;
		mendnakshatra =3D endnakshatra =3D snakshatraangle / arcmin800;
		mendyoga =3D endyoga =3D syogaangle / arcmin800;
		mendkarana =3D endkarana =3D stithiangle / 6.0;

		if (tithi     !=3D  0 && endtithi     =3D=3D 0) mendtithi     +=3D 30;
		if (tithi     =3D=3D 29 && endtithi     =3D=3D 1) mendtithi     +=3D 30;
		if (nakshatra !=3D  0 && endnakshatra =3D=3D 0) mendnakshatra +=3D 27;
		if (nakshatra =3D=3D 26 && endnakshatra =3D=3D 1) mendnakshatra +=3D 27;
		if (yoga      !=3D  0 && endyoga      =3D=3D 0) mendyoga      +=3D 27;
		if (yoga      =3D=3D 26 && endyoga      =3D=3D 1) mendyoga      +=3D 27;
		if (karana    !=3D  0 && endkarana    =3D=3D 0) mendkarana    +=3D 60;
		if (karana    !=3D  0 && endkarana    =3D=3D 1) mendkarana    +=3D 60;
		if (karana    =3D=3D 59 && endkarana    =3D=3D 2) mendkarana    +=3D 60;
		/*
		karana can go from
		59 to 0, 58 to 0, 57 to 0
		         59 to 1, 58 to 1
                                  59 to 2
		it is safe to test for karana !=3D 0 as a shortcut to (karana =3D=3D 58 |=
| karana =3D=3D 59)
		  since karana =3D=3D 1 && endkarana =3D=3D 1 is *never* possible
		otoh tithi =3D=3D 1 && endtithi =3D=3D 1 is possible,=20
		  so tithi !=3D 0 would test false positive for tithi =3D=3D 1
		  whereas it should evaluate only for tithi =3D=3D 29
		  so we use safely tithi =3D=3D 29
		  besides, since only one non-zero tithi value is possible for endtithi =
=3D=3D 1,
		  a shortcut is not required
		and regarding the mend___ +=3D statements,
		  i opted for +=3D instead of direct assignment for the logic to be clear
		  and remember that the mend___ values are assigned simultaneously with t=
he end___ values,
		  else +=3D would not work as expected to produce 30 for 0 or 31 for 1 etc
		*/

		if ((mendtithi =3D=3D tithi + 2) || (mendnakshatra =3D=3D nakshatra + 2) =
|| (mendyoga =3D=3D yoga + 2) ||
			(mendkarana =3D=3D karana + 3)) extraexists =3D 1;

		if (tithi < 15) fprintf(fp, "Sh "); else fprintf(fp, "Kr ");
		writetithinaama(tithi);
		if (mendtithi =3D=3D tithi + 2)
		{
			searchforpan(S_TITHI, tithi + 2, tjd, 'f'); // search for *start* of tit=
hi + 2
			secondtithi =3D tithi + 1; // we need to print name of tithi + 1
			strcpy(bsecondtithi, ppt_hm((border - tjd) * 24.0));
		}
		if (mendtithi > tithi) // tests for tithi + 1 and tithi + 2
		{
			searchforpan(S_TITHI, tithi + 1, tjd, 'f');
			fprintf(fp, "%5s | ", ppt_hm((border - tjd) * 24.0));
		}
		if (mendtithi =3D=3D tithi) fprintf(fp, "    / | ");

		printf("debug: vaasara =3D %d, graha =3D %7s\n", vaasara, grahanaama[vaas=
ara]);
		fprintf(fp, "%7s | ", grahanaama[vaasara]);

		fprintf(fp, "%8s ", nakshatranaama[nakshatra]);
		if (mendnakshatra =3D=3D nakshatra + 2)
		{
			searchforpan(S_NAKSHATRA, nakshatra + 2, tjd, 'f'); // search for *start=
* of nakshatra + 2
			secondnakshatra =3D nakshatra + 1; // we need to print name of nakshatra=
 + 1
			strcpy(bsecondnakshatra, ppt_hm((border - tjd) * 24.0));
		}
		if (mendnakshatra > nakshatra) // tests for nakshatra + 1 and nakshatra +=
 2
		{
			searchforpan(S_NAKSHATRA, nakshatra + 1, tjd, 'f');
			fprintf(fp, "%5s | ", ppt_hm((border - tjd) * 24.0));
		}
		if (mendnakshatra =3D=3D nakshatra) fprintf(fp, "    / | ");

		fprintf(fp, "%8s ", yoganaama[yoga]);
		if (mendyoga =3D=3D yoga + 2)
		{
			searchforpan(S_YOGA, yoga + 2, tjd, 'f'); // search for *start* of yoga =
+ 2
			secondyoga =3D yoga + 1; // we need to print name of yoga + 1
			strcpy(bsecondyoga, ppt_hm((border - tjd) * 24.0));
		}
		if (mendyoga > yoga) // tests for yoga + 1 and yoga + 2
		{
			searchforpan(S_YOGA, yoga + 1, tjd, 'f');
			fprintf(fp, "%5s | ", ppt_hm((border - tjd) * 24.0));
		}
		if (mendyoga =3D=3D yoga) fprintf(fp, "    / | ");

		writekarananaama(karana);
		searchforpan(S_KARANA, karana + 1, tjd, 'f'); // max karana size is large=
r than half-day, so 'f'
		fprintf(fp, "%5s ", ppt_hm((border - tjd) * 24.0));
		writekarananaama(karana + 1);
		if (mendkarana =3D=3D karana + 3)
		{
			searchforpan(S_KARANA, karana + 3, tjd, 'f'); // search for *start* of k=
arana + 3
			thirdkarana =3D karana + 2; // we need to print name of karana + 2
			strcpy(bthirdkarana, ppt_hm((border - tjd) * 24.0));
		}
		if (mendkarana > karana + 1) // tests for karana + 2 and karana + 3
		{
			searchforpan(S_KARANA, karana + 2, tjd, 'f'); // search for *start* of k=
arana + 2
			fprintf(fp, "%5s", ppt_hm((border - tjd) * 24.0));
		}
		if (mendkarana =3D=3D karana + 1) fprintf(fp, "    /");

		fprintf(fp, "\n");

		if (extraexists)
		{
			fprintf(fp, "       |                         | "); // date and times

			if (secondtithi =3D=3D 300) fprintf(fp, " -        -     - | "); // paks=
ha and tithi
			else
			{
				if (secondtithi < 15) fprintf(fp, "Sh "); else fprintf(fp, "Kr ");
				writetithinaama(secondtithi % 30);
				fprintf(fp, "%5s | ", bsecondtithi);
			}

			fprintf(fp, "      - | "); // vaasara

			if (secondnakshatra =3D=3D 300) fprintf(fp, "       -     - | "); // nak=
shatra
			else
			{
				fprintf(fp, "%8s ", nakshatranaama[secondnakshatra % 27]);
				fprintf(fp, "%5s | ", bsecondnakshatra);
			}

			if (secondyoga =3D=3D 300) fprintf(fp, "       -     - | "); // yoga
			else
			{
				fprintf(fp, "%8s ", yoganaama[secondyoga % 27]);
				fprintf(fp, "%5s | ", bsecondyoga);
			}

			fprintf(fp, "      -     - "); // first karana

			if (thirdkarana =3D=3D 300) fprintf(fp, "      -     -"); // second kara=
na
			else
			{
				writekarananaama(thirdkarana % 60);
				fprintf(fp, "%5s", bthirdkarana); // two spaces just for consistency
			}
			fprintf(fp, "\n");
		}

		tithi =3D endtithi;
		nakshatra =3D endnakshatra;
		yoga =3D endyoga;
		karana =3D endkarana;
		prev_sunset =3D this_sunset;
	}
	fclose(fp);
}

--Boundary-01=_Q0eZEShaabeJQ5Q
Content-Type: text/plain;
  charset="us-ascii";
  name="valgrind-output"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="valgrind-output"

samjnaa@chandas:~/bin/swisseph/panchaanga> valgrind --tool=memcheck ./monthpan
==8908== Memcheck, a memory error detector.
==8908== Copyright (C) 2002-2005, and GNU GPL'd, by Julian Seward et al.
==8908== Using LibVEX rev 1575, a library for dynamic binary translation.
==8908== Copyright (C) 2004-2005, and GNU GPL'd, by OpenWorks LLP.
==8908== Using valgrind-3.1.1, a dynamic binary instrumentation framework.
==8908== Copyright (C) 2000-2005, and GNU GPL'd, by Julian Seward et al.
==8908== For more details, rerun with: -v
==8908==


  Electric Fence 2.2.0 Copyright (C) 1987-1999 Bruce Perens <bruce@perens.com>
Please provide the start and end Gregorian dates.
Years must be in the range 1800 to 2399 CCE ("AD"). Two-digit years are not accepted.
The timezone must be specified in terms of the UTC offset, positive east of Greenwich.

Please enter the start date.
Date as YYYY-MM-DD     : 2006-05-15
Please enter the end date.
Date as YYYY-MM-DD     : 2006-06-14
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A784: swi_cartpol_sp (swephlib.c:347)
==8908==    by 0x804E302: app_pos_rest (sweph.c:2375)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A78A: swi_cartpol_sp (swephlib.c:347)
==8908==    by 0x804E302: app_pos_rest (sweph.c:2375)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A79E: swi_cartpol_sp (swephlib.c:347)
==8908==    by 0x804E302: app_pos_rest (sweph.c:2375)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A7A0: swi_cartpol_sp (swephlib.c:347)
==8908==    by 0x804E302: app_pos_rest (sweph.c:2375)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A8C9: swi_cartpol_sp (swephlib.c:347)
==8908==    by 0x804E302: app_pos_rest (sweph.c:2375)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A7D3: swi_cartpol_sp (swephlib.c:354)
==8908==    by 0x804E302: app_pos_rest (sweph.c:2375)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A7D5: swi_cartpol_sp (swephlib.c:354)
==8908==    by 0x804E302: app_pos_rest (sweph.c:2375)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A7F8: swi_cartpol_sp (swephlib.c:355)
==8908==    by 0x804E302: app_pos_rest (sweph.c:2375)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A7FE: swi_cartpol_sp (swephlib.c:355)
==8908==    by 0x804E302: app_pos_rest (sweph.c:2375)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A784: swi_cartpol_sp (swephlib.c:347)
==8908==    by 0x804E311: app_pos_rest (sweph.c:2376)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A78A: swi_cartpol_sp (swephlib.c:347)
==8908==    by 0x804E311: app_pos_rest (sweph.c:2376)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A79E: swi_cartpol_sp (swephlib.c:347)
==8908==    by 0x804E311: app_pos_rest (sweph.c:2376)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A7A0: swi_cartpol_sp (swephlib.c:347)
==8908==    by 0x804E311: app_pos_rest (sweph.c:2376)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A8C9: swi_cartpol_sp (swephlib.c:347)
==8908==    by 0x804E311: app_pos_rest (sweph.c:2376)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A7D3: swi_cartpol_sp (swephlib.c:354)
==8908==    by 0x804E311: app_pos_rest (sweph.c:2376)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A7D5: swi_cartpol_sp (swephlib.c:354)
==8908==    by 0x804E311: app_pos_rest (sweph.c:2376)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A7F8: swi_cartpol_sp (swephlib.c:355)
==8908==    by 0x804E311: app_pos_rest (sweph.c:2376)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Conditional jump or move depends on uninitialised value(s)
==8908==    at 0x805A7FE: swi_cartpol_sp (swephlib.c:355)
==8908==    by 0x804E311: app_pos_rest (sweph.c:2376)
==8908==    by 0x8050B04: app_pos_etc_sun (sweph.c:3179)
==8908==    by 0x8051B11: main_planet (sweph.c:1259)
==8908==    by 0x8054D4B: swecalc (sweph.c:675)
==8908==    by 0x8056F56: swe_calc (sweph.c:288)
==8908==    by 0x806199D: swe_rise_trans (swecl.c:2905)
==8908==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==
==8908== Invalid read of size 1
==8908==    at 0x4021FB8: strlen (in /usr/lib/valgrind/x86-linux/vgpreload_memcheck.so)
==8908==    by 0x40A0807: vfprintf (in /lib/libc-2.4.so)
==8908==    by 0x40A5C92: printf (in /lib/libc-2.4.so)
==8908==    by 0x8049B71: listsplpanchaanga (monthpan.c:593)
==8908==    by 0x804AC97: main (monthpan.c:148)
==8908==  Address 0x726956 is not stack'd, malloc'd or (recently) free'd
==8908==
==8908== Process terminating with default action of signal 11 (SIGSEGV)
==8908==  Access not within mapped region at address 0x726956
==8908==    at 0x4021FB8: strlen (in /usr/lib/valgrind/x86-linux/vgpreload_memcheck.so)
==8908==    by 0x40A0807: vfprintf (in /lib/libc-2.4.so)
==8908==    by 0x40A5C92: printf (in /lib/libc-2.4.so)
==8908==    by 0x8049B71: listsplpanchaanga (monthpan.c:593)
==8908==    by 0x804AC97: main (monthpan.c:148)
grahanaama[0] = ==8908==
==8908== ERROR SUMMARY: 4419 errors from 19 contexts (suppressed: 3 from 1)
==8908== malloc/free: in use at exit: 0 bytes in 0 blocks.
==8908== malloc/free: 0 allocs, 0 frees, 0 bytes allocated.
==8908== For counts of detected errors, rerun with: -v
==8908== All heap blocks were freed -- no leaks are possible.
Segmentation fault
samjnaa@chandas:~/bin/swisseph/panchaanga> make
gcc -c -g -O2 -Wall monthpan.c
gcc -g -O2 -Wall -o monthpan monthpan.o -L. -lswe -lm -lefence
samjnaa@chandas:~/bin/swisseph/panchaanga> valgrind --tool=memcheck ./monthpan
==9160== Memcheck, a memory error detector.
==9160== Copyright (C) 2002-2005, and GNU GPL'd, by Julian Seward et al.
==9160== Using LibVEX rev 1575, a library for dynamic binary translation.
==9160== Copyright (C) 2004-2005, and GNU GPL'd, by OpenWorks LLP.
==9160== Using valgrind-3.1.1, a dynamic binary instrumentation framework.
==9160== Copyright (C) 2000-2005, and GNU GPL'd, by Julian Seward et al.
==9160== For more details, rerun with: -v
==9160==


  Electric Fence 2.2.0 Copyright (C) 1987-1999 Bruce Perens <bruce@perens.com>
Please provide the start and end Gregorian dates.
Years must be in the range 1800 to 2399 CCE ("AD"). Two-digit years are not accepted.
The timezone must be specified in terms of the UTC offset, positive east of Greenwich.

Please enter the start date.
Date as YYYY-MM-DD     : 2006-05-15
Please enter the end date.
Date as YYYY-MM-DD     : 2006-06-14
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A754: swi_cartpol_sp (swephlib.c:347)
==9160==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A75A: swi_cartpol_sp (swephlib.c:347)
==9160==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A76E: swi_cartpol_sp (swephlib.c:347)
==9160==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A770: swi_cartpol_sp (swephlib.c:347)
==9160==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A899: swi_cartpol_sp (swephlib.c:347)
==9160==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A7A3: swi_cartpol_sp (swephlib.c:354)
==9160==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A7A5: swi_cartpol_sp (swephlib.c:354)
==9160==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A7C8: swi_cartpol_sp (swephlib.c:355)
==9160==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A7CE: swi_cartpol_sp (swephlib.c:355)
==9160==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A754: swi_cartpol_sp (swephlib.c:347)
==9160==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A75A: swi_cartpol_sp (swephlib.c:347)
==9160==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A76E: swi_cartpol_sp (swephlib.c:347)
==9160==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A770: swi_cartpol_sp (swephlib.c:347)
==9160==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A899: swi_cartpol_sp (swephlib.c:347)
==9160==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A7A3: swi_cartpol_sp (swephlib.c:354)
==9160==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A7A5: swi_cartpol_sp (swephlib.c:354)
==9160==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A7C8: swi_cartpol_sp (swephlib.c:355)
==9160==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Conditional jump or move depends on uninitialised value(s)
==9160==    at 0x805A7CE: swi_cartpol_sp (swephlib.c:355)
==9160==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9160==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9160==    by 0x8051AE1: main_planet (sweph.c:1259)
==9160==    by 0x8054D1B: swecalc (sweph.c:675)
==9160==    by 0x8056F26: swe_calc (sweph.c:288)
==9160==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9160==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==
==9160== Invalid read of size 1
==9160==    at 0x4021FB8: strlen (in /usr/lib/valgrind/x86-linux/vgpreload_memcheck.so)
==9160==    by 0x40A0807: vfprintf (in /lib/libc-2.4.so)
==9160==    by 0x40A5C92: printf (in /lib/libc-2.4.so)
==9160==    by 0x8049B7D: listsplpanchaanga (monthpan.c:593)
==9160==    by 0x804AC67: main (monthpan.c:148)
==9160==  Address 0x726956 is not stack'd, malloc'd or (recently) free'd
==9160==
==9160== Process terminating with default action of signal 11 (SIGSEGV)
==9160==  Access not within mapped region at address 0x726956
==9160==    at 0x4021FB8: strlen (in /usr/lib/valgrind/x86-linux/vgpreload_memcheck.so)
==9160==    by 0x40A0807: vfprintf (in /lib/libc-2.4.so)
==9160==    by 0x40A5C92: printf (in /lib/libc-2.4.so)
==9160==    by 0x8049B7D: listsplpanchaanga (monthpan.c:593)
==9160==    by 0x804AC67: main (monthpan.c:148)
debug: vaasara = 1, graha =    Somadebug: vaasara = 2, graha = Mangaladebug: vaasara = 3, graha =   Budhadebug: vaasara = 4, graha =    Gurudebug: vaasara = 5, graha =  Shukradebug: vaasara = 6, graha =   Shanidebug: vaasara = 0, graha = ==9160==
==9160== ERROR SUMMARY: 22083 errors from 19 contexts (suppressed: 3 from 1)
==9160== malloc/free: in use at exit: 0 bytes in 0 blocks.
==9160== malloc/free: 0 allocs, 0 frees, 0 bytes allocated.
==9160== For counts of detected errors, rerun with: -v
==9160== All heap blocks were freed -- no leaks are possible.
Segmentation fault
samjnaa@chandas:~/bin/swisseph/panchaanga> make
gcc -c -g -O2 -Wall monthpan.c
gcc -g -O2 -Wall -o monthpan monthpan.o -L. -lswe -lm -lefence
samjnaa@chandas:~/bin/swisseph/panchaanga> valgrind --tool=memcheck ./monthpan > oput
==9579== Memcheck, a memory error detector.
==9579== Copyright (C) 2002-2005, and GNU GPL'd, by Julian Seward et al.
==9579== Using LibVEX rev 1575, a library for dynamic binary translation.
==9579== Copyright (C) 2004-2005, and GNU GPL'd, by OpenWorks LLP.
==9579== Using valgrind-3.1.1, a dynamic binary instrumentation framework.
==9579== Copyright (C) 2000-2005, and GNU GPL'd, by Julian Seward et al.
==9579== For more details, rerun with: -v
==9579==

  Electric Fence 2.2.0 Copyright (C) 1987-1999 Bruce Perens <bruce@perens.com>
==9579==
==9579== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 3 from 1)
==9579== malloc/free: in use at exit: 0 bytes in 0 blocks.
==9579== malloc/free: 0 allocs, 0 frees, 0 bytes allocated.
==9579== For counts of detected errors, rerun with: -v
==9579== All heap blocks were freed -- no leaks are possible.

samjnaa@chandas:~/bin/swisseph/panchaanga> valgrind --tool=memcheck ./monthpan
==9675== Memcheck, a memory error detector.
==9675== Copyright (C) 2002-2005, and GNU GPL'd, by Julian Seward et al.
==9675== Using LibVEX rev 1575, a library for dynamic binary translation.
==9675== Copyright (C) 2004-2005, and GNU GPL'd, by OpenWorks LLP.
==9675== Using valgrind-3.1.1, a dynamic binary instrumentation framework.
==9675== Copyright (C) 2000-2005, and GNU GPL'd, by Julian Seward et al.
==9675== For more details, rerun with: -v
==9675==


  Electric Fence 2.2.0 Copyright (C) 1987-1999 Bruce Perens <bruce@perens.com>
Please provide the start and end Gregorian dates.
Years must be in the range 1800 to 2399 CCE ("AD"). Two-digit years are not accepted.
The timezone must be specified in terms of the UTC offset, positive east of Greenwich.

Please enter the start date.
Date as YYYY-MM-DD     : 2006-05-15
Please enter the end date.
Date as YYYY-MM-DD     : 2006-06-14
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A754: swi_cartpol_sp (swephlib.c:347)
==9675==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A75A: swi_cartpol_sp (swephlib.c:347)
==9675==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A76E: swi_cartpol_sp (swephlib.c:347)
==9675==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A770: swi_cartpol_sp (swephlib.c:347)
==9675==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A899: swi_cartpol_sp (swephlib.c:347)
==9675==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A7A3: swi_cartpol_sp (swephlib.c:354)
==9675==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A7A5: swi_cartpol_sp (swephlib.c:354)
==9675==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A7C8: swi_cartpol_sp (swephlib.c:355)
==9675==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A7CE: swi_cartpol_sp (swephlib.c:355)
==9675==    by 0x804E2D2: app_pos_rest (sweph.c:2375)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A754: swi_cartpol_sp (swephlib.c:347)
==9675==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A75A: swi_cartpol_sp (swephlib.c:347)
==9675==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A76E: swi_cartpol_sp (swephlib.c:347)
==9675==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A770: swi_cartpol_sp (swephlib.c:347)
==9675==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A899: swi_cartpol_sp (swephlib.c:347)
==9675==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A7A3: swi_cartpol_sp (swephlib.c:354)
==9675==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A7A5: swi_cartpol_sp (swephlib.c:354)
==9675==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A7C8: swi_cartpol_sp (swephlib.c:355)
==9675==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==
==9675== Conditional jump or move depends on uninitialised value(s)
==9675==    at 0x805A7CE: swi_cartpol_sp (swephlib.c:355)
==9675==    by 0x804E2E1: app_pos_rest (sweph.c:2376)
==9675==    by 0x8050AD4: app_pos_etc_sun (sweph.c:3179)
==9675==    by 0x8051AE1: main_planet (sweph.c:1259)
==9675==    by 0x8054D1B: swecalc (sweph.c:675)
==9675==    by 0x8056F26: swe_calc (sweph.c:288)
==9675==    by 0x806196D: swe_rise_trans (swecl.c:2905)
==9675==    by 0x8049AD0: listsplpanchaanga (monthpan.c:512)
==9675==    by 0x804AC67: main (monthpan.c:148)
debug: vaasara = 1, graha =    Soma
debug: vaasara = 2, graha = Mangala
debug: vaasara = 3, graha =   Budha
debug: vaasara = 4, graha =    Guru
debug: vaasara = 5, graha =  Shukra
debug: vaasara = 6, graha =   Shani
==9675==
==9675== Invalid read of size 1
==9675==    at 0x4021FB8: strlen (in /usr/lib/valgrind/x86-linux/vgpreload_memcheck.so)
==9675==    by 0x40A0807: vfprintf (in /lib/libc-2.4.so)
==9675==    by 0x40A5C92: printf (in /lib/libc-2.4.so)
==9675==    by 0x8049B7D: listsplpanchaanga (monthpan.c:593)
==9675==    by 0x804AC67: main (monthpan.c:148)
==9675==  Address 0x726956 is not stack'd, malloc'd or (recently) free'd
==9675==
==9675== Process terminating with default action of signal 11 (SIGSEGV)
==9675==  Access not within mapped region at address 0x726956
==9675==    at 0x4021FB8: strlen (in /usr/lib/valgrind/x86-linux/vgpreload_memcheck.so)
==9675==    by 0x40A0807: vfprintf (in /lib/libc-2.4.so)
==9675==    by 0x40A5C92: printf (in /lib/libc-2.4.so)
==9675==    by 0x8049B7D: listsplpanchaanga (monthpan.c:593)
==9675==    by 0x804AC67: main (monthpan.c:148)
debug: vaasara = 0, graha = ==9675==
==9675== ERROR SUMMARY: 22083 errors from 19 contexts (suppressed: 3 from 1)
==9675== malloc/free: in use at exit: 0 bytes in 0 blocks.
==9675== malloc/free: 0 allocs, 0 frees, 0 bytes allocated.
==9675== For counts of detected errors, rerun with: -v
==9675== All heap blocks were freed -- no leaks are possible.
Segmentation fault
samjnaa@chandas:~/bin/swisseph/panchaanga>
--Boundary-01=_Q0eZEShaabeJQ5Q--

--nextPart1957553.c2zspLIgd5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEZe0XLOFFQi4zqy0RAoC+AKCfntwFIxJTksyIA0++59tHruhz0QCdEOrm
oTRpVloa+PpqtRjFWclz1xU=
=RgIT
-----END PGP SIGNATURE-----

--nextPart1957553.c2zspLIgd5--
