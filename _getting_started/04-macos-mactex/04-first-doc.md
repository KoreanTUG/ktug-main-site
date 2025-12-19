---
title: 첫 문서 작성하기
layout: tutorial
description: 첫 LaTeX 문서를 작성하여 컴파일해 봅니다.
permalink: /getting-started/macos-mactex/first-doc/
prev_tutorial: /getting-started/macos-mactex/texshop/
next_tutorial: /getting-started/macos-mactex/fonts/
---

## 첫 문서 작성

TeXShop을 실행하여 다음 그림과 같은 문서를 작성합니다. 한글이 한 글자 이상 있는 간단한 샘플이면 됩니다.

```latex
\documentclass{oblivoir}

\begin{document}

첫 문서. 테스트

\end{document}
```

<img src="{{ '/assets/images/macos-mactex/texshop-new-doc.png' | relative_url }}" alt="첫 문서 작성">

여기서 엔진 드롭다운 메뉴에서 "XeLaTeX"을 선택하고 **Typeset** 버튼을 누르거나 `Cmd+T` 단축키를 눌러서 문서의 컴파일을 시도합니다. 파일이 저장되지 않은 상태이면 먼저 파일 저장 대화창이 표시됩니다. 아래 예시에서는 `first-document.tex`로 저장합니다.

<img src="{{ '/assets/images/macos-mactex/texshop-compile.png' | relative_url }}" alt="TeXShop 파일 저장">

> **참고** TeXShop을 처음 실행하는 경우 TeXShop의 문서 저장 폴더 접근 허용 여부를 묻는 창이 나타납니다. **Allow**를 누르면 됩니다.

파일이 저장된 이후 컴파일이 진행되는 동안 별도의 콘솔 창에서 컴파일 진행 과정이 보입니다.

<img src="{{ '/assets/images/macos-mactex/texshop-console.png' | relative_url }}" alt="TeXShop 컴파일 진행 과정">

만약 컴파일이 성공하지 못하고 에러스톱이 발생하는 경우에는 컴파일 콘솔 화면의 더 아래에 한 줄짜리 Interactive Input bar가 있으므로 여기에 `x`를 써넣고 `Enter`를 치면 컴파일이 중단됩니다. `e`를 써넣어서 에러 위치로 이동할 수도 있고 `r`로써 에러를 무시하고 끝까지 시도하게 할 수 있습니다.

컴파일이 성공하면 pdf 미리보기 화면이 다음과 같이 나타납니다.

<img src="{{ '/assets/images/macos-mactex/texshop-preview.png' | relative_url }}" alt="PDF 미리보기">

## 다음 단계

첫 문서 작성이 완료되었습니다. 이제 <a href="{{ '/getting-started/macos-mactex/fonts/' | relative_url }}">폰트 설치</a>로 진행하세요.