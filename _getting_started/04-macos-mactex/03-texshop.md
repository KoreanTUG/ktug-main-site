---
title: TeXShop 설정
layout: tutorial
description: MacTeX 기본 에디터인 TeXShop을 한글 문서 작성을 위해 설정합니다.
permalink: /getting-started/macos-mactex/texshop/
prev_tutorial: /getting-started/macos-mactex/install/
next_tutorial: /getting-started/macos-mactex/first-doc/
---

TeX 문서를 편집하기 위한 에디터는 여러 종류가 있으므로 자신의 취향에 맞게 하여 쓰는 것이 가장 좋습니다. MacTeX에서는 [TeXShop](https://pages.uoregon.edu/koch/texshop)이라는 훌륭한 에디터를 기본으로 제공합니다.

## Preferences

먼저 몇 가지 설정을 해두어야 합니다. 우리는 주로 한글 문서를 편집할 것이고 컴파일러 엔진을 XeLaTeX으로 할 것입니다. 이를 위하여 다음 몇 가지를 미리 설정해둡니다. 이 설정은 아무 문서도 편집하지 않는 상태에서 진행하는 것이 좋습니다.

TeXShop을 실행하여 **TeXShop** > **Settings…**를 눌러서 환경 설정 창을 엽니다.

### Source 탭

**Source** 탭에서 편집기의 폰트를 적절한 것으로 설정합니다. 이 예제에서는 기본 폰트인 Helvetica 폰트를 그대로 두고 폰트 크기만 18pt로 설정했습니다.

<img src="{{ '/assets/images/macos-mactex/texshop-settings-source.png' | relative_url }}" alt="TeXShop Source 탭 설정">

### Editor 탭

**Editor** 탭에서는 "Highlight Current Line"을 선택하는 것이 편리합니다.

<img src="{{ '/assets/images/macos-mactex/texshop-settings-editor.png' | relative_url }}" alt="TeXShop Editor 탭 설정">

### Typeset 탭

**Typeset** 탭에서는 "Default Command" 섹션에서 "Command Listed Below"를 선택하고 `XeLaTeX`를 입력합니다.

<img src="{{ '/assets/images/macos-mactex/texshop-settings-typeset.png' | relative_url }}" alt="TeXShop Typeset 탭 설정">

여기서 **OK** 버튼을 누르고 TeXShop 실행을 종료한 다음 다시 실행합니다.

## 다음 단계

TeXShop 설정이 완료되었습니다. 이제 <a href="{{ '/getting-started/macos-mactex/first-doc/' | relative_url }}">첫 문서 작성하기</a>로 진행하세요.
