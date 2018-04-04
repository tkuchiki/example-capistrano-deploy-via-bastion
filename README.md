# example-capistrano-deploy-via-bastion

## Usage

for capistrano-v2

```console
$ bundle install --path=vendor/bundle
$ cd docker && make build && make up && cd ../
$ bundle exec cap development bastion:hostname
00:00 bastion:test
      01 hostname > /tmp/hostname
Warning: Permanently added '[127.0.0.1]:8022' (RSA) to the list of known hosts.
    ✔ 01 bob@172.20.0.3 0.260s
$ cd docker && docker-compose exec ssh1 cat /tmp/hostname
ssh1
```
