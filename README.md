# Vagrant + nginx + posgresql + hhvm + symfony + Hack

Please read and check this Readme from times to times so that
to not waste time later wondering how to do things which are
already explained here

if something is wrong or missing: tell me, if you don't tell me
I have no way to improve it =)

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

# Basic tasks

### Commit code

commiting code will run automatically php-codesniffer to check
that your code is well written

for common mistakes (extra spaces etc.), there is the command

```
bin/php-cs-fixer  fix src  -v
```

to fix them for you (don't forget to `git add` again after you've run this command)

### Creating a new Bundle

A middle sized project is supposed to be made of several bundles
if not, you're certainly doing something wrong (too much coupling etc.)

```
php app/console generate:bundle --namespace=%PROJECT_NAME%/Bundle/%XXX%Bundle --no-interaction --format=yml
```

replace `%PROJECT_NAME%` and `%XXX%` by the project name and the name of the feature
your bundle is covering for example

```
php app/console generate:bundle --namespace=WeBridge/Bundle/VideoBundle --no-interaction --format=yml
```

once it's done don't forget to replace the `<?php` in the controller by a `<?hh` so that you can leverage
the Hack language

### Creating a Database Migration

If you want to add/delete/edit a Table or a column:

For simply create/modify your Entity as normal, and when you're done run

```
php app/console doctrine:migrations:diff
php app/console doctrine:migrations:migrate
```

more instruction in the [official documentation](http://symfony.com/doc/current/bundles/DoctrineMigrationsBundle/index.html#generating-migrations-automatically)


#Resource

## Symfony / Doctrine

  * [The official documentation](http://symfony.com/doc/current/book/index.html)

## Hack

  * [The official website](http://hacklang.org/) Do the tutorial, it's very well done and interactive

## Vim

  * [Vim hack plugin](https://github.com/hhvm/vim-hack) So that you can code like a boss
