---
layout: tutorial
title: Visual Studio Code 사용하기
description: Visual Studio Code를 LaTeX 에디터로 설정하고 LaTeX Workshop 확장을 사용하는 방법을 학습합니다.
permalink: /tutorials/tex/windows/miktex/vscode/
prev_tutorial: /tutorials/tex/windows/miktex/ktug-repo/
next_tutorial: /tutorials/tex/windows/miktex/lshort/
---

## 왜 VS Code인가?

LaTeX을 본격적으로 쓰게 되면 대부분의 시간을 에디터와 함께 보내게 됩니다. 에디터가 얼마나 편리하고 손에 맞느냐에 따라 작업 생산성에 극명한 차이가 나기 때문에 자신에게 적합한 에디터를 발견하고 길들이는 것은 대단히 중요한 일입니다.

MiKTeX이 기본 제공하는 [TeXworks](https://www.tug.org/texworks/)도 나쁘지 않은 에디터이고 [TeX Studio](https://www.texstudio.org)라든가 [Texmaker](https://www.xm1math.net/texmaker/) 같은 LaTeX 전용 에디터가 있으나, 이 안내서는 [Visual Studio Code](https://code.visualstudio.com)라는 범용 에디터를 LaTeX 에디터로 사용하는 상황을 가정하였습니다. 이 에디터는 다른 전용 에디터와 달리 LaTeX 사용 상황에 알맞게 약간의 설정 작업을 해주어야 합니다. 이 일은 조금 귀찮지만 충분히 시도해볼 가치가 있습니다.

> **참고** 만약 TeXworks나 TeX Studio로 만족한다면 이 장은 건너뛰어도 좋습니다.

이 안내서는 VS Code에 다음을 설명하기로 합니다:

1. `LaTeXworkshop`이라는 확장 프로그램을 설치하고
2. 한글 문서 작성 상황에 적합하도록 XeLaTeX을 기본 엔진으로 바꾸고
3. PDF 뷰어로 소스와 연동하는 것

더 많은 상세한 기능을 모두 설명하지는 않습니다.

## VS Code를 주 에디터로 사용하기 위한 권장 설치 사항

이 안내서는 코딩 폰트를 [D2Coding](https://github.com/naver/d2codingfont)으로 하는 경우를 권장 사항으로 작성합니다. 따라서 폰트를 미리 설치해 두어야 합니다.

- **D2Coding Font**: 공개 코딩 글꼴입니다. [github.com/naver/d2codingfont](https://github.com/naver/d2codingfont/releases)에서 배포 zip 파일을 다운로드하여 풀면 `D2Coding`, `D2CodingAll`, `D2CodingLigature`라는 폴더가 생겨납니다. 이 가운데 `D2Coding`에 있는 `ttf` 파일 두 개를 선택하여 **설치**합니다.

> **참고** D2CodingLigature의 설치 여부, `ttc`로 설치할 것인지 `ttf`로 설치할 것인지는 모두 본인이 알아서 선택하면 됩니다. 잘 모르겠으면 위에서 제시한 대로 D2Coding `ttf` 2개를 선택하여 설치하면 되겠습니다.

## VS Code의 설치와 Ctrl+Shift+P

### 설치

`winget`으로 설치합니다.

```powershell
winget install Microsoft.VisualStudioCode
```

![VS Code 설치](/assets/images/windows/miktex/cap031.png)

그러면 VS Code의 설치가 시작됩니다.

![VS Code 설치 진행](/assets/images/windows/miktex/cap032.png)

설치가 완료된 후에 `Windows`를 눌러서 `code`라고 입력하여 이 앱을 잘 실행할 수 있는지 확인합니다.

![VS Code 실행](/assets/images/windows/miktex/cap033.png)

> **참고** VS Code는 `Windows 탐색기`의 Context Menu에 등록되기 때문에 편집할 수 있는 파일을 선택하고 우클릭 하여 "연결 프로그램"을 찾아보면 VS Code로 해당 파일을 열 수 있습니다.

> **참고** `winget`에 의하지 않고 웹사이트에서 다운로드하여도 됩니다. [code.visualstudio.com](https://code.visualstudio.com/)을 방문하여 다운로드 버튼을 누릅니다. 이렇게 하는 경우에는 설치 위치와 권한을 사용자가 선택할 수 있는데, 이 안내서는 이러한 상황은 고려하지 않습니다.

### 첫 실행

이제 VS Code를 처음 실행하면 다음과 같은 화면이 됩니다.

![VS Code 첫 실행](/assets/images/windows/miktex/cap034.png)

여기서 맨처음 해야 할 일은 VS Code의 인터페이스 언어를 한국어로 설정하는 것입니다. 낯선(?) 영어로 고민하지 말고 한국어 언어 지원을 활성화합니다.

> **참고** 한국어화하지 않고 영어 그대로 쓰는 것이 더 멋져보일 수도 있습니다(?)

이를 위해서 맨처음 발견해야 하는 것은 "Market Place"라는 곳을 열어보는 것인데, 화면 왼쪽에 있는 확장 아이콘을 누릅니다. 이곳에는 VS Code의 기능을 풍부하게 하는 수많은 확장 애드온(extensions)을 선택하여 활용할 수 있는 곳입니다. VS Code의 최대 장점 중의 하나가 이 확장 기능입니다.

다음 그림은 마켓플레이스를 열었을 때의 모양을 보여줍니다. 아무것도 설치한 것이 없으면 몇 가지를 추천하는데 일단 우리와는 큰 상관 없는 것이 많으므로 한국어 팩부터 설치하기로 합니다.

![마켓플레이스](/assets/images/windows/miktex/cap035.png)

제일 위에 있는 검색 바에 "korean"이라고 써넣으면 한국어 언어 패키지를 설치할 수 있습니다. 다음 그림과 같이 진행됩니다. 언어 패키지가 활성화된 이후에 VS Code를 한 번 닫았다가 다시 실행하여야 합니다.

![한국어 언어 팩 설치](/assets/images/windows/miktex/cap036.png)

> **참고** 마켓 플레이스를 눌러서 선택하지 않고 VS Code의 "모든 명령 보이기(Show all commands)"로 명령 팔레트(Command Palette)를 연 상태에서 직접 명령을 지정하여 설치하는 방법도 있습니다. `Configure Display Language` 명령을 입력하고 "Korean"을 선택하면 됩니다. 물론, 다시 시작하여야 합니다.

### Ctrl+Shift+P

VS Code에는 명령 팔레트라고 부르는 조그마한 입력창이 존재합니다. 이것은 에디터의 기능이 너무 많아서 메뉴로는 다 보여줄 수 없는 관계로 메뉴에 있거나 없거나 숨어 있는 기능까지 에디터 자체를 제어하는 모든 명령을 직접 입력하여 실행할 수 있는 곳입니다.

명령 팔레트를 여는 것은 `Ctrl+Shift+P` 단축키가 가장 쉽습니다. 이 단축키는 앞으로 자주 사용하게 될 것이므로 손에 익혀두세요. 연습삼아 단축키를 누르고 "help"라고 써넣어 봅니다. 어떤 도움말을 준비하고 있는지 볼 수 있을 것입니다.

### 폴더 열기와 작업 공간

이제 파일을 하나 만들어서 저장해보려 합니다.

먼저, 작업 폴더를 하나 만듭니다. `탐색기`의 "문서" 폴더 아래에 "이지영의 레이텍 연습"이라는 폴더를 작성합니다. (우클릭 후에 "새로 만들기"에서 "폴더"를 선택하여 새 폴더를 만들 수 있습니다.)

![새 폴더 만들기](/assets/images/windows/miktex/cap054.png)

> **참고** MiKTeX의 장점 하나가 파일 이름에 한글, 띄어쓰기가 있어도 문서 처리에 문제가 발생하지 않는다는 점입니다. 그러므로 폴더와 파일 이름을 자유롭게 지어도 됩니다. Windows용 TeX Live는 그렇지 않아서 반드시 ASCII 문자로만 띄어쓰기 없이 짓도록 권장하고 있다는 사실과 비교해보세요.

이제 VS Code에서 **탐색기 버튼**(왼쪽 바의 제일 위에 있는 아이콘)을 누르고 "폴더 열기"를 선택하여 방금 만든 폴더를 엽니다.

![폴더 열기](/assets/images/windows/miktex/cap052.png)

이 상태에서 새로 편집하는 파일은 방금 연 폴더에 저장됩니다. 이곳이 작업 공간이 되는 것입니다.

적당한 내용으로 새로운 파일을 하나 작성(`Ctrl+N`)하고 저장하여 봅니다. 주로 LaTeX 파일을 다루게 될 것이므로 확장자를 `.tex`으로 하는 것이 좋습니다.

이후, 이 아이콘을 눌러서 작업 중인 파일을 즉시 불러올 수 있습니다.

### 신뢰할 수 있는 작업 공간

다음 그림과 같은 상황은 위에 설명한 방법으로 연 작업 공간이 아닌 곳에 있는 파일을 열었을 때 주로 만나게 됩니다. 한번 열어보는 파일이라면 신뢰하는 것으로 하고 작업을 계속하면 되지만 지속적으로 작성하는 문서라면 작업 공간을 설정하는 것이 더 낫습니다.

![신뢰할 수 있는 작업 공간](/assets/images/windows/miktex/cap037.png)

## 사용자 설정

하루 종일 대해야 하는 편집기가 편하게 느껴지지 않는다면 생산성이 떨어질 수밖에 없습니다. 미려한 폰트, 적절한 행간, 그리고 입력과 컴파일에 도움을 주는 제반 요소들을 자신에게 가장 적합하게 꾸며두는 것은 권장할 만한 일입니다. 이것은 전적으로 개인 취향이 반영되기 때문에 사용 시간이 길어질수록 점점 자신에게 맞는 것을 찾아갈 수 있을 것입니다. 여기서는 폰트와 색상 설정에 대해서 약간의 힌트를 제공하면서 "사용자 설정" 방법을 배워봅니다.

메뉴의 **파일** > **기본 설정** 아래의 하위 메뉴로 (1) 설정, (2) 바로가기 키, (3) 테마 등을 선택해둘 수 있는데, 우선 (1) 설정에 대해 간단히 알아봅니다.

![사용자 설정](/assets/images/windows/miktex/cap057.png)

설정에서는 폰트 크기와 폰트 종류 정도를 지정해봅니다. 다음 그림은 현재 필자의 설정입니다.

![폰트 설정](/assets/images/windows/miktex/cap058.png)

즉, 폰트 크기를 18로 하고 폰트 종류(font family)를 Consolas와 D2Coding을 차례로 지정했습니다. 이렇게 해두면 한글은 D2Coding으로, 영문자는 Consolas로 표시합니다. (폰트 크기를 18로 한 것은 필자의 시력 때문이므로 자신에게 맞게.)

이 상태에서 `Ctrl+Shift+P`를 눌러서 명령 팔레트를 열어 "user settings" 정도를 입력하면 "Preferences: Open User Settings (JSON)"이라는 명령과 "Preferences:Open User Settings"라는 명령이 사용 가능함을 보여줄 것입니다. 이 가운데 (JSON)이 붙은 것은 사용자 설정을 직접 편집할 수 있게 하는 것이고, (JSON)이 없는 것은 방금 연 설정 창입니다.

(JSON)이 붙은 "기본 설정: 사용자 설정 열기(JSON)"을 선택합니다. 그러면

```json
"editor.fontsize": 18,
"editor.fontfamily": "'Consolas','D2Coding','DejaVu Sans Mono'"
```

이런 사항이 기록되어 있을 텐데 이것은 조금 전 "설정" 창에서 행한 설정값이 적혀 있는 것입니다.

> **참고** 이 파일은 각 항목이 JSON 문법, 즉 `"key": "value"` 형식으로 되어 있고 한 항목이 끝나면 쉼표(,)를 적어야 합니다.

앞으로 사용자 설정 파일을 직접 편집하는 방식으로 LaTeX 관련 설정을 하는 방법을 소개할 것임을 알아두세요.

## LaTeXWorkshop Extension 설치

LaTeXWorkshop을 설치합니다.

> **참고** 이 확장은 James Yu가 만들고 관리하는 것으로 매우 풍부하고 강력한 LaTeX 사용 환경을 제공하는 것으로 유명합니다. VS Code로 `.tex` 파일을 열었을 때 이 확장을 추천해주기도 합니다.

"마켓플레이스"를 열고 latexworkshop을 검색하면 바로 설치할 수 있습니다.

> **참고** `Ctrl+Shift+P`를 누르고 `ext install latex-workshop`을 입력하여 설치하는 방법도 있습니다.

`.tex` 파일을 열어보면 문법 강조가 활성화되는 것을 볼 수 있는데 이것은 latexworkshop의 기본 기능 가운데 하나입니다. `.tex` 파일을 열어서 latexworkshop이 활성화되면 `Ctrl+Alt+X` 단축키나 왼쪽 아이콘바의 **TeX** 아이콘을 눌러서 latexworkshop의 메뉴를 열어볼 수 있습니다. 이것을 훑어보면 어떤 일을 할 수 있는지 대략 알 수 있게 됩니다.

![LaTeX Workshop 메뉴](/assets/images/windows/miktex/cap059.png)

> **참고** 현재까지 진행한 상태에서 tex 파일을 저장하면 latexworkshop의 기본 설정에 따라서 latexmk/pdflatex이 동작하면서 build를 시도합니다. 그러나 만약 소스가 XeLaTeX을 위한 것이라면 폰트 활용 관련 이런저런 에러가 발생했다면서 귀찮은 메시지가 나타날 것입니다. 아래 이어지는 설정을 적용하면 이 문제는 사라지므로 일단 무시합니다. 혹은, 아예 Perl이 동작하지 않는다는 메시지를 만날 수도 있는데 이것은 Perl 설치를 미루었기 때문입니다. VS Code가 채택하고 있는 기본 빌드 유틸리티가 Perl 스크립트인 `latexmk`이기 때문입니다.

## 사용자화: 컴파일

이어지는 "사용자화" 관련 내용은 개인에 따라 다른 선택을 할 수 있습니다. 이 안내서의 목적은 일단 따라해보는 것이므로, VS Code에 익숙한 경우라면 무시합니다.

### 저장시 빌드

latexworkshop을 처음 설치한 상태에서 (1) 기본 컴파일 엔진은 pdflatex, (2) 저장시 빌드(컴파일)은 켜짐 상태입니다.

> **참고** 저장시 빌드는 긴 글을 쓰는 사람에게 꽤 편리한 기능입니다. 그러나 LaTeX을 처음 배우거나 LaTeX 프로그래밍을 할 때는 오히려 방해가 됩니다.

이 가운데 "저장시 빌드" 옵션을 끄도록 합니다. 빌드(pdf 만들기)는 내가 원할 때 단축키를 눌러서 하는 방식으로 설정하겠습니다.

`Ctrl+Shift+P`를 눌러서 "사용자 설정 열기(JSON)"을 선택하여 `settings.json`을 엽니다. 여기서 다음 한 줄을 파일 마지막의 닫는 `}` 앞에 복사해 넣고 저장합니다.

> **참고** 직전 항목의 마지막에 쉼표가 있어야 합니다.

```json
"latex-workshop.latex.autoBuild.run": "never",
```

> **참고** 이 동작은 메뉴의 설정을 눌러서 열리는 일반 "사용자 설정"에서 `autobuild`로 검색하여 찾은 다음 선택할 수도 있습니다.

### 컴파일 엔진

> **참고** 만약 LaTeX을 쓰는 목적이 한글이 아니고 영어로 된 글이라면 pdfLaTeX은 좋은 선택입니다. 굳이 XeLaTeX으로 바꿀 필요 없는 것입니다.

같은 방법으로 `settings.json`을 열어서, 다음 한 줄을 추가합니다.

```json
"latex-workshop.latex.recipe.default": "latexmk (xelatex)",
```

> **참고** VS Code에서 컴파일(빌드) 엔진을 선택하는 방법은 (1) 항상 특정 엔진으로 컴파일되게 하는 것, (2) 마지막에 사용한 레시피를 다시 사용하게 하는 것, (3) 파일의 매직 코멘트를 읽어서 선택하게 하는 것 등 여러 방법이 있습니다. 나중에 익숙해지면 이 중 자신에게 맞는 것을 골라서 설정해보는 것을 권합니다.

이제 `Ctrl+Alt+B`를 눌러서 현재 편집 중인 파일을 컴파일해봅니다. 컴파일 과정을 보려면 `Ctrl+Shift+U`를 누른 다음 "작업"을 "LaTeX Compiler"로 하면 됩니다.

![컴파일 진행](/assets/images/windows/miktex/cap060.png)

> **참고** 편집 중인 화면에서 컴파일러를 실행하는 방법은 여러 가지가 있는데, 단축키 이외에도 `Ctrl+Shift+P`로 명령 팔레트를 열어서 "recipe" 정도를 써넣으면 "LaTeXworkshop: Build with Recipes" 항목을 선택할 수 있고 이로부터 원하는 컴파일러를 동작하게 할 수 있습니다. 이것은 `Ctrl+Alt+X`로 latexworkshop 메뉴를 열어서 "Build Latex Project"에서 레시피를 고르는 것과 마찬가지입니다.

## PDF Viewer와 SyncTeX

### PDF를 여는 방법

> **참고** 컴파일 과정에서 에러가 발생하고 이를 발견하고 수정하는 것은 이 안내서의 범위를 넘어섭니다. 어떻게든 소스를 에러 없이 작성하여 컴파일까지 성공해봅시다.

이제 앞서 작성하던 파일을 하나 엽니다. 그런 다음 `latexmk (xelatex)` 레시피로 컴파일합니다. 에러 없이 컴파일되었다고 가정하겠습니다.

VS Code에는 내장 PDF Viewer가 있습니다. `Ctrl+Alt+V` 단축키를 누르면 (PDF가 잘 생성되었을 때) PDF 파일이 화면 오른쪽에 열립니다.

> **참고** latexworkshop 메뉴에서 "View LaTeX PDF"의 "View in VS Code tab"이라는 명령으로 바로 열어볼 수 있습니다. 물론 명령 팔레트에서 "VSCode tab"으로 검색하는 편이 빠릅니다. 이 때문에 긴 글을 쓰는 사람에게 "저장시 빌드"가 편리할 때가 있다고 한 것입니다. 그러나 무수한 에러와 싸워야 하는 처음 사용자에게는 저장시 빌드가 오히려 방해가 되는 것이라서 이 안내서는 그것을 끄도록 안내했습니다.

![PDF 미리보기](/assets/images/windows/miktex/cap070.jpg)

우리는 앞서 "저장시 빌드" 옵션을 꺼두었기 때문에 왼쪽 소스 편집창의 내용이 변해도 PDF의 변경을 바로 알아차릴 수 없지만 만약 "저장시 빌드"가 켜져 있다면 소스를 변경하고 저장하는 순간 컴파일이 이루어지고 PDF의 내용도 변화합니다.

PDF 보기 창의 적당한 위치에서 `Ctrl`+[Click]하면 그 위치에 해당하는 곳으로 커서가 이동합니다. 그리고 편집창에서 `Ctrl+Alt+J`를 누르면 현재 커서가 있는 곳에 해당하는 위치로 PDF 보기 위치도 바뀝니다. 주의할 것은, 오른쪽 뷰어 창이 열리지 않은 상태에서는 `Ctrl+Alt+J` 키가 동작하지 않는다는 것입니다. 그러므로 먼저 `Ctrl+Alt+V`로 PDF 뷰어를 열고, 그 다음에 "소스 위치에 해당하는 위치로 PDF 열기"(Forward Search)를 해야 합니다.

이와 같이 소스 편집창과 PDF 보기 창을 상호 동조하는 것을 SyncTeX이라고 하는데, 흔히 소스에서 PDF로 찾아가는 것을 "Forward Search", PDF 창에서 해당하는 소스 위치로 이동하는 것을 "Inverse Search" 또는 "Backward Search"라고 부릅니다. 이 기능이 잘 동작하는지 확인해두어야 합니다.

> **참고** 이 안내서 작성자의 개인적인 취향 때문에 처음에는 외장 뷰어를 설치하고 설정하는 내용을 포함하고 있었습니다. 그러나 그 과정이 너무 번거로워서 처음 사용자를 당황하게 만든다는 지적이 있어서 이를 부록으로 돌렸습니다. 관심있는 분은 <a href="{{ '/tutorials/tex/windows/miktex/utils/' | relative_url }}">부록</a>의 SumatraPDF 관련 내용을 참고하기 바랍니다.

## 다음 단계

Visual Studio Code 설정이 완료되었습니다. 이제 <a href="{{ '/tutorials/tex/windows/miktex/lshort/' | relative_url }}">lshort-ko 학습하기</a>로 진행하세요.

