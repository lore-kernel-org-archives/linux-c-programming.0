From: Sascha Retzki <lantis@iqranet.info>
Subject: blind programmer needs help
Date: Sat, 24 Jul 2004 20:07:09 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1090692429.1404.23.camel@linux.local>
Reply-To: lantis@iqranet.info
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi folks,


the following code is supposed to output a *nice*-sounding
synthesizer-thingy ... . The code in the for()-loop in main() is code
from a programmer of a synthesizer, I tried to make it work. After month
(!), I still don't see why my tries don't output it correctly. As you
will see, I tried both alsa and oss ( to avoid driver-layer errors ).
You must decide which API to use and comment the stuff out, I #error'ed
it mostly, mind that, sry. Btw, make fd == stdin, pipe it to a file and
load it via soundtracker ( as 16 bit mono raw audio , as it should be )
results in the correct signal. I wonder why the wrong is given out to
the device.

[code]#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
// Use that with OSS:
#include <linux/soundcard.h>
#error EDIT ME !!
// or that with ALSA
        #define ALSA_PCM_NEW_HW_PARAMS_API
        #define ALSA_PCM_NEW_SW_PARAMS_API
#include <alsa/asoundlib.h>
// normal C included + math.h ( remember to pass "-lm" to gcc )
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
// how long our synth plays
#define MAX 99999

// modulglobal vars related to the "knobs" of the synth
int
        time = 0,
        amp = 512,
        modulation = 1400,
        mod2 = 230,
        osc = 540,
        osc2 = 440;

int fd;
int oss(void);
int alsa(void);
float a=0.0;
float f(float x){
            return(sin(x+a*sin(x))+sin(2*x));
};
int main(void) {
            int i;float y,t;short int out;
        unsigned int output[MAX];
#error EDIT ME: alsa() or oss() ?
        if(alsa() != 0) {
                printf("There was an error during soundcard setup!\n");
                return 1;
        }
        for (i = 0; i <=1000000; i++)
        {
        t=i/44100.0*6.283*440.0;
                a=i/88200.0;
                       
y=f(t)+f(t*1.003+1.0)+f(t*0.9975+1.5)+f(t*0.9921-3.7)+f(t*1.0073+2.5);
                                out=(int)
(y*2000.0*(i<1000.0?i/1000.0:1.0));

        write(fd,&out,2); // this is imho the root of all evil. 

        }
        printf("output\n");
        close(fd);
return 0;
}
#error EdIT ME: comment this function out if the alsalibs are not
installed ( libasound )
int alsa(void) {
        snd_pcm_t *ls_handle;
        snd_pcm_hw_params_t *hwparams;
        snd_pcm_hw_params_alloca(&hwparams); // find out if we can check
this or if it makes sense :)
        int dir,exact_rate, sample_rate = 44100;
        if(snd_pcm_open(&ls_handle, "hw:0", SND_PCM_STREAM_PLAYBACK,0) <
0) {
                printf("synth(): audio_alsa(): can't open  !\n");
                exit (1); // FIXME
        }
        if(snd_pcm_hw_params_any(ls_handle, hwparams) < 0) {
                printf("synth(): audio_alsa(): Can not configure PCM
device !\n");
                exit (2); // FIXME
        }
        // TODO: sample format ...
        if(snd_pcm_hw_params_set_format(ls_handle, hwparams,
SND_PCM_FORMAT_S16_LE) < 0) {
                printf("synth(): audio_alsa(): Error setting
format.\n");
                exit (3); // FIXME
        }
        if(snd_pcm_hw_params_set_rate_near(ls_handle, hwparams,
&sample_rate, &dir) < 0) {
                printf("synth(): audio_alsa(): Error setting sample
rate.\n");
                exit (4); // FIXME
        }
        if (snd_pcm_hw_params_set_channels(ls_handle, hwparams, 2) < 0)
{
                printf("synth(): audio_alsa(): Error setting
channels.\n");
                exit (4); // FIXME
        }
        if (snd_pcm_hw_params(ls_handle, hwparams) < 0) {
                printf("synth(): audio_alsa(): Error setting HW
params.\n");
                exit (5); // FIXME
        }
        printf("sound init\n");
        return 0;
}
int oss(void) {
        int handle_format, handle_samplerate = 44100;
        if((fd = open("/dev/dsp",O_WRONLY |  O_APPEND | O_NONBLOCK )) ==
-1)
        {
                printf("can't open sounddevice!\n");
                return 1;
        }
        if(ioctl(fd,SNDCTL_DSP_GETFMTS,&handle_format) == -1) {
                printf("Error getting format code of soundcard.\n");
                return 1;
        }
// this is old code, supposed to be this way via the 4front tech, inc 
// OSS-specification paper.pdf .
/*
        if(handle_format&AFMT_U8)
                handle_format = AFMT_U8;
        else if(handle_format&AFMT_MU_LAW)
                handle_format = AFMT_MU_LAW;
        else if(handle_format&AFMT_A_LAW)
                handle_format = AFMT_A_LAW;
        else if(handle_format&AFMT_IMA_ADPCM)
                handle_format = AFMT_IMA_ADPCM;
        else if(handle_format&AFMT_S16_LE)
                handle_format = AFMT_S16_LE;
        else if(handle_format&AFMT_S16_BE)
                handle_format = AFMT_S16_BE;
        else if(handle_format&AFMT_S8)
                handle_format = AFMT_S8;
           else if(handle_format&AFMT_S32_LE)
                handle_format = AFMT_S32_LE;
        else if(handle_format&AFMT_S32_BE)
                handle_format = AFMT_S32_BE;
                else if(handle_format&AFMT_U16_LE)
                handle_format = AFMT_U16_LE;
        else if(handle_format&AFMT_U16_BE)
                handle_format = AFMT_U16_BE;
        else {
                printf("Error associating unknown format code.\n");
                return 1;
        }
        */
        handle_format = AFMT_S16_LE;
        if(ioctl(fd,SNDCTL_DSP_SETFMT,&handle_format) == -1) {
                printf("Error setting format code \n"); // TODO
                return 1;
        }
        if(ioctl(fd,SNDCTL_DSP_CHANNELS,2) == -1)
                printf("Can't switch to stereo.\n");
                // This is NOT a real problem ;)
        if(ioctl(fd,SNDCTL_DSP_SPEED,&handle_samplerate) == -1) {
                printf("Can't set sample-rate to
%d.\n",handle_samplerate);
                return 1;
        }
        return 0;
}
// EOF

[/code]

I appreciate any help,


Sascha Retzki

