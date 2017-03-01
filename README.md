## homebrew-vmfloaty: install vmfloaty as a standalone app

### How do I use this?

```
mckern@flexo ~ $ brew tap mckern/vmfloaty
==> Tapping mckern/vmfloaty
<blah blah blah>
mckern@flexo ~ $ brew install vmfloaty
<blah blah blah>
mckern@flexo ~ $ floaty -h
WARNING: There was no config file at /Users/mckern/.vmfloaty.yml
  NAME:

    floaty

  DESCRIPTION:

    A CLI helper tool for Puppet Labs vmpooler to help you stay afloat
<blah blah blah>
mckern@flexo ~ $
```

### Why would I use this?

[vmfloaty](https://github.com/briancain/vmfloaty) is a fantastic client for the Puppet [vmpooler](https://github.com/puppetlabs/vmpooler) application. But Ruby is kinda trash for installing standalone applications in unpoluted environments. Great news though! Homebrew is pretty solid at wrapping up applications with funky dependencies or wonky runtimes. Snip-snip-snip, Bob's your uncle, and here's a Homebrew tap for your troubles!

### Support & contribution?

In the spirit of Jordan Sissel (a hero to admins and operations people everywhere), if homebrew-vmfloaty isn't helping you float some VMs, then there is a bug in homebrew-vmfloaty. Please open an issue or submit a pull request if something doesn't work.

### License

homebrew-vmfloaty is licensed under the MIT License

> Those who do not understand UNIX are
> condemned to reinvent it, poorly.
>    &#8213; <cite>Henry Spencer</cite>

### Maintainer

Ryan McKern &lt;ryan@orangefort.com&gt;
