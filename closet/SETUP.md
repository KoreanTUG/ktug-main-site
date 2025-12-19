# 로컬 개발 환경 설정 가이드

## 문제 상황
시스템 Ruby를 사용 중이어서 sudo 권한이 필요합니다.

## 해결 방법

### 방법 1: Homebrew를 통해 Ruby 설치 (권장)

1. Homebrew로 Ruby 설치:
```bash
brew install ruby
```

2. PATH 설정 (zsh 사용 시):
```bash
echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

3. 의존성 설치:
```bash
cd /Users/leekh/Projects/ktug-github-page
bundle install
```

4. Jekyll 서버 실행:
```bash
bundle exec jekyll serve
```

### 방법 2: rbenv 사용

1. rbenv 설치:
```bash
brew install rbenv ruby-build
```

2. Ruby 설치:
```bash
rbenv install 3.2.0
rbenv global 3.2.0
```

3. 이후 bundle install 및 jekyll serve 실행

### 방법 3: 간단하게 Jekyll만 직접 설치

```bash
gem install jekyll bundler
jekyll serve
```

단, 이 방법은 Gemfile의 다른 플러그인들이 설치되지 않을 수 있습니다.

## 서버 실행

설치가 완료되면 다음 명령어로 로컬 서버를 실행하세요:

```bash
bundle exec jekyll serve
```

또는

```bash
jekyll serve
```

브라우저에서 http://localhost:4000 으로 접속하실 수 있습니다.

## 문제 해결

### "bundler: command not found" 오류
```bash
gem install bundler
```

### "jekyll: command not found" 오류
```bash
gem install jekyll
```

### 포트 변경
```bash
bundle exec jekyll serve --port 4001
```

