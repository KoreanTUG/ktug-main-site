---
title: MacTeX 설치
layout: tutorial
description: MacTeX를 설치합니다.
permalink: /getting-started/macos-mactex/install/
prev_tutorial: /getting-started/macos-mactex/prep/
next_tutorial: /getting-started/macos-mactex/texshop/
---

이제 MacTeX를 설치하고 설정하는 방법을 알아봅니다.

## MacTeX 설치 프로그램 내려받아 실행하기

`터미널`을 열고 다음과 명령을 내려 MacTeX 설치 프로그램을 내려받아 실행합니다.

```zsh
curl -O https://mirror.kakao.com/CTAN/systems/mac/mactex/MacTeX.pkg
open MacTeX.pkg
```

<img src="{{ '/assets/images/macos-mactex/curl-mactex-down-open.png' | relative_url }}" alt="cURL로 MacTeX 설치 프로그램 내려받아 실행하기">

> **참고** cURL을 이용하지 않고 MacTeX 설치 프로그램을 [CTAN 미러 사이트](https://mirror.kakao.com/CTAN/systems/mac/mactex/)로부터 웹브라우저를 이용하여 내려받아도 됩니다.

## 설치 프로그램 실행

`MacTeX.pkg`를 실행하면 다음과 같이 "Introddction" 화면이 표시됩니다.

<img src="{{ '/assets/images/macos-mactex/mactex-inst-00.png' | relative_url }}" alt="MacTeX 설치 프로그램 Introduction 화면">

**Continue** 버튼을 눌러 설치를 시작합니다. 다음 화면인 "Read Me", 이어서 "License" 화면에서 **Continue**를 누르면 아래와 같이 라이선스 동의 여부를 묻는데 **Agree**를 눌러 진행한다.

<img src="{{ '/assets/images/macos-mactex/mactex-inst-03.png' | relative_url }}" alt="MacTeX 설치 프로그램 License 동의 화면">

이어지는 화면에서 **Install**을 누르면 아래와 같이 새 소프트웨어 설치 확인을 위해 사용자 암호를 묻는다.

<img src="{{ '/assets/images/macos-mactex/mactex-inst-06.png' | relative_url }}" alt="MacTeX 설치 사용자 동의 화면">

설치가 시작되면 파일들을 목표 폴더에 저장하며 설치가 진행됩니다. MacTeX에는 크기가 작은 파일들의 개수가 많아 설치에 긴 시간이 걸립니다.

<img src="{{ '/assets/images/macos-mactex/mactex-inst-08.png' | relative_url }}" alt="MacTeX 설치 완료 화면">

위와 같이 완료 화면이 표시되면 설치가 모두 끝난 것입니다. **Close** 버튼을 눌러 설치 프로그램을 종료합니다.

## 설치 후

MacTeX 설치 후에 진행해야 하는 일을 안내합니다.

### 배포판 업데이트

> **참고** MacTeX은 TeX Live를 기반으로 조성된 것으로 배포판 업그레이드 등의 관리 작업은 TeX Live 관리 도구인 `tlmgr`을 사용하여 수행합니다.

`터미널`이 실행 중이었다면 종료했다가 다시 실행합니다. 다음의 명령을 터미널에서 차례로 실행합니다.

```zsh
tlmgr repository list
sudo tlmgr option repository https://mirror.kakao.com/CTAN/systems/texlive/tlnet
sudo tlmgr update --all --self --reinstall-forcibly-removed
```

첫 번째 줄은 현재 MacTeX에 등록된 패키지 저장소를 보이는 명령입니다. CTAN 미러 사이트가 표시될 것입니다. 

두 번째 줄의 명령은 현재 국내에서 안정적으로 CTAN 미러링 서비스를 제공하는 카카오 CTAN 미러를 기존 패키지 저장소로 등록합니다. 관리자 권한이 필요하여 `sudo`가 본 명령 앞에 주어져야 하며, 시스템은 사용자 암호를 요구합니다.

세 번째 줄은 `tlmgr` 자체와 설치된 프로그램들과 패키지들을 업데이트하는 명령입니다. `터미널`에서 명령의 실행 결과는 아래 두 화면과 같습니다.

> **참고** `--reinstall-forcibly-removed` 옵션은 신규 설치가 아닌 연도별 새 버전을 설치할 때에 삭제되기도 하는 패키지를 다시 설치하기 위한 것입니다.

<img src="{{ '/assets/images/macos-mactex/tlmgr-update.png' | relative_url }}" alt="tlmgr 업데이트 시작 화면">

<img src="{{ '/assets/images/macos-mactex/tlmgr-update-done.png' | relative_url }}" alt="tlmgr 업데이트 종료 화면">

### 폰트 폴더 설정

TeX 배포판이 설치되며 상당히 많은 트루타입 및 오픈타입 폰트들이 설치됩니다. 하지만 이들 폰트들을 macOS에서 바로 사용할 수는 없습니다. 반대로 TeX과 관련 없이 macOS에 설치된 폰트들을 TeX에서 바로 사용하는 것도 불가능합니다. 따라서 아래와 같은 조치가 필요합니다.

먼저 운영체제에 설치된 폰트들의 위치를 TeX이 참조하도록 합니다. `터미널`에서 다음과 같이 `nano` 에디터를 실행하고 설정 파일(`texmf.cnf`)을 편집하여 운영체제에 설치된 폰트들의 위치를 TeX이 참조하도록 합니다. 

```zsh
sudo nano `kpsewhich texmf.cnf`
```

<img src="{{ '/assets/images/macos-mactex/nano-texmfcnf.png' | relative_url }}" alt="texmf.cnf  편집  화면">

이어서 위 화면과 같이 설정 파일에 마지막 부분에 다음 내용을 써넣고 `Ctrl+O`를 누르고 `Enter`, 이이서 `Ctrl+x`를 눌러 수정된 내용을 저장하고 `nano` 에디터를 종료합니다.

```
OSFONTDIR = {~/Library/Fonts//;/Library/Fonts//;/System/Libray/Fonts//}
```

두 번째로 아래와 같이 `터미널`에서 명령을 실행하여 TeX 배포판과 함께 설치된 폰트를 운영체제에서 사용할 수 있게 합니다.

```zsh
ln -s /Library/TeX/Root/texmf-dist/fonts/opentype ~/Library/Fonts/opentype
ln -s /Library/TeX/Root/texmf-dist/fonts/truetype ~/Library/Fonts/truetype
```

위와 같이 하면 MacTeX과 함께 설치된 수백 종의 트루타입과 오픈타입 폰트를 macOS의 다른 앱에서도 쓸 수 있습니다. 사용자 폰트 폴더에 너무 많은 파일을 연결해서 시스템에 부담이 가는 것 같으면, 필요한 폰트가 들어 있는 폴더만 개별적으로 하나씩 링크해줄 수 있는데 그것은 본인의 선택입니다.

이 두 가지 조치를 취한 후에는 시스템 폰트와 TeX Live 폰트를 모두 "파일 이름"이나 "폰트 이름"으로 참조할 수 있습니다.

## 기타 유틸리티

macOS에는 Python이 기본 설치되어 있어 MacTeX만을 위해서 별도로 설치할 필요가 없습니다. 다만 아래와 같이 하여 pygments (latexminted) 등이 원활히 동작할 수 있도록 해야 합니다.

```zsh
sudo ln -s `which python3` /usr/local/bin/python
```

> **참고** 이 안내서는 한국어 문서 작성을 주로 하는 상황을 가정하고 있습니다. 만약 TeX을 설치하는 목적이 영어 논문을 쓰기 위해서라면 MacTeX를 설치한 후 그 상태에서 바로 작업을 시작하면 됩니다. 그 경우에 이 안내서는 여기가 끝입니다. 이후 설명하는 폰트 문제라든가 KTUG 사설저장소 패키지 등은 모두 한국어/한글 문서 작성과 관련있는 것입니다.

## 다음 단계

MacTeX 설치가 완료되었습니다. 이제 <a href="{{ '/getting-started/macos-mactex/texshop/' | relative_url }}">TeXShop 설정</a>으로 진행하세요.

