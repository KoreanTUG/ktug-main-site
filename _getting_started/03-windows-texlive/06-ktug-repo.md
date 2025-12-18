---
layout: tutorial
title: KTUG 사설저장소 패키지
description: 한국어 문서 작성을 위한 KTUG 사설저장소 패키지를 설치하고 설정하는 방법을 학습합니다.
permalink: /getting-started/windows-texlive/ktug-repo/
prev_tutorial: /getting-started/windows-texlive/fonts/
next_tutorial: /getting-started/windows-texlive/vscode/
---

> **중요** 일반적으로 한글 문서를 활용하는 데 KTUG 사설저장소가 필수적으로 필요한 것은 아닙니다. 그러므로 이 장은 건너뛰어도 좋습니다. 그러나 많은 경우 예제 문서를 컴파일하기 위해서 KTUG 사설저장소에서 제공하는 패키지가 필요하므로 아래 "XeLaTeX을 위해서 여기까지"라고 명시한 부분까지는 따라할 것을 권장합니다.

## KTUG 사설저장소 설정

`Windows` 키를 누르고 'wt'를 입력하여 `터미널`이 표시되면 **관리자 권한으로 실행**을 선택합니다.

<img src="{{ '/assets/images/windows/texlive/win-term-run.png' | relative_url }}" alt="터미널 실행">

"사용자 계정 컨트롤" 창이 표시되며 "이 앱이 디바이스를 변경할 수 있도록 허용하시겠어요?"라고 물으면 **예**를 누릅니다.

`터미널` 창에서 아래의 명령을 차례로 실행하여 KTUG 사설 저장소를 설정합니다.

```powershell
tlmgr repository add https://mirror.ischo.org/KTUG/texlive/tlnet ktug
tlmgr pinning add "*"
```

<img src="{{ '/assets/images/windows/texlive/ktug-repo-add.png' | relative_url }}" alt="KTUG 사설저장소 설정">

위의 절차가 잘 진행되었으면 `터미널`을 종료합니다.

## KTUG 사설저장소 활용

`Windows` 키를 누르고 'tl'을 입력하여 `TLShell TeX Live Manager`가 표시되면 **관리자 권한으로 실행**을 선택합니다.

<img src="{{ '/assets/images/windows/texlive/tlshell-run.png' | relative_url }}" alt="TLShell 실행">

"사용자 계정 컨트롤" 창이 표시되며 "이 앱이 디바이스를 변경할 수 있도록 허용하시겠어요?"라고 물으면 **예**를 누릅니다. 그러면 다음과 같이 TeX Live Shell 창이 표시됩니다.

<img src="{{ '/assets/images/windows/texlive/tlshell-ktug-repo.png' | relative_url }}" alt="TLShell 화면">

위 창에서 앞서 KTUG 사설저장소를 지정한 내용이 반영된 것을 확인할 수 있습니다. 이제 KTUG 사설저장소에 설치된 패키지를 설치해 봅니다. 첫 번째 단계는 패키지 목록(Package List)을 갱신하는 것입니다. 이를 위해 패지키 상태(Status) 가운데 **Not installed**를 선택하면 다음 화면과 같이 주저장소와 사설저장소로부터 패키지 목록을 받아 전체 패키지 목록이 갱신됩니다. **Close**를 눌러서 패키지 목록 갱신을 마칩니다.

<img src="{{ '/assets/images/windows/texlive/tlshell-not-installed.png' | relative_url }}" alt="TLShell 패키지 목록 갱신">

두 번째 단계는 설치할 패키지를 탐색하는 것입니다. 여기서는 예시로 한글 lipsum 텍스트를 제공하는 jiwonlipsum 패키지를 탐색합니다. 아래 화면에서 보이는 바와 같이 탐색(Search) 칸에 jiwon을 입력합니다.

<img src="{{ '/assets/images/windows/texlive/tlshell-pkg-search.png' | relative_url }}" alt="TLShell 패키지 탐색">

탐색 결과로 표시된 패키지를 선택(mark)하고 **Install marked**를 누릅니다. 그러면 다음과 같이 jiwonlipsum 패키지가 설치됩니다. 

<img src="{{ '/assets/images/windows/texlive/tlshell-pkg-inst.png' | relative_url }}" alt="TLShell 패키지 탐색">

설치가 완료되면 **Close**를 누릅니다. 패키지 관리 작업을 모두 마친 후에는 **Quit**을 눌러 TeX Live Shell을 종료합니다.

## 폰트 패키지의 설치와 후처리

KTUG 사설저장소에서는 몇 가지의 폰트 패키지를 제공합니다. 이 가운데 널리 사용되는 것으로 함초롬LVT 폰트를 제공하는 hcr-lvt와 나눔고딕 폰트를 제공하는 nanum-ttf 패키지가 있습니다. 이 두 패키지를 설치하면 `C:\texlive\2025\texmf-dist\fonst\truetype\` 폴더 아래의 `hancom`, 그리고 `public\nanumttf` 폴더에 폰트 파일들이 저장됩니다. 해당 폴더를 찾아 들어가서 폰트 파일 선택 후 우클릭하여 **설치**합니다.

> **중요** "XeLaTeX을 위해서 여기까지." 이 이후 내용은 부록에 이어지는데 부록의 내용은 pdfLaTeX으로 `kotex-utf`를 사용하는 경우에 참고하는 것입니다.

## 다음 단계

KTUG 사설저장소 패키지 설정이 완료되었습니다. 이제 <a href="{{ '/getting-started/windows-texlive/vscode/' | relative_url }}">Visual Studio Code 사용하기</a>로 진행하세요.

