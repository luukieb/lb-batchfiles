@echo off
:: - - - - ::
:: batch file to download timestamped filenames from an ftp source using cURL ::
:: cURL is available for download from http://curl.haxx.se
:: - - - - ::
::
:: Format the date in YYYYMMDD for use as unique filename ::
::
for /f "tokens=1-3 delims=/- " %%a in ('date /t') do set xd=%%c%%b%%a
::
:: Append the file extension to the filename ::
set "s2=.log"
set "s3=%xd%%s2%"
::
:: Create a filename string for cURL to use as a download destination ::
::
set "s4=c:\localfolder\subfolder\%s3%"
::
:: Create an FTP address for cURL to use as a download source ::
:: This is the full ftp path to the file(s) ::
::
set "s5=ftp://host.domain.net/%s3%"
::
:: Use cURL to get todays file, note this is for Active Mode FTP
curl -u username:password -P - -o %s4% %s5%
::
