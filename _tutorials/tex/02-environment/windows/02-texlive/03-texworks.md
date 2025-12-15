---
title: TeXworks 설정
layout: tutorial
description: TeX Live 기본 에디터인 TeXworks를 한글 문서 작성을 위해 설정합니다.
permalink: /tutorials/tex/windows/texlive/texworks/
prev_tutorial: /tutorials/tex/windows/texlive/install/
next_tutorial: /tutorials/tex/windows/texlive/first-doc/
---

TeX 문서를 편집하기 위한 에디터는 여러 종류가 있으므로 자신의 취향에 맞게 하여 쓰는 것이 가장 좋습니다. 다른 선택의 여지가 없다면 TeX Live가 기본 제공하는 [TeXworks](https://www.tug.org/texworks) 에디터를 쓸 수 있습니다.

## Preferences

먼저 몇 가지 설정을 해두어야 합니다. 우리는 주로 한글 문서를 편집할 것이고 컴파일러 엔진을 XeLaTeX으로 할 것입니다. 이를 위하여 다음 몇 가지를 미리 설정해둡니다. 이 설정은 아무 문서도 편집하지 않는 상태에서 진행하는 것이 좋습니다.

TeXworks를 실행하여 **편집** > **환경 설정**을 눌러서 환경 설정 창을 엽니다.

![TeXworks 환경 설정 열기](/assets/images/windows/texlive/texworks-edit.png)

### 편집기 탭

**편집기** 탭에서 다음 몇 가지 항목을 선택합니다.

- **폰트**: 자신이 선호하는 코딩용 폰트와 크기를 설정합니다. 잘 모르겠으면 Consolas 11pt로 하는 것을 권장합니다.
- **기타**: 줄번호 표시, 줄넘김, 현재 줄 강조, 문법 강조: LaTeX

![편집기 설정](/assets/images/windows/texlive/texworks-editor-tab.png)

### 문서처리 탭

다른 것은 건드리지 말고 "기본값"을 `XeLaTeX`으로 선택합니다.

![문서처리 설정](/assets/images/windows/texlive/texworks-doc-proc-tab.png)

여기서 **확인** 버튼을 누르고 TeXworks 실행을 종료한 다음 다시 실행합니다.

## 다음 단계

TeXworks 설정이 완료되었습니다. 이제 <a href="{{ '/tutorials/tex/windows/texlive/first-doc/' | relative_url }}">첫 문서 작성하기</a>로 진행하세요.

