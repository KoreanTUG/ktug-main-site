---
layout: tutorial
title: 폰트 설치
description: 한글 문서 작성을 위해 트루타입/오픈타입을 설정하는 방법을 알아봅니다.
permalink: /getting-started/macos-mactex/fonts/
prev_tutorial: /getting-started/macos-mactex/first-doc/
next_tutorial: /getting-started/macos-mactex/ktug-repo/
---

최근 예제 폰트로 자주 사용되는 Noto Korean 폰트를 설치하고 사용해 봅니다.

## Noto Korean 폰트 설치

### 폰트 선택

Noto Korean 폰트는 종류가 서너 가지 있습니다.

1. [fonts.google.com](https://fonts.google.com)에서 Korean으로 검색해서 찾을 수 있는 폰트. 이것은 `Noto Serif KR`과 `Noto Sans KR`이라는 이름으로 활용할 수 있는 폰트입니다.
2. [github.com/notofonts/noto-cjk/releases](https://github.com/notofonts/noto-cjk/releases)에서 받을 수 있는 폰트. 이것은 `Noto Serif CJK KR` 또는 `Noto Sans CJK KR`이라는 이름의 폰트입니다.

이 가운데 2번 항목의 CJK 폰트를 설치하기로 합니다.

> **참고** 1번의 Noto KR 폰트를 선호하는 사람도 많습니다. 폰트 크기가 상대적으로 작기 때문에 한자 관련한 문제가 심각하지 않다면 이것이 더 좋을 수 있습니다.

이것도 여러 종류가 있는데, "Language Specific OTFs Korean"이라는 것을 권장합니다. 각각의 주소는 다음과 같습니다.

- Serif: [08_NotoSerifCJKkr.zip](https://github.com/notofonts/noto-cjk/releases/download/Serif2.003/08_NotoSerifCJKkr.zip)
- Sans: [07_NotoSansCJKkr.zip](https://github.com/notofonts/noto-cjk/releases/download/Sans2.004/07_NotoSansCJKkr.zip)

다운로드 받은 zip 파일을 풀어둡니다.

> **참고** KTUG 사이트와 같은 곳에서 볼 수 있는 한글 문서 예제는 Noto Serif KR/Noto Sans KR 폰트를 사용한 것이 현저히 많습니다. 만약 Noto CJK KR 폰트를 설치하였고 이런 예제에서 에러를 만나게 되었다면 폰트 이름을 자신이 설치한 것으로 찾아 고쳐서 시도하여야 합니다.

### 폰트 설치

Serif 폰트를 풀어둔 폴더를 열면 몇 개의 otf 폰트 파일이 있습니다. `파인더`에서 otf 파일을 전체 선택한 다음 우클릭 하여 "Open"을 선택합니다.

<img src="{{ '/assets/images/macos-mactex/finder-font-inst.png' | relative_url }}" alt="폰트 설치">

그러면 아래와 같이 `폰트 북` 앱 창이 표시되는데 **Install**을 누르면 폰트가 설치됩니다. 설치가 끝나면 폰트 북을 종료합니다.

### 설치 상태 점검

다음과 같은 파일을 컴파일하여 에러없이 진행되는지 확인합니다.

```latex
\documentclass{oblivoir}

\setkomainfont(Noto Serif CJK KR)
\setkosansfont(Noto Sans CJK KR)

\begin{document}

첫 문서. 테스트. \textsf{고딕체}

\end{document}
```

<img src="{{ '/assets/images/macos-mactex/texshop-font-test.png' | relative_url }}" alt="Noto 폰트 테스트">

폰트가 제대로 설치되었으면 프리뷰 창이 제대로 표시된다.

<img src="{{ '/assets/images/macos-mactex/texshop-new-font-preview.png' | relative_url }}" alt="Noto 폰트 PDF 프리뷰">

## 추가 폰트 설치

폰트 파일을 인터넷 등에서 구하여 설치함에 있어서 `파인더`에서 우클릭 후에 "Open"을 선택하여 `폰트 북`으로 설치하면 대부분의 폰트가 사용 가능합니다. 

폰트를 설치할 때에 반드시 `파인더`와 `폰트 북`을 이용해야 하는 것은 아닙니다. 아래와 같이 폰트 파일이 있는 폴더에서 `터미널`을 열어서 `cp` 명령을 수행하여 설치할 수도 있습니다.

```zsh
cp NotoSerifCJKkr-Regular.otf ~/Library/Fonts
```

## 다음 단계

폰트 설치가 완료되었습니다. 이제 <a href="{{ '/getting-started/macos-mactex/ktug-repo/' | relative_url }}">KTUG 사설저장소 패키지</a>로 진행하세요.
