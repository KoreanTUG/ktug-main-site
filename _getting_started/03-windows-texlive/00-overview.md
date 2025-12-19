---
layout: tutorial
title: Windows에서 TeX Live로 TeX 시작하기
description: Windows에서 TeX Live로 TeX을 시작하는 방법을 안내합니다.
permalink: /getting-started/windows-texlive/
next_tutorial: /getting-started/windows-texlive/prep/
---

이 안내서는 Windows에서 TeX Live를 중심으로 TeX를 시작하는 방법과 절차를 단계별로 안내합니다.

> **참고** 이 안내서는 <a href="{{ '/assets/documents/instguide24.pdf' | relative_url }}">MiKTeX으로 구축하는 작업 환경</a>(Nova de Hi, likesam, aud, 2025)에 기반하여 작성되었습니다. 저자들께 감사드립니다.

## 배포판의 선택

Windows에서 TeX을 시작하려면 먼저 [MiKTeX](https://miktex.org)과 [TeX Live](https://tug.org/texlive/)의 두 TeX 배포판 가운데 하나를 선택해야 합니다. 2025년 현재 두 배포판의 차이는 크지 않으며 설치 운영의 편의성이나 시스템 관리 방식이 조금 다릅니다. 다음 표는 두 배포판의 특징을 비교한 것입니다.

| 비교 항목 | MiKTeX | TeX Live |
|:-------:|:------:|:--------:|
| 파일 시스템 한글 | 사용자 이름, 문서명에 한글, 공백문자 포함 가능 | 프로그램에 따라 오류 발생 가능성 존재 |
| KTUG 사설저장소 | 미지원(간접 이용) | 지원 |
| TeX 표준 | 대체로 준수 | 적극 준수 |
| 패키지 업데이트 | 느림 | 빠름 |
| 배포판 업데이트 | 지속적 업데이트 | 매년 재설치 |

KTUG 방문자 및 KTS 회원들은 대체로 TeX Live를 선호하는 경향이 있습니다. 따라서 문제가 발생했을 때 도움을 얻기에는 TeX Live가 낫습니다. 사용자가 더 많기 때문입니다. 두 TeX 배포판을 함께 설치하여 사용하는 것은 불가능합니다.

## 구성

이 안내서는 다음과 같이 구성되어 있습니다.

1. <a href="{{ '/getting-started/windows-texlive/prep/' | relative_url }}">준비하기</a>: winget 설치 및 터미널 사용법
2. <a href="{{ '/getting-started/windows-texlive/install/' | relative_url }}">TeX Live 설치</a>: TeX Live 설치 방법
3. <a href="{{ '/getting-started/windows-texlive/texworks/' | relative_url }}">TeXworks 설정</a>: 기본 에디터 설정
4. <a href="{{ '/getting-started/windows-texlive/first-doc/' | relative_url }}">첫 문서 작성하기</a>: 첫 문서 작성 및 컴파일
5. <a href="{{ '/getting-started/windows-texlive/fonts/' | relative_url }}">폰트 설치</a>: 한글 폰트 설치
6. <a href="{{ '/getting-started/windows-texlive/ktug-repo/' | relative_url }}">KTUG 사설저장소 패키지</a>: 한국어 문서 작성을 위한 KTUG 사설저장소 설정
7. <a href="{{ '/getting-started/windows-texlive/vscode/' | relative_url }}">Visual Studio Code 사용하기</a>: VS Code 에디터 설정
8. <a href="{{ '/getting-started/windows-texlive/lshort/' | relative_url }}">lshort-ko 학습하기</a>:LaTeX 학습 자료
9. <a href="{{ '/getting-started/windows-texlive/utils/' | relative_url }}">부록 A: 기타 유틸리티</a>: Python, SumatraPDF 등 추가 도구
10. <a href="{{ '/getting-started/windows-texlive/ktug-repo-adv/' | relative_url }}">부록 B: KTUG 사설저장소 추가 설정</a>: KTUG 사설저장소 고급 설정

## 다음 단계

먼저 <a href="{{ '/getting-started/windows-texlive/prep/' | relative_url }}">준비하기</a> 페이지부터 시작하세요.
