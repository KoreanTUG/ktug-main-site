---
title: MiKTeX 설치
layout: tutorial
description: winget을 사용하여 MiKTeX을 설치하고 업데이트합니다.
permalink: /tutorials/tex/windows/miktex/install/
prev_tutorial: /tutorials/tex/windows/miktex/prep/
next_tutorial: /tutorials/tex/windows/miktex/texworks/
---

이제 MiKTeX을 설치하고 설정하는 방법을 알아봅니다.

## winget으로 설치

`터미널`을 열고 다음 명령을 내려 MiKTeX이 설치 가능한지 확인합니다.

```powershell
winget search MiKTeX
```

`winget`을 처음 사용한다면 다음과 같은 화면이 나오는데 `Y`를 입력하여 진행합니다.

![winget 사용 동의 화면](/assets/images/windows/miktex/cap003.png)

`MiKTeX`을 검색한 결과가 나타납니다. 여기서 확인한 ID로 `install` 명령을 내리면 됩니다.

![winget 검색 결과](/assets/images/windows/miktex/cap004.png)

```powershell
winget install MiKTeX.MiKTeX
```

다음과 같은 화면이 나타나면서 설치가 진행됩니다. 설치가 진행 중일 때에 아무 것도 건드릴 필요가 없습니다.

![MiKTeX 설치 진행 화면](/assets/images/windows/miktex/cap005.png)

완료되면 **종료** 버튼을 누릅니다. 이것으로 MiKTeX 설치는 완료되었습니다.

> **참고** `winget`을 이용하지 않고 MiKTeX 설치 프로그램을 이용할 수 있습니다. [miktex.org/Download](https://miktex.org/download) 페이지에서 설치 프로그램을 다운로드하여 실행하면 비슷한 과정을 거쳐 설치할 수 있습니다. 이 때에는 "전체 사용자(for all users)"를 위한 설치가 가능한데 일반적으로 "사용자 자신(only for me)"을 위하여 설치하는 것이 관리하기 좋습니다.

## 설치 후

MiKTeX의 설치 후에는 update를 한 번 해주어야 합니다. 일반적으로 업데이트는 한 달에 한 번 정도 하는 것을 추천합니다. 최초에는 필수적으로 업데이트하여야 합니다.

Windows 키(`Windows`)를 눌러서 `MiKTeX-Console`이라는 프로그램을 찾아 실행합니다.

![MiKTeX-Console 실행](/assets/images/windows/miktex/cap006.png)

실행된 상태에서 맨처음에 다음과 같은 경고 메시지가 나오는데, 그냥 **OK**를 눌러서 진행하면 됩니다.

![MiKTeX-Console 경고 메시지](/assets/images/windows/miktex/cap007.png)

여기서 **Check for updates**라는 버튼을 누르고 업데이트 체크가 끝나기를 기다립니다. 왼쪽 메뉴의 Updates 항목으로 이동하여 **Update now** 버튼을 누릅니다.

![업데이트 확인 및 실행](/assets/images/windows/miktex/cap008.png)

![업데이트 진행](/assets/images/windows/miktex/cap009.png)

업데이트가 종료되면 "MiKTeX Console needs to be closed"라는 메시지가 나타나는데 **OK**를 누르면 `MiKTeX-Console`의 실행이 종료됩니다. 업데이트가 잘 완료된 것입니다.

> **참고** 업데이트가 성공적으로 진행되지 않거나 뭔가 문제가 있다는 메시지가 나타나는 것은 MiKTeX 서버에서 업데이트가 진행중이거나 미러 서버가 동작하지 않거나 인터넷에 연결되어 있지 않기 때문입니다. 이럴 때는 몇 시간 기다렸다가 재시도합니다.

## Perl 설치(거의 필수)

이 상태로도 MiKTeX을 운영하는 데 큰 문제는 없으나 Perl이 설치되어 있으면 `latexmk`나 `pdfcrop`, `komkindex`와 같은 필수 유틸리티를 실행할 수 있습니다.

Perl은 다음 명령으로 설치합니다.

```powershell
winget install StrawberryPerl.StrawberryPerl
```

![Strawberry Perl 설치](/assets/images/windows/miktex/cap012.png)

Strawberry Perl 설치 프로그램이 실행되면 "사용자 계정 콘트롤"에서 "게시자를 알 수 없는 이 앱이 디바이스를 변경할 수 있도록 허용하시겠어요?"라고 물어옵니다. 여기서 **예**를 클릭하고 진행합니다.

![사용자 계정 콘트롤](/assets/images/windows/miktex/cap080.png)

## 기타 유틸리티(선택)

추가 유틸리티를 설치하면 MiKTeX의 기능을 더욱 풍부하게 사용할 수 있습니다. 예를 들면 Python과 pygments (latexminted) 같은 것입니다. 다만 이것이 당장 필수적인 것은 아니며 나중에 필요해졌을 때 진행하면 되는 것이므로 이에 대하여는 부록을 참고하기 바랍니다.

> **참고** 이 안내서는 한국어 문서 작성을 주로 하는 상황을 가정하고 있습니다. 만약 LaTeX을 설치하는 목적이 영어 논문을 쓰기 위해서라면 MiKTeX을 설치한 후 그 상태에서 바로 작업을 시작하면 됩니다. 그 경우에 이 안내서는 여기가 끝입니다. 이후 설명하는 폰트 문제라든가 KTUG 사설저장소 패키지 등은 모두 한국어/한글 문서 작성과 관련있는 것입니다.

## 다음 단계

MiKTeX 설치가 완료되었습니다. 이제 <a href="{{ '/tutorials/tex/windows/miktex/texworks/' | relative_url }}">TeXworks 설정</a>으로 진행하세요.

