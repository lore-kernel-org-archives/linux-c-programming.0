From: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Subject: Re: code to list contents of zip files
Date: Wed, 21 Oct 2009 17:56:11 +0530
Message-ID: <4ADEFDE3.9000303@sun.com>
References: <4ADDADEE.1060806@sun.com>
 <19165.47003.922855.202636@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_xh93K8YfuNCXRqKBNxh1NA)"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <19165.47003.922855.202636@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org, aluink@gmail.com

This is a multi-part message in MIME format.

--Boundary_(ID_xh93K8YfuNCXRqKBNxh1NA)
Content-type: text/plain; CHARSET=US-ASCII; format=flowed
Content-transfer-encoding: 7BIT

Thanks for the information.
I have tried to create a ziptest code with the information found but 
when I tried to inflate the contents by calling inflate() [line68], I am 
getting Z_DATA_ERROR citing  input data is corrupted or not conforming 
to zlib format but I can do zipinfo or unzip on the attached ziptest.zip 
file successfully (and also the zip header is found to be valid by the 
header validity check done in the program)
Can anyone point me as to what should I being more to get rid of this 
problem?

Thanks in advance
Prasanta
Glynn Clements wrote:
> Prasanta Sadhukhan wrote:
>
>   
>> Can anyone point me as to how to list the contents of zip file using ANSI c?
>> Any pointers will be appreciated
>>     
>
> Look at the source code for Unzip:
>
> 	http://sourceforge.net/projects/infozip/files/
>
>   


--Boundary_(ID_xh93K8YfuNCXRqKBNxh1NA)
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
    ret = inflateInit(&strm);
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
			printf("inflate returned errcode %d\n",ret);	
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
	printf("inf ret %d\n", ret);
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

	ret = inf(file, stdout);
	if (ret != Z_OK)
		zerr(ret);
}

--Boundary_(ID_xh93K8YfuNCXRqKBNxh1NA)
Content-type: application/x-zip-compressed; name=ziptest.zip
Content-transfer-encoding: BASE64
Content-disposition: inline; filename=ziptest.zip

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

--Boundary_(ID_xh93K8YfuNCXRqKBNxh1NA)--
