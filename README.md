## Vertebrae [![Build Status](https://secure.travis-ci.org/polarblau/vertebrae.png?branch=master)](http://travis-ci.org/polarblau/vertebrae)


### Development

#### Testing

**Guard**

Due to a [bug in the current guard-minitest](https://github.com/guard/guard-minitest/pull/25) version you should use this fork for now: https://github.com/grimen/guard-minitest :

```bash
$ git clone https://github.com/grimen/guard-minitest.git guard-minitest
$ cd guard-minitest
$ gem build guard-minitest.gemspec
$ cd ../path/to/vertebrae/gem
$ gem install ../path/to/guard-minitest/guard-minitest-0.4.0.gem
```