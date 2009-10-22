From: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Subject: Re: code to list contents of zip files
Date: Thu, 22 Oct 2009 17:58:00 +0530
Message-ID: <4AE04FD0.9080603@sun.com>
References: <4ADDADEE.1060806@sun.com>
 <19165.47003.922855.202636@cerise.gclements.plus.com>
 <4ADEFDE3.9000303@sun.com>
 <19167.22609.946075.575192@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_DVHQAp4Tpj3BwuaCDV2KCg)"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <19167.22609.946075.575192@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org, aluink@gmail.com

This is a multi-part message in MIME format.

--Boundary_(ID_DVHQAp4Tpj3BwuaCDV2KCg)
Content-type: text/plain; CHARSET=US-ASCII; format=flowed
Content-transfer-encoding: 7BIT

Thanks Glynn.
I tried to rectify the flaw and now I am getting the whole file contents 
from the zip file, ie., it is outputting the contents of the file stored 
in the zipfile.
But Actually, I wanted only to list the content of the zip file as 
zipinfo does.

Regards
Prasanta
Glynn Clements wrote:
> Prasanta Sadhukhan wrote:
>
>   
>> I have tried to create a ziptest code with the information found but 
>> when I tried to inflate the contents by calling inflate() [line68], I am 
>> getting Z_DATA_ERROR citing  input data is corrupted or not conforming 
>> to zlib format but I can do zipinfo or unzip on the attached ziptest.zip 
>> file successfully (and also the zip header is found to be valid by the 
>> header validity check done in the program)
>> Can anyone point me as to what should I being more to get rid of this 
>> problem?
>>     
>
> I've found 3 flaws:
>
> 1. You're not skipping over the variable-length fields (file name and
> extra field) at the end of the header; add:
>
> 	fseek(file, SH(&h[LOCFIL]), SEEK_CUR);
> 	fseek(file, SH(&h[LOCEXT]), SEEK_CUR);
>
> after reading the header but before calling inf().
>
> 2. You're trying to inflate() everything up to end-of-file, when you
> should be using the compressed length from the header (LOCSIZ) to
> determine how much compressed data is available (even with only one
> file, the central directory occurs at the end of the file).
>
> 3. This one wasn't obvious until I looked at the unzip source code. 
> You need to call inflateInit2(&strm, -15) rather than inflateInit(),
> in order to have it process "raw" data. zlib.h says:
>
>      windowBits can also be -8..-15 for raw inflate. In this case, -windowBits
>    determines the window size. inflate() will then process raw deflate data,
>    not looking for a zlib or gzip header, not generating a check value, and not
>    looking for any check values for comparison at the end of the stream. This
>    is for use with other formats that use the deflate compressed data format
>    such as zip. ...
>
> IOW, inflateInit() expects the data to be "wrapped" with a zlib or
> gzip header and trailer, but ZIP files don't have these.
>
> After fixing the above issues, I get C source code on stdout.
>
>   


--Boundary_(ID_DVHQAp4Tpj3BwuaCDV2KCg)
Content-type: text/plain; name=ziptest.c
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=ziptest.c

#include <stdio.h>
#include <string.h>
#include <malloc.h>
#include <zlib.h>
#include <errno.h>
#include <assert.h>

#define CHUNK 16384

/* PKZIP header definitions */
#define ZIPMAG 0x4b50           /* two-byte zip lead-in */
#define LOCREM 0x0403           /* remaining two bytes in zip signature */
#define LOCSIG 0x04034b50L      /* full signature */
#define LOCFLG 4                /* offset of bit flag */
#define  CRPFLG 1               /*  bit for encrypted entry */
#define  EXTFLG 8               /*  bit for extended local header */
#define LOCHOW 6                /* offset of compression method */
#define LOCTIM 8                /* file mod time (for decryption) */
#define LOCCRC 12               /* offset of crc */
#define LOCSIZ 16               /* offset of compressed size */
#define LOCLEN 20               /* offset of uncompressed length */
#define LOCFIL 24               /* offset of file name field length */
#define LOCEXT 26               /* offset of extra field length */
#define LOCHDR 28               /* size of local header, including LOCREM */
#define EXTHDR 16               /* size of extended local header, inc sig */

#define SH(p) ((unsigned short)(unsigned char)((p)[0]) | ((unsigned short)(unsigned char)((p)[1]) << 8))

int inf(FILE *source, FILE *dest)
{
    int ret;
    unsigned have;
    z_stream strm;
    unsigned char in[CHUNK];
    unsigned char out[CHUNK];
	unsigned char dict;

    /* allocate inflate state */
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;
    strm.avail_in = 0;
    strm.next_in = Z_NULL;
    ret = inflateInit2(&strm, -15);
    if (ret != Z_OK) {
		printf("inflateInit failed\n");
        return ret;
	}

		printf("inflateInit succeeded\n");
    /* decompress until deflate stream ends or end of file */
    do {
        strm.avail_in = fread(in, 1, CHUNK, source);
        if (ferror(source)) {
			printf("fread failed\n");
            (void)inflateEnd(&strm);
            return Z_ERRNO;
        }
		printf("fread succeeded\n");
        if (strm.avail_in == 0)
            break;
        strm.next_in = in;

        /* run inflate() on input until output buffer not full */
        do {
            strm.avail_out = CHUNK;
            strm.next_out = out;
            ret = inflate(&strm, Z_NO_FLUSH);
            assert(ret != Z_STREAM_ERROR);  /* state not clobbered */
            switch (ret) {
            case Z_NEED_DICT:
		printf("inflate returned Z_NEED_DICT\n");
                ret = Z_DATA_ERROR;     /* and fall through */
            case Z_DATA_ERROR:
		printf("inflate returned Z_DATA_ERROR\n");
            case Z_MEM_ERROR:
		printf("inflate returned Z_MEM_ERROR\n");
                (void)inflateEnd(&strm);
                return ret;
            }
		printf("inflate succeeded\n");
            have = CHUNK - strm.avail_out;
            if (fwrite(out, 1, have, dest) != have || ferror(dest)) {
		printf("fwrite failed\n");
                (void)inflateEnd(&strm);
                return Z_ERRNO;
            }
        } while (strm.avail_out == 0);

        /* done when inflate() says it's done */
    } while (ret != Z_STREAM_END);

    /* clean up and return */
    (void)inflateEnd(&strm);
    return ret == Z_STREAM_END ? Z_OK : Z_DATA_ERROR;
}

/* report a zlib or i/o error */
void zerr(int ret)
{
    fputs("ziptest: ", stderr);
    switch (ret) {
    case Z_ERRNO:
        if (ferror(stdin))
            fputs("error reading stdin\n", stderr);
        if (ferror(stdout))
            fputs("error writing stdout\n", stderr);
        break;
    case Z_STREAM_ERROR:
        fputs("invalid compression level\n", stderr);
        break;
    case Z_DATA_ERROR:
        fputs("invalid or incomplete deflate data\n", stderr);
        break;
    case Z_MEM_ERROR:
        fputs("out of memory\n", stderr);
        break;
    case Z_VERSION_ERROR:
        fputs("zlib version mismatch!\n", stderr);
    }
}

int main(char *argc, char **argv)
{
	char str[] = "./ziptest.zip";
	char *substr = strcasestr(str, ".zip");
	char *loc;
	int errnum;
	unsigned short n;
	unsigned char h[LOCHDR];
	int ret;

	if (substr == NULL) {
		printf("zip not found\n");
		substr = strcasestr(substr, ".jar");
		if (substr == NULL) 
			printf("jar not found\n");
		else
			printf("jar found at location: %s\n",substr);
		return;
	}
	else
		printf("zip found at location: %s\n",substr);
	loc = (char*)malloc(substr-str+4);
	strncpy(loc, str, substr-str+4);
	printf("zip path = %s\n",loc);
	errno = 0;
	FILE* file = fopen(loc, "r");
	if (file == (FILE*)NULL)
		printf("cannot open zipfile. errno %d\n",errno);
	else 
		printf("file %p\n", file);

	n = getc(file);
	n |= getc(file) << 8;
	printf("getc returns n = 0x%x, errno %d\n", n, errno);
	if (n == ZIPMAG)
	{
		if (fread((char *)h, 1, LOCHDR, file) != LOCHDR || SH(h) != LOCREM) {
			printf("invalid zipfile");
		}
	} else
		printf("input not a zip file\n");

	fseek(file, SH(&h[LOCFIL]), SEEK_CUR);
	fseek(file, SH(&h[LOCEXT]), SEEK_CUR);
	ret = inf(file, stdout);
	if (ret != Z_OK)
		zerr(ret);
}

--Boundary_(ID_DVHQAp4Tpj3BwuaCDV2KCg)--
