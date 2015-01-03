# Vagrant + nginx + posgresql + hhvm + symfony + Hack

Note: you must have a 64 bit machine/OS to use this

  * we use `vagrant` to create the dev environnement
  * `nginx` to provide the web server
  * `postgresql` for the database (note: we use the third-party, opensource, module to provide PDO for hhvm)
  * `hhvm` as the php interpreter (better performance / static analyzer)
  * `symfony` + `doctrine` for the base Framework
  * `DoctrineMigration` to create database migration (should be simpler than Phinx)
  * `Hack` as the language to write our own safer code



# Create the vagrant machine

```
vagrant up
```

# Test if everything works correctly

If everything works correctly you should be able to go here

[http://127.0.0.1:8088/app_dev.php/hello/world](http://127.0.0.1:8088/app_dev.php/hello/plop)

and see an hello world
