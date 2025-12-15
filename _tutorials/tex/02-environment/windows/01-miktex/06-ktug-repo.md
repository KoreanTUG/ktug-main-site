---
layout: tutorial
title: KTUG 사설저장소 패키지
description: 한국어 문서 작성을 위한 KTUG 사설저장소 패키지를 설치하고 설정하는 방법을 학습합니다.
permalink: /tutorials/tex/windows/miktex/ktug-repo/
prev_tutorial: /tutorials/tex/windows/miktex/fonts/
next_tutorial: /tutorials/tex/windows/miktex/vscode/
---

> **중요** 일반적으로 한글 문서를 활용하는 데 KTUG 사설저장소가 필수적으로 필요한 것은 아닙니다. 그러므로 이 장은 건너뛰어도 좋습니다. 그러나 많은 경우 예제 문서를 컴파일하기 위해서 KTUG 사설저장소에서 제공하는 패키지가 필요하므로 아래 "XeLaTeX을 위해서 여기까지"라고 명시한 부분까지는 따라할 것을 권장합니다.

## 설치

1. [texmf-kpr.zip](http://mirror.doeun.kr/texlive/texmf-kpr.zip)(2024-06-16) 파일을 다운로드합니다. 이 압축 파일을 `C:\usr\texmf-kpr` 폴더에 풀어놓아야 합니다. 다음을 순서대로 따라합니다.
   
   - 다운로드받은 "다운로드" 폴더를 열어서, `texmf-kpr.zip`을 우클릭 하여, "압축 풀기"를 선택합니다.
   
   <img src="{{ '/assets/images/windows/miktex/cap062.png' | relative_url }}" alt="압축 풀기">
   
   - 압축을 풀 폴더를 보여주는 대화창이 열렸을 때, 다음 그림과 같이 `c:\usr`을 써넣습니다.
   
   <img src="{{ '/assets/images/windows/miktex/cap063.png' | relative_url }}" alt="압축 풀기 경로 지정">
   
   - `C:\usr\texmf-kpr`이라는 폴더가 만들어지면서 압축이 풀리고 나면 `C:\usr` 위치로 탐색기 창이 열릴 것입니다.

2. `터미널`을 열어서 다음 명령을 실행합니다.
   ```powershell
   initexmf -r C:\usr\texmf-kpr
   initexmf -u
   ```

3. 설치가 잘 되었는지 확인하기 위해 다음 명령의 결과가 `jiwonlipsum.sty`의 위치를 잘 가리키는지 봅니다.
   ```powershell
   kpsewhich jiwonlipsum.sty
   ```

## 폰트

`C:\usr\texmf-kpr\fonts\truetype` 폴더 아래에 `hcr-lvt`와 `nanumttf`라는 두 종류의 트루타입이 있습니다. 해당 폴더를 찾아 들어가서 폰트 파일 선택 후 우클릭하여 **설치**합니다.

> **중요** "XeLaTeX을 위해서 여기까지." 이 이후 내용은 부록에 이어지는데 부록의 내용은 pdfLaTeX으로 `kotex-utf`를 사용하는 경우에 참고하는 것입니다.

## 다음 단계

KTUG 사설저장소 패키지 설정이 완료되었습니다. 이제 <a href="{{ '/tutorials/tex/windows/miktex/vscode/' | relative_url }}">Visual Studio Code 사용하기</a>로 진행하세요.

