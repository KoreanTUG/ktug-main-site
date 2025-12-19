---
title: 준비하기
layout: tutorial
description: MacTeX 설치를 위한 사전 준비 작업을 합니다.
permalink: /getting-started/macos-mactex/prep/
prev_tutorial: /getting-started/macos-mactex/
next_tutorial: /getting-started/macos-mactex/install/
---

MacTeX 설치를 시작하기 전에 필요한 사전 준비 작업을 진행합니다.

## 터미널 열기
### 터미널 앱

macOS용 앱들을 실행할 수 있는 런치패드(Launchpad) 또는 아래 그림과 같이 스포트라이트(Splotlight)를 이용하여 `터미널`을 검색합니다. `터미널`은 macOS의 기본 앱입니다.

<img src="{{ '/assets/images/macos-mactex/spotlight-term.png' | relative_url }}" alt="스포트라이트에서 터미널 검색">

> **참고** `터미널`이 macOS의 기본 앱이기 때문에 이 안내서는 `터미널`을 중심으로 설명합니다. macOS 사용자들은 기본 앱보다 기능이 강화된 [iTerm2](https://iterm2.com) 등의 앱을 사용하기도 합니다.

### 현재 폴더로 터미널 열기

**여기서 맨 터미널 샷**

**파인더 설정하여 터미널 여는 것 내용 추가**

`Windows 탐색기`로 어떤 폴더를 열어둔 상태에서, 현재 폴더 위치로 터미널을 열어야 할 때가 있습니다.

`Windows` 키를 눌러서 터미널을 실행하면 `%userprofile%`이라고 하는, 사용자의 홈 폴더 위치로 터미널이 열립니다. 이 위치로부터 `cd` 명령을 사용하여 원하는 위치까지 이동할 때, 탐색기의 주소표시줄을 눌러서 폴더의 Path를 얻어내고(`Ctrl+C`) 이것을 `cd` 명령의 인자로 붙여넣기(`Ctrl+V`)하면 간단합니다.

> **주의** 이 안내서의 여러 곳에서 강조하듯이 Windows에서 TeX Live를 사용할 때 가장 중요한 것 중 하나는 폴더명과 파일명에 한글이나 공백문자(띄어쓰기)가 포함되지 않아야 한다는 것입니다.

<img src="{{ '/assets/images/macos-mactex/expl-address.png' | relative_url }}" alt="탐색기 주소표시줄에서 경로 복사">

<img src="{{ '/assets/images/macos-mactex/term-cd.png' | relative_url }}" alt="터미널에서 경로 붙여넣기">

또 다른 방법으로 현재 열린 `탐색기` 폴더 창의 빈 공간에서 `Shift`+우클릭 하여 "터미널에서 열기"를 찾아보는 방법이 있습니다.

<img src="{{ '/assets/images/macos-mactex/expl-term-open.png' | relative_url }}" alt="탐색기에서 우클릭으로 터미널 열기">

두 방법 모두 익숙해지는 것이 좋습니다.

## 다음 단계

준비가 완료되었습니다. 이제 <a href="{{ '/getting-started/macos-mactex/install/' | relative_url }}">MacTeX 설치</a>로 진행하세요.

