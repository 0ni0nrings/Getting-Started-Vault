#Start the Dev server for vault
vault server -dev 

#Set env variable
#For Linux/MacOS
export VAULT_ADDR=http://127.0.0.1:8200
#For Windows
$env:VAULT_ADDR = "http://127.0.0.1:8200"

#Write a secret
vault kv put secret/hg2g answer=42

#Write a secret from file

#Get a secret
vault kv get secret/hg2g

#Get it in JSON
vault kv get -format=json secret/hg2g

#Parse the output using jq
vault kv get -format=json secret/hg2g | jq -r .data.data.answer

#Put a new secret in and a new value for an existing secret
vault kv put secret/hg2g answer=54 ford=prefect

#Get all the secrets in the path
vault kv get secret/hg2g

#Get all the version 1 secrets and version 2
vault kv get -version=1 secret/hg2g
vault kv get -version=2 secret/hg2g

#Delete the secrets
vault kv delete secret/hg2g

