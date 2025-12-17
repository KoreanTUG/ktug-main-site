---
title: 첫 문서 작성하기
layout: tutorial
description: 첫 LaTeX 문서를 작성하고 MiKTeX의 자동 패키지 설치 기능을 사용해 봅니다.
permalink: /getting-started/windows/miktex/first-doc/
prev_tutorial: /getting-started/windows/miktex/texworks/
next_tutorial: /getting-started/windows/miktex/fonts/
---

MiKTeX의 대표적인 기능 중 하나가 "MiKTeX 패키지 관리자(mpm)"를 이용하여 필요한 패키지를 온라인에서 즉시 불러와 설치하는 것입니다. TeX Live에서는 이 기능이 없거나 취약하기 때문에 미리 전체 설치를 하도록 권장하고 있는 반면, MiKTeX은 처음에 가벼운 규모의 텍 시스템만을 설치하고 작업 중에 필요한 것은 그때그때 불러오도록 하고 있습니다.

> **참고** 따라서 작업 중에는 기계가 항상 온라인에 연결되어 있어야 합니다.

일단 mpm에 의하여 설치된 패키지는 그 후 설치된 상태가 유지되기 때문에 처음 한 번 설치한 후에는 다시 같은 패키지를 설치하려고 하지 않습니다. 그리고 `MiKTeX-Console`에서 업데이트를 지시하면 현재 설치된 패키지에 업데이트가 있을 때 모두 업데이트합니다.

## 첫 문서 작성

TeXworks를 실행하여 다음 그림과 같은 문서를 작성합니다. 한글이 한 글자 이상 있는 간단한 샘플이면 됩니다.

```latex
\documentclass{oblivoir}

\begin{document}

첫 문서. 테스트

\end{document}
```

<img src="{{ '/assets/images/windows/miktex/cap017.png' | relative_url }}" alt="첫 문서 작성">

여기서 조판 버튼(▶)을 누르거나 `Ctrl+T` 단축키를 눌러서 문서의 컴파일을 시도합니다. 그러면 (처음 컴파일하는 경우에) 필요한 패키지를 인스톨하기 위하여 다음과 같은 화면이 나타납니다.

<img src="{{ '/assets/images/windows/miktex/cap018.png' | relative_url }}" alt="패키지 설치 확인">

여기서 그냥 **Install**을 누르면 필요한 패키지를 인스톨하고 계속하지만 새로운 패키지에 대하여 같은 화면이 또다시 나타납니다. 그러므로 "Always show this dialog" 앞의 체크를 눌러 없애서 MiKTeX이 스스로 필요하면 패키지를 설치하게 합니다.

컴파일이 진행되는 동안 편집 화면의 아래쪽에 컴파일 진행 과정이 보입니다.

<img src="{{ '/assets/images/windows/miktex/cap020.png' | relative_url }}" alt="컴파일 진행 과정">

만약 컴파일이 성공하지 못하고 에러스톱이 발생하는 경우에는 컴파일 콘솔 화면의 더 아래에 한 줄짜리 Interactive Input bar가 있으므로 여기에 `x`를 써넣고 `Enter`를 치면 컴파일이 중단됩니다. `e`를 써넣어서 에러 위치로 이동할 수도 있고 `r`로써 에러를 무시하고 끝까지 시도하게 할 수 있습니다.

컴파일이 성공하면 pdf 미리보기 화면이 다음과 같이 나타납니다.

<img src="{{ '/assets/images/windows/miktex/cap021.png' | relative_url }}" alt="PDF 미리보기">

## 자동 패키지 설치 기능에 대하여 알아두어야 할 사항

MiKTeX의 mpm은 매우 매력적이고 훌륭한 기능이지만 다음 사항을 알아두어야 당황하지 않을 수 있습니다.

1. **폰트 패키지의 경우**: MiKTeX에서 제공하는 패키지라 하더라도 스타일/매크로 패키지가 아니라 오픈타입 폰트 패키지인 경우에는 문서 내의 폰트 호출 방법에 따라 자동 설치가 동작하지 않을 수 있습니다. 다음 장의 폰트 호출 부분에 설명해두었습니다.

2. **재시도가 필요한 경우**: 일부 패키지의 경우 설치가 되었음에도 컴파일에 실패한 것처럼 표시되는 경우가 있습니다. 이 때는 컴파일을 다시 시도하면 됩니다.

3. **서버 문제**: 가끔 MiKTeX 미러 서버가 먹통이 되거나 서버 업데이트가 진행 중일 때 자동 패키지 설치가 동작하지 않을 수 있습니다. 이 경우는 어쩔 도리가 없으므로 문제가 해결될 때까지 기다려야 합니다. 대체로 수 시간 정도가 지난 후에 다시 시도하면 성공합니다.

> **참고** MiKTeX은 미러 서버를 자동으로 선택하는 것이 디폴트이지만 사용자가 이를 강제 지정할 수도 있습니다. 만약 위의 (3)과 같은 상황에서 긴급하다면 `MiKTeX-Console`의 `Updates`에서 "Retrieve from"의 "Change..." 버튼을 클릭하여 (현재) 안정적으로 동작하는 서버를 지정하면 됩니다. 일부 경험자의 보고에 의하면 우리나라의 kakao 서버에서 문제가 생기면 일본의 jaist 서버를 선택함으로써 해결할 경우가 많았다고 합니다.

## 다음 단계

첫 문서 작성이 완료되었습니다. 이제 <a href="{{ '/getting-started/windows/miktex/fonts/' | relative_url }}">폰트 설치</a>로 진행하세요.