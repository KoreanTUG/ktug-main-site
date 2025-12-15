---
layout: tutorial
title: 시작하기 전에
description: TeX를 시작하기 전에 알아두어야 하는 내용입니다.
permalink: /tutorials/tex/before-you-start/
next_tutorial: /tutorials/tex/environment/
---

## TeX의 작동 방식: 마크업과 컴파일

TeX은 워드 프로세서처럼 보이는 그대로 편집하는 [WYSIWYG](https://en.wikipedia.org/wiki/WYSIWYG)(What You See Is What You Get) 방식이 아니라, **[마크업](https://en.wikipedia.org/wiki/Markup_language)(markup)** 기반의 문서 조판 시스템입니다.

- 사용자는 **`.tex` 소스 문서**를 작성하고
- 이를 **컴파일**하여 PDF 등의 **결과 문서**를 생성합니다.
- 원하는 모양이 나올 때까지 **소스 작성 → 컴파일 → 결과 확인 → 수정 → 재컴파일**의 사이클을 반복합니다.

즉, **문서를 프로그래밍하듯 작성하는 방식**이라고 이해할 수 있습니다. 다음 그림은 TeX 문서 작성의 워크플로우를 도식화한 것입니다.

<!--
![TeX 문서 작성 워크플로우](/assets/images/before-start/tex-workflow.png){:style="max-width: 70%; height: auto; display: block; margin: 0 auto;"}
-->

![TeX 문서 작성 워크플로우](/assets/images/before-you-start/tex-workflow.png)

## TeX 사용을 위한 세 가지 핵심 도구

TeX으로 문서를 작성하고 출력하기 위해서는 다음 세 가지 도구가 필요합니다.

### 편집기(Editor)

- 소스 문서를 작성하고 편집하는 텍스트 편집기
- 일반 텍스트 편집기도 사용 가능하지만 TeX 전용 편집기는 문법 강조, 자동 완성, 단축키 등의 편의 기능을 제공
- 예: [TeXstudio](https://www.texstudio.org), [TeXworks](https://www.tug.org/texworks/), [VS Code](https://code.visualstudio.com) + [LaTeX Workshop 확장](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop), [Emacs](https://en.wikipedia.org/wiki/Emacs), [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor)) 등

### 컴파일러(Compiler)

- 작성한 소스 문서를 읽어 최종 출력 문서로 변환하는 프로그램
- TeX 엔진이 핵심 역할을 수행
- 예: pdfLaTeX, XeLaTeX, LuaLaTeX 등

### 뷰어(Viewer)

- 컴파일된 결과 문서(보통 PDF)를 화면에 표시하는 프로그램
- 많은 TeX 편집기에 내장되어 있음
- 예: PDF 뷰어(Adobe Reader, SumatraPDF, Skim, Evince 등)

## TeX 작업 환경 구축

앞서 설명한 바와 같이 TeX를 이용한 문서 작성은 프로그래밍 언어로 코딩을 하여 목표 프로그램을 얻는 것과 비슷합니다. 따라서 TeX로 문서 작성을 하기 위해서는 위에서 설명한 핵심 도구를 비롯하여 다양한 부수 프로그램과 파일들을 설치해야 하고, 사용자의 상황에 적합한 환경 설정 또한 필요합니다.

### TeX 배포판의 설치

개별적으로 컴파일러, 폰트, 패키지 등을 설치하는 것은 매우 복잡합니다. 이러한 불편함을 해소하기 위해 **TeX 배포판(TeX Distribution)**이 존재합니다.

TeX 배포판은 다음의 모든 것을 포함하는 종합 패키지입니다.

- TeX 엔진: 컴파일러의 핵심
- 관련 프로그램들: BibTeX, MakeIndex 등 보조 도구들
- 클래스와 패키지: 문서 스타일과 기능을 확장하는 수천 개의 파일들
- 폰트: 다양한 타이포그래피를 위한 폰트 파일들
- 설명서: 각종 매뉴얼과 문서

대표적인 TeX 배포판은 다음과 같은 것들이 있습니다.

- [TeX Live](https://www.tug.org/texlive/): 크로스 플랫폼(Windows, macOS, Linux)
- [MiKTeX](https://miktex.org): 주로 Windows용
- [MacTeX](https://www.tug.org/mactex/): macOS 전용(TeX Live 기반)

일반적으로 사용자는 자신의 운영체제에 맞는 TeX 배포판을 로컬 컴퓨터에 설치하여 사용합니다.

### TeX 작업 환경 설정

TeX 배포판을 설치한 이후에는 사용자가 선택한 편집기의 설정을 포함한 여러 도구의 추가 설정 과정이 필요합니다. 경우에 따라서는 효율적이며 효과적인 작업을 위해 TeX 배포판에 포함되지 않은 폰트나 편집기를 설치하고 설정해야 하기도 합니다.

## 온라인 TeX 서비스

로컬 컴퓨터에 수 GB에 달하는 TeX 배포판을 설치하고 복잡한 작업 환경 설정을 하지 않고도 TeX을 사용할 수 있는 방법이 있습니다. 바로 온라인 TeX 서비스입니다.
온라인 TeX 서비스의 장점은 아래와 같습니다.

- 설치 불필요: 웹 브라우저만 있으면 즉시 사용 가능
- 자동 업데이트: 항상 최신 버전의 TeX 환경 사용
- 협업 기능: 여러 사용자가 동시에 문서 작성 가능
- 클라우드 저장: 문서가 자동으로 저장되고 어디서나 접근 가능

다음은 대표적인 온라인 TeX 서비스입니다.

- [Murfy](https://www.murfy.ai): 문서 템플릿과 AI 기능이 제공되는 서비스
- [Overleaf](https://www.overleaf.com): 가장 인기 있는 온라인 LaTeX 편집기
- [Papeeria](https://papeeria.com): 협업 기능이 강화된 서비스
- [CoCalc](https://cocalc.com): 과학 계산 기능과 통합된 플랫폼

초보자에게는 설치와 설정의 번거로움 없이 바로 시작할 수 있는 온라인 서비스가 학습 초기에 유용할 수 있습니다.

## 다음 단계

다음 단계는 사용자의 운영체제에 맞는 TeX 작업 환경을 구축하는 것입니다.

- <a href="{{ '/tutorials/tex/environment/' | relative_url }}">TeX 작업 환경 구축</a>: 운영체제별 TeX 작업 환경 구축 절차와 방법을 안내합니다.
