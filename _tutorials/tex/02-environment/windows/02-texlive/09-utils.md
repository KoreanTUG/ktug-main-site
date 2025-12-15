---
layout: tutorial
title: 기타 유틸리티
description: Python, SumatraPDF 등 추가 유틸리티를 설치하고 설정하는 방법을 학습합니다.
permalink: /tutorials/tex/windows/texlive/utils/
prev_tutorial: /tutorials/tex/windows/texlive/lshort/
next_tutorial: /tutorials/tex/windows/texlive/ktug-repo-adv/
---

## Python

TeX Live에서 [Python](https://www.python.org)이 필요한 이유는 주로 `latexminted`라는 유틸리티 때문입니다. MiKTeX과 달리 TeX Live는 `latexminted`를 별도로 설치할 필요가 없습니다. 다만 Python은 별도로 설치해야 합니다.

Python도 `터미널`에서 `winget`으로 설치할 수 있습니다. 다른 목적으로 Python을 이용하는 경우가 아니고 오로지 이 안내서의 상황만을 고려한다면, 다음과 같은 명령을 내리면 됩니다.

```powershell
winget install Python.Python.3.13
```

## VS Code의 외부 뷰어

VS Code의 PDF Viewer를 (내장 뷰어가 아니라) SumatraPDF라는 외부 유틸리티로 설정하려면 다음과 같이 합니다.

### SumatraPDF 설치

`터미널`에서 다음 명령을 내립니다.

```powershell
winget install SumatraPDF.SumatraPDF
```

> **참고** SumatraPDF는 [웹페이지](https://www.sumatrapdfreader.org/free-pdf-reader)로부터 다운로드하여 설치할 수 있습니다. 이 경우에는 설치 위치와 권한을 지정할 수 있는데, 이 안내서는 그렇게 설치된 경우를 고려하지 않습니다.

### 외부 뷰어 설정

내장 뷰어는 화면이 좁은 경우에 에디터의 일부를 차지하게 되어 답답한 느낌이 들 때가 있고 그외에도 몇 가지 불만스러운 점이 있어서 SumatraPDF라는 pdf 뷰어를 설치하고 이를 외부 뷰어로 활용하는 것이 좋을 때가 있습니다.

그러므로, 만약 외장 뷰어가 자신이 원하는 바가 아니고 내장 뷰어로 충분하다면 이 절의 내용은 무시해도 좋으며, 혹시 이 설정이 뜻대로 되지 않는다고 해도 그냥 내장 뷰어를 쓰면 되는 것입니다.

이를 위하여, 한 가지 확인하여야 할 것이 있습니다. 그것은 **자신의 이름**입니다. `터미널`을 열었을 때 프롬프트에 표시되는 자신의 이름을 확인합니다. 예를 들어 프롬프트가 대략 다음과 같다면

```powershell
C:\Users\KTUG>
```

자신의 이름은 `KTUG`인 것입니다.

> **참고** `터미널` 명령행에서 `echo %userprofile%` 명령을 내리면 자신의 홈 폴더 위치를 출력합니다. 이것으로 자신의 홈 폴더와 "이름"을 확인할 수 있습니다.

`Ctrl+Shift+P`로 명령 팔레트를 연 다음 "사용자 설정 열기(JSON)"을 선택하여 설정 편집 상태로 들어갑니다. 여기에 다음 내용을 복사하여 넣습니다.

그리고 `C:/Users/KTUG` 부분을 자신의 "이름"으로 바꾸어 넣습니다. 예컨대 이름이 `chunhyang`이라면

```powershell
C:/Users/chunhyang/AppData/....
```

와 같은 모양이 되게 해야 합니다. 이렇게 고쳐야 할 곳이 두 곳 있습니다.

```json
"latex-workshop.view.pdf.viewer": "external",
"latex-workshop.view.pdf.external.synctex.command": "C:/Users/KTUG/AppData/Local/SumatraPDF/SumatraPDF.exe",
"latex-workshop.view.pdf.external.synctex.args": [
    "-forward-search",
    "%TEX%",
    "%LINE%",
    "-reuse-instance",
    "-inverse-search",
    "code.cmd -r -g \"%f:%l\"",
    "%PDF%"
],
"latex-workshop.view.pdf.external.viewer.command": "C:/Users/KTUG/AppData/Local/SumatraPDF/SumatraPDF.exe",
```

설정 저장 후 VS Code를 재실행합니다.

### SyncTeX

SyncTeX이란 편집기와 PDF Viewer 사이에서 원하는 위치로 이동하는 것입니다. 이 상태에서 `Ctrl+Alt+V`를 누르면 SumatraPDF가 열려야 합니다.

> **참고** 기존에 SumatraPDF가 열려 있지 않은 것이 좋습니다.

SumatraPDF의 특정한 위치에서 더블 클릭해봅니다. 그러면 (잠깐 검은 화면이 뜨면서) 편집기 상의 커서 위치가 PDF에서 클릭한 위치에 해당하는 곳으로 이동하여야 합니다.

이번에는 에디터의 특정한 행(예를 들면 800행)에 커서를 두고 `Ctrl+Alt+J`를 눌러봅니다. 열려 있는 SumatraPDF에서 화면 이동이 일어나면서 잠깐 파랗게 위치를 보여줄 것입니다.

## arara와 Java Runtime

arara 유틸리티를 사용하려면 Java Runtime이 설치하여야 합니다. 이 안내서는 이에 대하여 더 상세히 다루지 않습니다.

## 다음 단계

기타 유틸리티 설치가 완료되었습니다. 필요에 따라 <a href="{{ '/tutorials/tex/windows/texlive/ktug-repo-adv/' | relative_url }}">KTUG 사설저장소 추가 설정</a>을 참고하세요.

