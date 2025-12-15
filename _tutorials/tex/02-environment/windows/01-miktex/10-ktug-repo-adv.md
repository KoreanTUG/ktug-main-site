---
layout: tutorial
title: KTUG 사설저장소 추가 설정
description: KTUG 사설저장소 패키지의 고급 설정 및 arara를 위한 추가 설정을 학습합니다.
permalink: /tutorials/tex/windows/miktex/ktug-repo-adv/
prev_tutorial: /tutorials/tex/windows/miktex/utils/
---

본문의 KTUG 사설저장소 패키지에 관련된 추가사항입니다.

## arara를 위한 추가

한국어 문서의 인덱스 생성을 위한 유틸리티 `komkindex` 스크립트가 있습니다. 이것을 `arara`에서 사용하려면 사설저장소 패키지로 제공하는 `arara-rules-ko`가 필요한데, 이를 설정하는 방법을 설명합니다. arara를 사용하지 않는 경우에는 무시해도 좋습니다.

`texmf-kpr/scripts/arara/rules/` 위치에 있는 `arara-rule-komkindex.yaml` 파일을 다음 폴더 위치로 복사(이동)합니다(사용자 이름이 `****`라고 한다).

```powershell
C:\Users\****\AppData\Roaming\MiKTeX\scripts\arara\rules\
```

이제 다음과 같은 arara directive를 쓸 수 있습니다.

```latex
% arara: komkindex: { koreanfirst: yes, style: kotex}
```

## 사설저장소 패키지의 문서 찾기

MiKTeX의 `texdoc` 명령으로 필요한 문서를 찾아 읽을 수 있습니다. 그런데 위의 방법으로 설치한 사설저장소 패키지에 대해서는 (현재) MiKTeX의 `texdoc`이 동작하지 않습니다. 이 불편을 조금 줄여보는 방법으로 제안된 것이 `kstexdoc`라는 간단한 스크립트입니다. 다음 파일을 다운로드받아서 나오는 `.exe` 파일을 PATH가 걸려 있는 적당한 곳에 복사하고 명령행(또는 PowerShell)에서 사용하면 됩니다.

- <a href="{{ '/assets/downloads/kstexdoc.7z' | relative_url }}">kstexdoc.7z</a>

예컨대, `jiwonlipsum` 패키지 문서를 읽으려면 명령 프롬프트(cmd) 또는 PowerShell 터미널에서

```powershell
kstexdoc jiwonlipsum
```

이런 식으로 사용할 수 있습니다.

## 마무리

이제 MiKTeX 설치 및 설정이 완료되었습니다. LaTeX 문서 작성을 시작할 준비가 되었습니다!
