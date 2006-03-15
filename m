From: "Joel M. Pareja" <jpareja@infoweapons.com>
Subject: Re: Significance of using + before function calls.
Date: Wed, 15 Mar 2006 16:16:59 +0800
Message-ID: <4417CD7B.4050909@infoweapons.com>
References: <44180FBC.50703@wipro.com> <4417C957.7000205@infoweapons.com> <44181931.8000507@wipro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms080409050502090107030102"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <44181931.8000507@wipro.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms080409050502090107030102
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

That must be a typographical error.

Because '+' does nothing to the return value of the function.
Also because there is no lvalue in the expression.

But with '-', there is an effect.


int dummy_func() { return 5; }

int num = -dummy_func();


As a result, num will be '-5'.

Vamsi wrote:
> 
> Joel M. Pareja wrote:
> 
>> The placement of '+' or '-' before the function call is performing a
>> unary operator on the return value of the function.
> 
> does it server any purpose ? , unary '+'  operator will not have any 
> significance effect on the return value
> 
> -Vamsi
> 
>>
>> Vamsi wrote:
>>
>>> Hi List,
>>>
>>> i have seen a code snippet which starts with + symbol,
>>>
>>> +system("ls -l");
>>>
>>> what is the significance of using + symbol before system.
>>>
>>> i also tried using + before printf ,, like +printf("Some text"); and 
>>> it is compiling and working tooo,,
>>>
>>> Can somebody clarify wht does that + signify??
>>>
>>> Thank You.
>>>
>>> -Vamsi
>>>
>>> -
>>> To unsubscribe from this list: send the line "unsubscribe 
>>> linux-c-programming" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--------------ms080409050502090107030102
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIHuDCC
A9gwggNBoAMCAQICDkBMAAEAAog91pPBF5XZMA0GCSqGSIb3DQEBBAUAMIG8MQswCQYDVQQG
EwJERTEQMA4GA1UECBMHSGFtYnVyZzEQMA4GA1UEBxMHSGFtYnVyZzE6MDgGA1UEChMxVEMg
VHJ1c3RDZW50ZXIgZm9yIFNlY3VyaXR5IGluIERhdGEgTmV0d29ya3MgR21iSDEiMCAGA1UE
CxMZVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBDQTEpMCcGCSqGSIb3DQEJARYaY2VydGlmaWNh
dGVAdHJ1c3RjZW50ZXIuZGUwHhcNMDYwMTEzMDIyNzMxWhcNMDcwMTEzMDIyNzMxWjBLMQsw
CQYDVQQGEwJQSDEUMBIGA1UEAxMLSm9lbCBQYXJlamExJjAkBgkqhkiG9w0BCQEWF2pwYXJl
amFAaW5mb3dlYXBvbnMuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyoj9
nEjpVy+bLoQSfviU4mhi6GZafIbeCCLlhwHDyW0vSLssGeyLwVyHjgTF4akVdq7pNdSCRjoX
z9ChJyc8c/KYIvKKhSimd/FKT4U0IMOPANSYhunTesLPzwq4D/dSo+WgnWX0LMuc3BNfnloe
sPHM+LaZMDhdQ7xv9o4yVJ+pHrJgYY1BYKcTWIg6oOPoxo5ehx9+ngkO0xIA0e5Of1ibtEwh
HuKlfuW0s1/6pY8awJoIgrpIo+PStiHXbSS3iZppM96S3NOe8E3b7JD+TRKiWpih4I704mfO
Hc6YrFo5dr2+CJZ5mKT6PeoDKx6U/72tpspvr20tkpO5wcggSQIDAQABo4HIMIHFMAwGA1Ud
EwEB/wQCMAAwDgYDVR0PAQH/BAQDAgXgMDMGCWCGSAGG+EIBCAQmFiRodHRwOi8vd3d3LnRy
dXN0Y2VudGVyLmRlL2d1aWRlbGluZXMwEQYJYIZIAYb4QgEBBAQDAgWgMF0GCWCGSAGG+EIB
AwRQFk5odHRwczovL3d3dy50cnVzdGNlbnRlci5kZS9jZ2ktYmluL2NoZWNrLXJldi5jZ2kv
NDA0QzAwMDEwMDAyODgzREQ2OTNDMTE3OTVEOT8wDQYJKoZIhvcNAQEEBQADgYEArqQDreoY
hLtBpckzmv/PrwLbckYU6NLv8MniC1XgW/wOmicE0ynLkvX/LmIPWusQ0rpukWQrcX84Ic/d
hzrDGXnZzHdbWCYsHDn6OR/GJEyu2jISoHLGt28JucvB+30+RVsYgdHj0eYMNFItysfkObEy
7r9/mvbVzJBhY88yGYcwggPYMIIDQaADAgECAg5ATAABAAKIPdaTwReV2TANBgkqhkiG9w0B
AQQFADCBvDELMAkGA1UEBhMCREUxEDAOBgNVBAgTB0hhbWJ1cmcxEDAOBgNVBAcTB0hhbWJ1
cmcxOjA4BgNVBAoTMVRDIFRydXN0Q2VudGVyIGZvciBTZWN1cml0eSBpbiBEYXRhIE5ldHdv
cmtzIEdtYkgxIjAgBgNVBAsTGVRDIFRydXN0Q2VudGVyIENsYXNzIDEgQ0ExKTAnBgkqhkiG
9w0BCQEWGmNlcnRpZmljYXRlQHRydXN0Y2VudGVyLmRlMB4XDTA2MDExMzAyMjczMVoXDTA3
MDExMzAyMjczMVowSzELMAkGA1UEBhMCUEgxFDASBgNVBAMTC0pvZWwgUGFyZWphMSYwJAYJ
KoZIhvcNAQkBFhdqcGFyZWphQGluZm93ZWFwb25zLmNvbTCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMqI/ZxI6Vcvmy6EEn74lOJoYuhmWnyG3ggi5YcBw8ltL0i7LBnsi8Fc
h44ExeGpFXau6TXUgkY6F8/QoScnPHPymCLyioUopnfxSk+FNCDDjwDUmIbp03rCz88KuA/3
UqPloJ1l9CzLnNwTX55aHrDxzPi2mTA4XUO8b/aOMlSfqR6yYGGNQWCnE1iIOqDj6MaOXocf
fp4JDtMSANHuTn9Ym7RMIR7ipX7ltLNf+qWPGsCaCIK6SKPj0rYh120kt4maaTPektzTnvBN
2+yQ/k0SolqYoeCO9OJnzh3OmKxaOXa9vgiWeZik+j3qAyselP+9rabKb69tLZKTucHIIEkC
AwEAAaOByDCBxTAMBgNVHRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIF4DAzBglghkgBhvhCAQgE
JhYkaHR0cDovL3d3dy50cnVzdGNlbnRlci5kZS9ndWlkZWxpbmVzMBEGCWCGSAGG+EIBAQQE
AwIFoDBdBglghkgBhvhCAQMEUBZOaHR0cHM6Ly93d3cudHJ1c3RjZW50ZXIuZGUvY2dpLWJp
bi9jaGVjay1yZXYuY2dpLzQwNEMwMDAxMDAwMjg4M0RENjkzQzExNzk1RDk/MA0GCSqGSIb3
DQEBBAUAA4GBAK6kA63qGIS7QaXJM5r/z68C23JGFOjS7/DJ4gtV4Fv8DponBNMpy5L1/y5i
D1rrENK6bpFkK3F/OCHP3Yc6wxl52cx3W1gmLBw5+jkfxiRMrtoyEqByxrdvCbnLwft9PkVb
GIHR49HmDDRSLcrH5DmxMu6/f5r21cyQYWPPMhmHMYIEdDCCBHACAQEwgc8wgbwxCzAJBgNV
BAYTAkRFMRAwDgYDVQQIEwdIYW1idXJnMRAwDgYDVQQHEwdIYW1idXJnMTowOAYDVQQKEzFU
QyBUcnVzdENlbnRlciBmb3IgU2VjdXJpdHkgaW4gRGF0YSBOZXR3b3JrcyBHbWJIMSIwIAYD
VQQLExlUQyBUcnVzdENlbnRlciBDbGFzcyAxIENBMSkwJwYJKoZIhvcNAQkBFhpjZXJ0aWZp
Y2F0ZUB0cnVzdGNlbnRlci5kZQIOQEwAAQACiD3Wk8EXldkwCQYFKw4DAhoFAKCCAnkwGAYJ
KoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDYwMzE1MDgxNjU5WjAj
BgkqhkiG9w0BCQQxFgQU/sZsxaEfWvS64gpV+o0YZPzUq0MwUgYJKoZIhvcNAQkPMUUwQzAK
BggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYI
KoZIhvcNAwICASgwgeAGCSsGAQQBgjcQBDGB0jCBzzCBvDELMAkGA1UEBhMCREUxEDAOBgNV
BAgTB0hhbWJ1cmcxEDAOBgNVBAcTB0hhbWJ1cmcxOjA4BgNVBAoTMVRDIFRydXN0Q2VudGVy
IGZvciBTZWN1cml0eSBpbiBEYXRhIE5ldHdvcmtzIEdtYkgxIjAgBgNVBAsTGVRDIFRydXN0
Q2VudGVyIENsYXNzIDEgQ0ExKTAnBgkqhkiG9w0BCQEWGmNlcnRpZmljYXRlQHRydXN0Y2Vu
dGVyLmRlAg5ATAABAAKIPdaTwReV2TCB4gYLKoZIhvcNAQkQAgsxgdKggc8wgbwxCzAJBgNV
BAYTAkRFMRAwDgYDVQQIEwdIYW1idXJnMRAwDgYDVQQHEwdIYW1idXJnMTowOAYDVQQKEzFU
QyBUcnVzdENlbnRlciBmb3IgU2VjdXJpdHkgaW4gRGF0YSBOZXR3b3JrcyBHbWJIMSIwIAYD
VQQLExlUQyBUcnVzdENlbnRlciBDbGFzcyAxIENBMSkwJwYJKoZIhvcNAQkBFhpjZXJ0aWZp
Y2F0ZUB0cnVzdGNlbnRlci5kZQIOQEwAAQACiD3Wk8EXldkwDQYJKoZIhvcNAQEBBQAEggEA
W9DTFVy/vMggd55VsglXpJ9fg5t35YlqS7h4ugS3hyBD3R4zwUEV3HWFRme1XkRDNeys8CnS
9J7gthkAGPNXei2rrif810TYzMVLGWFlLQOeA+Rfb29b7rnOfx4MXWLygJ7sXh94A+mQwPsH
szSolDLpM13zXYVoxtfBuumD+ZGxOcijlz34Zdy4dqT001J7RK9SRz60AH7f5p0Vtj7m/ddZ
30ySxlYArxNJIfN1qTozSF8Snjv2YfEuW0xsBahL5ue63voClE5IccJqdzrft6ZPAoZ7i3vf
zixlVrgThRDn8knElDOsBj9dYegm19YoCjfpb45tilFh83U1XQ+WigAAAAAAAA==
--------------ms080409050502090107030102--
