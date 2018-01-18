# Gem build

```
cd /shc_logger_lib
gem build shc-logger.gemspec
cd /ams_rws
cd /vendor/gems
gem unpack ../../../shc_logger_lib/shc-logger-0.0.1.gem
gem specification shc-logger.0.0.1.gem > .specification
```
