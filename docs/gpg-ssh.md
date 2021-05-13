## Export public key to id_rsa.pub
gpg --export-ssh-key keyid > ~/.ssh/id_rsa.pub

## Download config
wget https://raw.githubusercontent.com/drduh/config/master/gpg-agent.conf

## Update gpg-agent
gpg-connect-agent updatestartuptty /bye
