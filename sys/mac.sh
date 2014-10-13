echo
echo "////////////////////////////////////////////////"
echo "/                                              /"
echo "/               MAC - Promjena                 /"
echo "/                                              /"
echo "/                 Kali-TRX                     /"
echo "/                                              /"
echo "/           Verzija skripta 1.0.0              /"
echo "/                                              /"
echo "////////////////////////////////////////////////"
echo
echo "[!] Prije svega provjeriti dali se Mrezna kartica nalazi u monitor modu."
echo
echo "[!] Izaci iz monitor moda"
echo
echo "Dali se mrezna nalazi u monitor modu?"
echo
echo "[d] = Dalje, [p] = provjeri, [x] = Izlaz"
echo
read odgovor
        if [ $odgovor = "p" ] ; then
           airmon-ng
         fi
	if [ $odgovor = "d" ] ; then
	   ifconfig wlan0 down
           ifconfig wlan0 down
           echo "Upisi novu MAC adresu ( - 00:0f:3f:15:08:f0 - )"
           read mac
           ifconfig wlan0 hw ether $mac
           ifconfig wlan0 up
           echo "Provjeri MAC adresu"
           echo "[p] = Provjeri, [x] = Izlaz"
           read informacija
             if [ $informacija = "p" ] ; then
             ifconfig
           fi
          fi
        if [ $informacija $odgovor = "x" ] ; then
 	   exit
         fi
