echo
echo "////////////////////////////////////////////////"
echo "/                                              /"
echo "/               Start Skript                   /"
echo "/                                              /"
echo "/                 Kali-TRX                     /"
echo "/                                              /"
echo "/           Verzija skripta 1.0.0              /"
echo "/                                              /"
echo "////////////////////////////////////////////////"
echo
echo "Koji program da pokrenem?"
echo 
echo "[0] Podesavanje Skripta"
echo "[1] MAC - Mjenja MAC adresu mrezne kartice."
echo "[2] Reaver - Hakuje WPA2 WiFi mreze."
echo "[3] SslStrip - Usmjerava https protokol na http protokol. Ne radi na svim Explorerima!"
echo "[4] Metasploit Skript - Automatizacija"
echo "[x] Izlaz"
read pitanje
if [ $pitanje = "0" ] ; then
         echo "[0] Podesavanje skripta..."
         ./sys/sys.sh
         echo "[i] Uspjesno pokrenut skript..."
       fi
if [ $pitanje = "1" ] ; then
         echo "[1] Mjenjam MAC adresu..."
         ./sys/mac.sh
         echo "[i] Uspjesno pokrenut skript..."
       fi
if [ $pitanje = "2" ] ; then
         echo "[2] Pokrecem reaver..."
	./sys/reaver.sh
         echo "[i] reaver je uspjesno pokrenut."
      fi
if [ $pitanje = "3" ] ; then 
        echo "[3] Pokrecem sslstrip..."
	./sys/sslstrip.sh
        echo "[i] sslstrip je uspjesno pokrenut."
      fi
if [ $pitanje = "4" ] ; then 
        echo "[4] Pokrecem metasploit..."
        echo "[i] metasploit je uspjesno pokrenut."
       ./sys/metasploit.sh
      fi
if [ $pitanje = "x" ] ; then
    echo "[+] Hvala na koriscenju skripta, VOZDRA..."
    echo "[x] Izlaz..."
  exit
    else 
       echo "[i] Opcija nije ispravna, odaberi ispravnu opciju. Izlazim..."
       ./start.sh
   fi
echo





