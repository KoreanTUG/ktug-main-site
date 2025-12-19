---
layout: tutorial
title: 기타 유틸리티
description: Python, Skim 등 추가 유틸리티를 설치하고 설정하는 방법을 학습합니다.
permalink: /getting-started/macos-mactex/utils/
prev_tutorial: /getting-started/macos-mactex/lshort/
next_tutorial: /getting-started/macos-mactex/ktug-repo-adv/
---

원활한 TeX 사용을 위하여 추가로 설치, 설정해야 하는 프로그램들을 안내합니다.

## Python

앞서 <a href="{{ '/getting-started/macos-mactex/install/' | relative_url }}">MacTeX 설치</a>에서 설명한 바와 같이 macOS에는 Python이 기본적으로 설치되어 있기 때문에 TeX 사용만을 위해서라면 별도로 설치할 필요가 없습니다. 다만, 아래와 같은 조치를 해서 Python이 TeX 관련 프로그램에서 원활히 작동할 수 있도록 조치하는 것으로 충분합니다. 

```zsh
sudo ln -s `which python3` /usr/local/bin/python
```

## VS Code의 외부 PDF 뷰어

VS Code의 내장 뷰어는 화면이 좁은 경우에 에디터의 일부를 차지하게 되어 답답한 느낌이 들 때가 있고 그외에도 몇 가지 불만스러운 점이 있어서 외부 뷰어를 활용하는 것이 좋을 때가 있습니다.

그러므로, 만약 외장 뷰어가 자신이 원하는 바가 아니고 내장 뷰어로 충분하다면 이 절의 내용은 무시해도 좋으며, 혹시 이 설정이 뜻대로 되지 않는다고 해도 그냥 내장 뷰어를 쓰면 되는 것입니다.

macOS에는 `미리보기`(Preview)라는 훌륭한 기본 뷰어가 있으나 TeX 컴파일러의 연동을 위해서는 [`Skim`](https://skim-app.sourceforge.io)을 널리 사용합니다.

### Skim 설치

웹브라우저로 [Skim 홈페이지](https://skim-app.sourceforge.io)에 접속하여 **Download** 링크를 클릭하여 DMG 형식의 설치 프로그램을 내려받아 더블 클릭합니다. 그러면 아래와 같은 창이 열립니다.

<img src="{{ '/assets/images/macos-mactex/skim-dmg.png' | relative_url }}" alt="Skim 설치">

위 창의 안내에 따라 Skim 앱을 Applications 폴더로 옮기면 설치가 끝납니다.

### Skim 설정

메인 메뉴에서 **Skim** > **Settings...**을 선택하여 표시되는 환경 설정 창에서 "Sync" 탭으로 이동합니다. 보통은 이 탭이 우선적으로 표시됩니다.

<img src="{{ '/assets/images/macos-mactex/skim-sync.png' | relative_url }}" alt="Skim 설정">

위 화면과 같이 **Check for file changes**와 **Reload automatically** 옵션을 키고 **Preset**에서 `Visual Stuio Code`를 선택합니다.

### VS Code 설정

`Cmd+Shift+P`로 명령 팔레트를 연 다음 "사용자 설정 열기(JSON)"을 선택하여 설정 편집 상태로 들어갑니다. 여기에 다음 내용을 추가합니다.

```json
"latex-workshop.view.pdf.viewer": "external",
"latex-workshop.view.pdf.external.viewer.command": "/Applications/Skim.app/Contents/SharedSupport/displayline",
"latex-workshop.view.pdf.external.viewer.args": [
  "0",
  "%PDF%"
],
"latex-workshop.view.pdf.external.synctex.command": "/Applications/Skim.app/Contents/SharedSupport/displayline",
"latex-workshop.view.pdf.external.synctex.args": [
  "-r",
  "-b",
  "%LINE%",
  "%PDF%",
  "%TEX%"
],
"latex-workshop.latex.autoOpen.enabled": true
```

설정 저장 후 VS Code를 재실행합니다.

### SyncTeX

SyncTeX이란 편집기와 PDF Viewer 사이에서 원하는 위치로 이동하는 것입니다. 이 상태에서 `Cmd+Opt+V`를 누르면 Skim이 열려야 합니다.

> **참고** 기존에 Skim이 열려 있지 않은 것이 좋습니다.

Skim의 특정한 위치에서 더블 클릭해봅니다. 그러면 (잠깐 검은 화면이 뜨면서) 편집기 상의 커서 위치가 PDF에서 클릭한 위치에 해당하는 곳으로 이동하여야 합니다.

이번에는 에디터의 특정한 행(예를 들면 800행)에 커서를 두고 `Cmd+Opt+J`를 눌러봅니다. 열려 있는 Skim에서 화면 이동이 일어나면서 잠깐 파랗게 위치를 보여줄 것입니다.

## arara와 Java Runtime

arara 유틸리티를 사용하려면 Java Runtime이 설치하여야 합니다. 이 안내서는 이에 대하여 더 상세히 다루지 않습니다.

## 다음 단계

기타 유틸리티 설치가 완료되었습니다. 필요에 따라 <a href="{{ '/getting-started/macos-mactex/ktug-repo-adv/' | relative_url }}">KTUG 사설저장소 추가 설정</a>을 참고하세요.

