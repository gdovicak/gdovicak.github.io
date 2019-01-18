---
layout: post
title:  "RVM Error Installing ruby-2.2.0"
date:   2015-01-13 12:15:00
categories: RVM
---

On my mac running OS X 10.9, I was trying to install ruby-2.2.0 using rvm and I
repeatedly received an error when it was trying to install with the commands rvm
install ruby-2.2.0 and rvm reinstall ruby-2.2.0 after it errored out initially.

The error was:

``` shell
ruby-2.2.0 - #installing.............
Error running '__rvm_make install',
showing last 15 lines of /Users/bengdovicak/.rvm/log/1421199912_ruby-2.2.0/install.log
        from /Users/bengdovicak/.rvm/src/ruby-2.2.0/lib/rubygems/spec_fetcher.rb:42:in `fetcher'
        from /Users/bengdovicak/.rvm/src/ruby-2.2.0/lib/rubygems/resolver/installer_set.rb:37:in `initialize'
        from /Users/bengdovicak/.rvm/src/ruby-2.2.0/lib/rubygems/dependency_installer.rb:430:in `new'
        from /Users/bengdovicak/.rvm/src/ruby-2.2.0/lib/rubygems/dependency_installer.rb:430:in `resolve_dependencies'
        from /Users/bengdovicak/.rvm/src/ruby-2.2.0/lib/rubygems/dependency_installer.rb:373:in `install'
        from /Users/bengdovicak/.rvm/src/ruby-2.2.0/lib/rubygems.rb:558:in `install'
        from ./tool/rbinstall.rb:717:in `block (2 levels) in <main>'
        from ./tool/rbinstall.rb:716:in `each'
        from ./tool/rbinstall.rb:716:in `block in <main>'
        from ./tool/rbinstall.rb:749:in `call'
        from ./tool/rbinstall.rb:749:in `block in <main>'
        from ./tool/rbinstall.rb:746:in `each'
        from ./tool/rbinstall.rb:746:in `<main>'
```

To try to figure out my issue I issued the above commands with --debug and I
didn't receive any valuable feedback from that.

Trying to find information searching for the error I came across the rvm gem
list command and when I ran that I received a different error which I wasn't
expecting at all.

``` shell
rvm gem list error:
    dev-mac:projects bengdovicak$ gem list
    /Users/bengdovicak/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/yaml.rb:4:in `<top (required)>':
    It seems your ruby installation is missing psych (for YAML output).
    To eliminate this warning, please install libyaml and reinstall your ruby.
```

That gave me helpful feedback on how to fix that error at least that I needed to
get libyaml functioning correctly. I am not sure what happened to it.

I then ran:

``` shell
dev-mac:projects bengdovicak$ brew install libyaml
Warning: libyaml-0.1.6 already installed
dev-mac:projects bengdovicak$ brew reinstall libyaml
==> Reinstalling libyaml
Error: libyaml-0.1.6 already installed
To install this version, first `brew unlink libyaml'
dev-mac:projects bengdovicak$ brew unlink libyaml
Unlinking /usr/local/Cellar/libyaml/0.1.6... 1 symlinks removed
dev-mac:projects bengdovicak$ brew reinstall libyaml
```

rvm gem list then worked fine and listed my gems. I decided to try installing
ruby-2.2.0 again and it installed just fine. Reinstalling libyaml fixed my problems.
