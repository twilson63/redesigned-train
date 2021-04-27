 echo "Applying a temporary workaround until https://github.com/vitejs/vite/pull/1992 is fixed"
 (
   cd ./node_modules/vite/dist/node/chunks/ &&
   sed -i 's/JSON.stringify(port)/JSON.stringify(443)/g' * &&
   export WSS_HOST=`gp url 24678 | sed 's#https://##g'` &&
   sed -i "s#JSON.stringify(host)#JSON.stringify(\"$WSS_HOST\")#g" *
 )
