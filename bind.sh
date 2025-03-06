#!/bin/bash
cd ./sprint1/dns

# Definindo os domínios e o IP
zones=("areiabranca.com.br" "golfinhos.com.br" "madeiro.com.br" "pontanegra.com.br" "praiadoamor.com.br" "praiadoforte.com.br" "praiadomeio.com.br")
ip=$(netstat -rn | grep "0.0.0.0" | awk 'NR==1 {print $4}')

# Loop para criar os arquivos de zona para cada domínio
for dom in "${zones[@]}"; do
    # Criando o conteúdo do arquivo de zona corretamente
    cat <<EOF > "$dom.zone"
\$TTL 86400
@   IN  SOA ns1.$dom. admin.$dom. (
        2025022003  
        3600        
        1800        
        1209600     
        86400 )     

    IN  NS  ns1.$dom.
    IN  NS  ns2.$dom.
@   IN  A   $ip
ns1 IN  A   $ip
ns2 IN  A   $ip
www IN  A   $ip

@   IN  MX  10 mail.$dom.
mail IN  A   $ip
EOF

    echo "Arquivo de zona para $dom criado com sucesso: $dom.zone"
done
