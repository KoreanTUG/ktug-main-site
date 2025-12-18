---
title: TeX Live 설치
layout: tutorial
description: cURL을 사용하여 TeX Live를 설치합니다.
permalink: /getting-started/windows-texlive/install/
prev_tutorial: /getting-started/windows-texlive/prep/
next_tutorial: /getting-started/windows-texlive/texworks/
---

이제 TeX Live를 설치하고 설정하는 방법을 알아봅니다.

## cURL 설치

이 문서에서는 TeX Live ISO 이미지를 내려받을 때에 cURL이라는 명령행 프로그램을 사용합니다. 터미널에서 다음과 같이 하여 cURL 패키지를 탐색하여 이 프로그램의 장치 ID를 확인한 뒤 설치를 진행합니다.

```powershell
winget search curl
winget install cURL.cURL
```

<img src="{{ '/assets/images/windows/texlive/winget-inst-curl.png' | relative_url }}" alt="Winget으로 cURL 탐색 및 설치">

`winget`을 처음 사용한다면 다음과 같은 화면이 나오는데 `Y`를 입력하여 진행하면 됩니다.

<img src="{{ '/assets/images/windows/miktex/cap003.png' | relative_url }}" alt="winget 사용 동의 화면">

## TeX Live 설치 프로그램 내려받기

`터미널`을 열고 다음과 명령을 내려 TeX Live ISO 이미지를 내려 받습니다.

```powershell
curl https://mirror.kakao.com/CTAN/systems/texlive/Images/texlive.iso
```

<img src="{{ '/assets/images/windows/texlive/curl-tl-iso-down.png' | relative_url }}" alt="cURL로 TeX Live ISO 이미지 내려받기">

> **참고** cURL을 이용하지 않고 TeX Live ISO 이미지를 [CTAN 미러 사이트](https://mirror.kakao.com/CTAN/systems/texlive/Images/)로부터 웹브라우저를 이용하여 내려받아도 됩니다.

## ISO 이미지 탑재

탐색기에서 내려받은 ISO 이미지를 마우스 포인터로 가리키며 오른쪽 버튼을 누르면 아래와 같이 컨텍스트 메뉴에 **탐색**이 표시됩니다. 이 메뉴 항목을 선택하여 ISO 이미지를 탑재(mount)합니다. 

<img src="{{ '/assets/images/windows/texlive/expl-iso-mount.png' | relative_url }}" alt="TeX Live ISO 이미지 탑재">

'파일 열기 - 보안 경고' 창이 표시되며 "이 파일을 여시겠습니까?"라고 물으면 **열기** 버튼을 누릅니다.

## 설치 프로그램 실행

다음 화면과 같이 탐색기로 TeX Live ISO 이미지가 탑재된 드라이브(예시에서는 `D:`)로 이동하여 `install-tl-windows.bat` 파일을 더블클릭하여 실행합니다.

<img src="{{ '/assets/images/windows/texlive/expl-iso-mounted.png' | relative_url }}" alt="TeX Live 설치 프로그램 실행">

파일 확장자가 보이지 않으면 아래와 **보기** > **표시** > **파일 확장명**을 선택하여 파일 확장명를 표시하게 하면 편리합니다.

<img src="{{ '/assets/images/windows/texlive/expl-show-ext.png' | relative_url }}" alt="탐색기로 확장자 보기">

`install-tl-windows.bat`을 실행하면 다음과 같이 첫 화면이 표시됩니다.

<img src="{{ '/assets/images/windows/texlive/tl-inst-init.png' | relative_url }}" alt="TeX Live 설치 프로그램 첫 화면">

위 화면이 표시되면서 터미널 창도 함께 표시되는데 닫지 말고 그대로 둡니다. 이어서 다음 창이 표시되면 **Install** 버튼을 눌러 설치를 시작합니다.

<img src="{{ '/assets/images/windows/texlive/tl-inst-start.png' | relative_url }}" alt="TeX Live 설치 프로그램 시작 화면">

설치가 시작되면 아래와 같이 로그 메시지가 화면에 표시되며 설치가 진행됩니다. TeX Live에는 크기가 작은 파일들의 개수가 많아 설치에 긴 시간이 걸립니다.

<img src="{{ '/assets/images/windows/texlive/tl-inst-middle.png' | relative_url }}" alt="TeX Live 설치 중 화면">

2025년 12월 12일 기준 총 4,813 개의 패키지를 설치하고 각종 설정과 필수 파일 생성, 업데이트를 마치면서 아래와 같이 완료 화면이 표시되면 설치가 모두 끝난 것입니다. **Close** 버튼을 눌러 설치 프로그램을 종료합니다.

<img src="{{ '/assets/images/windows/texlive/tl-inst-done.png' | relative_url }}" alt="TeX Live 설치 완료 화면">

## 설치 후

TeX Live가 제대로 설치되었는지 TeX Live 관리 프로그램인 TLShell TeX Live Manager를 실행해 봅니다. Windows 키(`Windows`)를 누르고 'tl'을 입력하여 TLShell TeX Live Manager를 찾아 **관리자 권한으로 실행**을 누릅니다.. 

<img src="{{ '/assets/images/windows/texlive/tlshell-run.png' | relative_url }}" alt="TLShell 실행">

이어서 "사용자 계정 컨트롤" 창이 표시되면서 "게시자를 알 수 없는 이 앱이 디바이스를 변경할 수 있도록 허용하시겠어요?"라고 물으면 **예** 버튼을 눌러 프로그램을 실행합니다. 잠시 후 다음과 같이 첫 화면이 표시됩니다.

<img src="{{ '/assets/images/windows/texlive/tlshell-init.png' | relative_url }}" alt="TLShell 첫 화면">

이제 가장 먼저 해야 할 일은 TeX Live 패키지 저장소를 가까운 미러 사이트로 지정하는 것입니다. 앞서 TeX Live ISO 이미지를 내려받은 곳은 카카오에서 제공하는 CTAN 미러를 사용하기로 합니다.

TeX Live Shell의 메인 메뉴에서 **Options** > **Repositories ...**를 실행하여 표시되는 "Main Repository" 창에서 아래와 같이 **Specific mirror...** > **Asia** > **Korea** > **https://mirror.kakao.com/CTAN/systems/texlive/tlnet**을 선택합니다.

<img src="{{ '/assets/images/windows/texlive/tlshell-repo-sel-nb.png' | relative_url }}" alt="TLShell 미러 저장소 선택">

그러면 다음과 같이 새로 지정한 CTAN 미러가 표시됩니다. 이제 **Save and Load** 버튼을 누릅니다.

<img src="{{ '/assets/images/windows/texlive/tlshell-repo-set.png' | relative_url }}" alt="TLShell 미러 저장소 선택 완료">

이제 새로 지정한 CTAN 미러로부터 패키지 정보를 읽어들여 아래와 같이 표시면 **Close** 버튼을 누릅니다.

<img src="{{ '/assets/images/windows/texlive/tlshell-repo-load.png' | relative_url }}" alt="TLShell 미러 저장소 로드">

위의 과정을 거치고 나면 다시 아래와 같이 Tex Live Shell 주화면으로 돌아옵니다. 이 주화면에 표시된 내용을 자세히 살펴보면 TL Manager의 업데이트가 필요하다고 되어 있습니다. 항상 이렇게 표시되는 것은 아니지만 이 표시가 보이면 **Update tlmgr** 버튼을 눌러 업데이트를 수행합니다.

<img src="{{ '/assets/images/windows/texlive/tlshell-after-load.png' | relative_url }}" alt="TLShell 주화면">

그러면 다음과 같이 `cmd` 창이 열리면서 `tlmgr`의 업데이트가 진행됩니다. 업데이트가 끝나면 이 `cmd` 창을 닫습니다.

<img src="{{ '/assets/images/windows/texlive/tlmgr-update-done.png' | relative_url }}" alt="tlmgr 업데이트">

이제 최종적으로 Tex Live Shell 주화면이 표시됩니다. 모든 작업을 마쳤으므로 **Quit** 버튼을 눌러 프로그램을 마칩니다.

<img src="{{ '/assets/images/windows/texlive/tlshell-done.png' | relative_url }}" alt="TLShell 주화면">

일반적으로 TeX Live의 업데이트는 한 달에 한 번 정도 **Update all** 버튼을 눌러 수행하는 것을 추천합니다. 

> **참고** 업데이트가 성공적으로 진행되지 않거나 뭔가 문제가 있다는 메시지가 나타나는 것은 CTAN 미러 서버에서 업데이트가 진행중이거나 미러 서버가 동작하지 않거나 인터넷에 연결되어 있지 않기 때문입니다. 이럴 때는 몇 시간 기다렸다가 재시도합니다.

## 기타 유틸리티

TeX Live는 MiKTeX과 달리 Perl이나 pygments (latexminted)를 추가로 설치할 필요가 없습니다. 다만 Python은 따로 설치해야 합니다. 이에 대해서는 <a href="{{ '/getting-started/windows-texlive/utils/' | relative_url }}">부록</a>에서 안내합니다.

> **참고** 이 안내서는 한국어 문서 작성을 주로 하는 상황을 가정하고 있습니다. 만약 LaTeX을 설치하는 목적이 영어 논문을 쓰기 위해서라면 TeX Live를 설치한 후 그 상태에서 바로 작업을 시작하면 됩니다. 그 경우에 이 안내서는 여기가 끝입니다. 이후 설명하는 폰트 문제라든가 KTUG 사설저장소 패키지 등은 모두 한국어/한글 문서 작성과 관련있는 것입니다.

## 다음 단계

TeX Live 설치가 완료되었습니다. 이제 <a href="{{ '/getting-started/windows-texlive/texworks/' | relative_url }}">TeXworks 설정</a>으로 진행하세요.

