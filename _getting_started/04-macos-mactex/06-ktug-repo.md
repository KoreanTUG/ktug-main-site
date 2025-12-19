---
layout: tutorial
title: KTUG 사설저장소 패키지
description: 한국어 문서 작성을 위한 KTUG 사설저장소 패키지를 설치하고 설정하는 방법을 학습합니다.
permalink: /getting-started/macos-mactex/ktug-repo/
prev_tutorial: /getting-started/macos-mactex/fonts/
next_tutorial: /getting-started/macos-mactex/vscode/
---

> **중요** 일반적으로 한글 문서를 활용하는 데 KTUG 사설저장소가 필수적으로 필요한 것은 아닙니다. 그러므로 이 장은 건너뛰어도 좋습니다. 그러나 많은 경우 예제 문서를 컴파일하기 위해서 KTUG 사설저장소에서 제공하는 패키지가 필요하므로 아래 "XeLaTeX을 위해서 여기까지"라고 명시한 부분까지는 따라할 것을 권장합니다.

## KTUG 사설저장소 설정

`Cmd+Space` 키를 눌러 `스포트라이트`를 실행하고 'term'을 입력하여 `터미널`을 실행합니다.

`터미널` 창에서 아래의 명령을 차례로 실행하여 KTUG 사설저장소를 설정합니다.

```zsh
sudo tlmgr repository add https://mirror.ischo.org/KTUG/texlive/tlnet ktug
sudo tlmgr pinning add ktug "*"
curl -O https://mirror.ischo.org/KTUG/texlive/tlnet/ktugrepo.pub.txt
sudo tlmgr key add ./ktugrepo.pub.txt
```

<img src="{{ '/assets/images/macos-mactex/add-ktug-repo.png' | relative_url }}" alt="KTUG 사설저장소 설정">

관리자 권한이 필요하여 시스템이 패스워드를 요구합니다.

## KTUG 사설저장소 활용

`터미널`에서 다음의 명령을 실행하여 KTUG 사설저장소에서 제공하는 패키지 몇 개를 설치하여 정상 동작을 확인합니다.

```zsh
sudo tlmgr install hcr-lvt jiwonlipsum ksmisc
```

> **중요** "XeLaTeX을 위해서 여기까지." 이 이후 내용은 부록에 이어지는데 부록의 내용은 pdfLaTeX으로 `kotex-utf`를 사용하는 경우에 참고하는 것입니다.

## 다음 단계

KTUG 사설저장소 패키지 설정이 완료되었습니다. 이제 <a href="{{ '/getting-started/macos-mactex/vscode/' | relative_url }}">Visual Studio Code 사용하기</a>로 진행하세요.

