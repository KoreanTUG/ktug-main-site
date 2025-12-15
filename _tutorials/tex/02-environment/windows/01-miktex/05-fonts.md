---
layout: tutorial
title: 폰트 설치
description: 한글 문서 작성을 위한 Noto Korean 폰트를 설치하고 설정하는 방법을 학습합니다.
permalink: /tutorials/tex/windows/miktex/fonts/
prev_tutorial: /tutorials/tex/windows/miktex/first-doc/
next_tutorial: /tutorials/tex/windows/miktex/ktug-repo/
---

Noto Korean 폰트를 설치합니다.

## 어떤 Noto 폰트를 설치할 것인가?

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

## 폰트 설치

Serif 폰트를 풀어둔 폴더를 열면 몇 개의 otf 폰트 파일이 있습니다. otf 파일을 전체 선택한 다음 `Shift`+우클릭 하여 "모든 사용자용으로 설치"를 선택합니다.

> **참고** 그냥 우클릭 후에 설치를 선택해도 설치는 가능하지만 여기서는 "모든 사용자용으로 설치"하는 것으로 기술합니다. 폰트 호출 부분을 참고하세요.

<img src="{{ '/assets/images/windows/miktex/cap024.png' | relative_url }}" alt="폰트 설치">

## 설치 상태 점검

다음과 같은 파일을 컴파일하여 에러없이 진행되는지 확인합니다.

```latex
\documentclass{oblivoir}

\setkomainfont(Noto Serif CJK KR)
\setkosansfont(Noto Sans CJK KR)

\begin{document}

첫 문서. 테스트. \textsf{고딕체}

\end{document}
```

<img src="{{ '/assets/images/windows/miktex/cap023.png' | relative_url }}" alt="폰트 테스트">

## 다른 폰트의 설치

트루타입 또는 오픈타입 폰트를 XeLaTeX에서 활용하게 하려면 같은 방법으로 설치합니다.

> **참고** 자신이 선택한 폰트의 이름을 어떻게 확인하는가? `터미널`을 열고
> 
> ```powershell
> otfinfo -a <폰트파일이름>
> ```
> 
> 이라는 명령을 내렸을 때 보여주는 이름을 쓰면 됩니다.

## 폰트 호출에 관한 주석

MiKTeX의 XeLaTeX 또는 LuaLaTeX으로 트루타입이나 오픈타입 폰트를 활용함에 있어서 다음 사항을 알아두면 편리합니다.

1. **폰트 이름으로 호출하는 경우**: mpm이 작동하지 않습니다. 예컨대
   ```latex
   \setmainfont{TeX Gyre Termes}
   ```
   라는 코드는 만약 `tex-gyre` 폰트가 설치되어 있지 않다면 컴파일에 실패합니다. 다만
   ```latex
   \setmainfont{texgyretermes-regular.otf}
   ```
   이와 같이 **파일 이름으로** 호출하면 mpm이 동작하며 자동 설치가 가능합니다. 그리고 일단 설치된 이후에는 **파일 이름으로**든 **폰트 이름으로**든 다 동작합니다.

2. **수동 설치**: mpm의 자동 설치가 동작하지 않으면 수동으로 설치할 수 있습니다. 다음과 같은 기본 opentype은 미리 설치해두는 것도 좋은 선택입니다.
   ```powershell
   miktex packages install noto tex-gyre tex-gyre-math xits libertine
   ```
   
   > **참고** 명령행을 이용하지 않고 `MiKTeX-Console`을 실행하여 `Packages`에서 검색하여 설치할 수도 있습니다.

3. **외부 폰트 설치**: 외부 폰트를 설치함에 있어서 우클릭 후에 "설치"를 선택한 경우(즉, 자신만을 위하여 설치한 경우)에도 대부분의 폰트는 사용 가능합니다. **파일 이름으로** 호출하는 경우에는 어떠한 제약도 없고, **폰트 이름으로** 호출하려 하는 경우 재시동이 필요할 수 있습니다.
   
   > **참고** 만약 "폰트 이름으로" 호출이 잘 되지 않는 폰트가 있다면 "모든 사용자용으로 설치"하면 됩니다.

## 다음 단계

폰트 설치가 완료되었습니다. 이제 <a href="{{ '/tutorials/tex/windows/miktex/ktug-repo/' | relative_url }}">KTUG 사설저장소 패키지</a>로 진행하세요.

