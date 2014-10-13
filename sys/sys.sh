echo "===================="
echo "Podesavanje skripta."
echo "===================="
echo
echo "[1] Provjeravam dali je SPF instaliran."
echo
if [ -f ./sys/add/spf/Smartphone-Pentest-Framework/frameworkconsole/framework.py ]; then
   echo "spf je instaliran"
   echo
    else 
      echo "spf nije instaliran. Zelis li ga instalirat [d], [n]"
        read odgovor
          if [ $odgovor = "d" ] ; then
             cd ./add/spf
	     git clone https://github.com/georgiaw/Smartphone-Pentest-Framework.git
             cd Smartphone-Pentest-Framework
             ./kaliinstall
             gedit config
           fi
          fi
