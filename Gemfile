source "https://rubygems.org"

# 로컬 개발용
# Ruby 2.6 호환성을 위해 Jekyll 3.x 사용 (sassc 기반)
gem "jekyll", "~> 3.9"
gem "jekyll-feed", "~> 0.17"
gem "jekyll-sitemap", "~> 1.4"
gem "jekyll-seo-tag", "~> 2.8"
gem "kramdown-parser-gfm"

# Ruby 3.4+ 호환성: base64, logger, bigdecimal이 기본 gem에서 제거됨
gem "base64"
gem "logger"
gem "bigdecimal"

# GitHub Pages 배포 시 자동으로 사용됩니다
# 로컬 개발에서는 제외하여 버전 충돌 방지
# gem "github-pages", group: :jekyll_plugins

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]


