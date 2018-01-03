Cada subdiretório faz um Slax Bundle mediante o comando `sbdev`.

# Instale

```sh
cp -a sbdev.sh /usr/bin/sbdev
cp -a ex /etc/sbdev/ex
```

# Use

```sh
# Inspecione mudanças
sbdev status
# Faça proveito delas
sbdev status > sel
# Construa
sbdev make
# Guarde e/ou implante!
