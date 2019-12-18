# Morse Code

## Install

```
rvm install 2.6.3
gem install bundler
bundle
```

## Run specs

Guard will run the corresponding spec when the file-under-test is saved.

`bundle exec guard`
- to run the guard server

press [enter] to run all specs.

## Run the script

### Output to file
- ./morse -f example/message.txt
- ./morse -m $'HELLO\nI AM IN TROUBLE'
