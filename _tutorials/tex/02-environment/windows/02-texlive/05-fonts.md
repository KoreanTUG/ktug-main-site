---
layout: tutorial
title: 폰트 설치
description: 한글 문서 작성을 위해 트루타입/오픈타입을 설정하는 방법을 알아봅니다.
permalink: /tutorials/tex/windows/texlive/fonts/
prev_tutorial: /tutorials/tex/windows/texlive/first-doc/
next_tutorial: /tutorials/tex/windows/texlive/ktug-repo/
---

## 시스템 폰트 폴더 위치 설정

시스템에 설치된 폰트를 XeLaTeX에서 원활히 사용하기 위해서는 XeTeX이 폰트를 활용할 때 의존하는 fontconfig 라이브러리에게 현재 시스템의 폰트 폴더 위치를 두 곳 알려주어야 합니다. 그 두 곳이란 아래와 같습니다.

- `C:\Windows\Fonts`
- `C:\Users\<username>\AppData\Local\Microsoft\Windows\Fonts`

이를 위해 [genlocalconf.zip](/assets/downloads/genlocalconf.zip) 파일을 내려받아 아무 곳에나 압축을 풀고, 나오는 `genlocalconf.bat` 파일을 더블클릭하여 실행하면 됩니다.

> **참고** LuaLaTeX은 luaotfload 패키지를 이용하여 독자적으로 폰트를 관리합니다. 따라서 대부분의 경우 별도의 조치가 필요하지 않습니다. Windows에서 genlocalfont를 하지 않아도 시스템 폰트와 TEXMF 폰트를 잘 인식하고 로드할 것입니다.

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

Serif 폰트를 풀어둔 폴더를 열면 몇 개의 otf 폰트 파일이 있습니다. otf 파일을 전체 선택한 다음 `Shift`+우클릭 하여 "모든 사용자용으로 설치"를 선택합니다.

> **참고** 그냥 우클릭 후에 설치를 선택해도 설치는 가능하지만 여기서는 "모든 사용자용으로 설치"하는 것으로 기술합니다. 폰트 호출 부분을 참고하세요.

![폰트 설치](/assets/images/windows/texlive/expl-font-inst.png)

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

![폰트 테스트](/assets/images/windows/texlive/texworks-noto.png)

## 추가 폰트 설치

폰트 파일을 인터넷 등에서 구하여 설치함에 있어서 우클릭 후에 "설치"를 선택한 경우(즉, 자신만을 위하여 설치한 경우)에도 대부분의 폰트는 사용 가능합니다. **파일 이름으로** 호출하는 경우에는 어떠한 제약도 없고, **폰트 이름으로** 호출하려 하는 경우 재시동이 필요할 수 있습니다.
   
> **참고** 만약 "폰트 이름으로" 호출이 잘 되지 않는 폰트가 있다면 "모든 사용자용으로 설치"하면 됩니다.

## 다음 단계

폰트 설치가 완료되었습니다. 이제 [KTUG 사설저장소 패키지](/tutorials/tex/windows/texlive/ktug-repo/)로 진행하세요.
