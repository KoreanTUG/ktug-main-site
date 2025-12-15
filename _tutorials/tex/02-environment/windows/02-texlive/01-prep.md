---
title: 준비하기
layout: tutorial
description: TeX Live 설치를 위한 사전 준비 작업을 합니다.
permalink: /tutorials/tex/windows/texlive/prep/
prev_tutorial: /tutorials/tex/windows/texlive/
next_tutorial: /tutorials/tex/windows/texlive/install/
---

TeX Live 설치를 시작하기 전에 필요한 사전 준비 작업을 진행합니다.

## winget 설치

`winget`은 Windows 패키지 설치 관리자입니다. 이미 `winget`을 사용할 수 있다면 이 단계를 건너뛰어도 됩니다.

이후의 설명은 `winget`을 이용하여 설치하는 예를 보일 것이므로 `winget`이 사용 가능하도록 해두어야 합니다. Windows 11이라면 `winget`이 이미 사용 가능할 것입니다. Windows 10에서는 다음과 같이 하여 설치할 수 있습니다.

1. `Microsoft Store`를 열어서 `winget`으로 검색합니다.
2. 그 가운데 "앱 설치 관리자"를 선택하여 활성화합니다.

![Microsoft Store에서 winget 검색](/assets/images/windows/miktex/cap002.png)

## 터미널 열기

### 터미널 앱

Windows에서 `터미널`을 열 수 있는지 확인합니다. `터미널`이라는 앱은 Windows 11에는 기본으로 설치되어 있고, Windows 10이라면 `Microsoft Store`에서 검색하여 설치할 수 있습니다.

![Windows 메뉴에서 터미널 검색](/assets/images/windows/texlive/win-menu-term.png)

> **참고** `터미널`이 Windows 11의 기본 앱이기 때문에 이 안내서는 `터미널`을 중심으로 설명합니다. Windows에는 예전부터 `cmd.exe`라는 명령행 인터페이스가 있었기 때문에 `터미널`을 별도로 설치해야 한다면 그냥 `cmd`를 쓰는 것으로 충분하므로, 이후 `터미널`을 열라는 설명은 `cmd`라고 간주해도 무방합니다.

### 현재 폴더로 터미널 열기

`Windows 탐색기`로 어떤 폴더를 열어둔 상태에서, 현재 폴더 위치로 터미널을 열어야 할 때가 있습니다.

`Windows` 키를 눌러서 터미널을 실행하면 `%userprofile%`이라고 하는, 사용자의 홈 폴더 위치로 터미널이 열립니다. 이 위치로부터 `cd` 명령을 사용하여 원하는 위치까지 이동할 때, 탐색기의 주소표시줄을 눌러서 폴더의 Path를 얻어내고(`Ctrl+C`) 이것을 `cd` 명령의 인자로 붙여넣기(`Ctrl+V`)하면 간단합니다.

> **주의** 이 안내서의 여러 곳에서 강조하듯이 Windows에서 TeX Live를 사용할 때 가장 중요한 것 중 하나는 폴더명과 파일명에 한글이나 공백문자(띄어쓰기)가 포함되지 않아야 한다는 것입니다.

![탐색기 주소표시줄에서 경로 복사](/assets/images/windows/texlive/expl-address.png)

![터미널에서 경로 붙여넣기](/assets/images/windows/texlive/term-cd.png)

또 다른 방법으로 현재 열린 `탐색기` 폴더 창의 빈 공간에서 `Shift`+우클릭 하여 "터미널에서 열기"를 찾아보는 방법이 있습니다.

![탐색기에서 우클릭으로 터미널 열기](/assets/images/windows/texlive/expl-term-open.png)

두 방법 모두 익숙해지는 것이 좋습니다.

## 다음 단계

준비가 완료되었습니다. 이제 [TeX Live 설치](/tutorials/tex/windows/texlive/install/)로 진행하세요.

