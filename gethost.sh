#!/bin/bash

function getip(){
    echo `curl --max-time 5 --retry 10 -s https://ip.tool.chinaz.com/$1  | grep AiWenIpData | awk -F\> '{print $2}' | awk -F\< '{print $1}'`
}

function ipw(){
    w=$1
    result=`getip $w | awk '{print $1}' | sed "s/$/& $w/g"`
    echo "$result"
#    echo "$result $1"
#    result=`getip $w | awk ${print $1 $w}"`
}

file="/var/www/html/index.html"
rm -rf $file
touch $file

ipw gitlab.com >> $file
ipw secure.gravatar.com  >> $file
ipw new-sentry.gitlab.net  >> $file

ipw github.githubassets.com                                            >> $file
ipw central.github.com                                                 >> $file
ipw desktop.githubusercontent.com                                      >> $file
ipw assets-cdn.github.com                                              >> $file
ipw camo.githubusercontent.com                                         >> $file
ipw github.map.fastly.net                                              >> $file
ipw github.io                                                          >> $file
ipw github.com                                                         >> $file
ipw api.github.com                                                     >> $file
ipw raw.githubusercontent.com                                          >> $file
ipw user-images.githubusercontent.com                                  >> $file
ipw favicons.githubusercontent.com                                     >> $file
ipw avatars5.githubusercontent.com                                     >> $file
ipw avatars4.githubusercontent.com                                     >> $file
ipw avatars3.githubusercontent.com                                     >> $file
ipw avatars2.githubusercontent.com                                     >> $file
ipw avatars1.githubusercontent.com                                     >> $file
ipw avatars0.githubusercontent.com                                     >> $file
ipw avatars.githubusercontent.com                                      >> $file
ipw codeload.github.com                                                >> $file
ipw github-cloud.s3.amazonaws.com                                      >> $file
ipw github-com.s3.amazonaws.com                                        >> $file
ipw github-production-release-asset-2e65be.s3.amazonaws.com            >> $file
ipw github-production-user-asset-6210df.s3.amazonaws.com               >> $file
ipw github-production-repository-file-5c1aeb.s3.amazonaws.com          >> $file
ipw githubstatus.com                                                   >> $file
ipw github.community                                                   >> $file
ipw media.githubusercontent.com                                        >> $file
ipw objects.githubusercontent.com                                      >> $file
ipw raw.github.com                                                     >> $file



