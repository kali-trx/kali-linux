echo
echo "////////////////////////////////////////////////"
echo "/                                              /"
echo "/      Metasploit Skript - Automatizacija      /"
echo "/                                              /"
echo "/                 Kali-TRX                     /"
echo "/                                              /"
echo "/           Verzija skripta 1.0.0              /"
echo "/                                              /"
echo "////////////////////////////////////////////////"
echo
source ./sys/metasploit/androrat.sh
echo
echo "Ovaj skript ce podesiti Metasploit za odredjene napade"
echo
echo "[1] Android napad"
echo "[2] Trenutno radi samo opcija 1"
read odgovor
if [ $odgovor = "1" ] ; then
   echo
   echo "[1] Automatsko podesavanje."
   echo "[2] Sam cu da podesim sve."
   read pitanje1
        if [ $pitanje1 = "1" ] ; then
           echo
           echo "[1] Napravi novu *.apk aplikaciju."
           echo "[2] Samo pokreni meterpreter, imam vec *.apk aplikaciju."
           echo "[x] Odustani"
           read andros
           if [ $andros = "1" ] ; then
            andro1
            andro2
           fi
           if [ $andros = "2" ] ; then
            andro2
           else
            echo "[i] napravi novu aplikaciju ili idi dalje bez nje, jedna od opcija mora da bude odabrana."
            echo "[i] Nema posla za mene, izlazim."
            ./sys/metasploit.sh
          fi
          if [ $andros = "x" ] ; then
             exit
         fi
       fi
        if [ $pitanje1 = "2" ] ; then
           echo "[i] Pokrecem msfconsolu."
           msfconsole
       fi
     fi
