---
layout: tutorial
title: KTUG 사설저장소 추가 설정
description: KTUG 사설저장소 패키지의 고급 설정 및 arara를 위한 추가 설정을 학습합니다.
permalink: /getting-started/macos-mactex/ktug-repo-adv/
prev_tutorial: /getting-started/macos-mactex/utils/
---

본문의 KTUG 사설저장소 패키지에 관련된 추가사항입니다.

## arara 사용을 위한 패키지 설치

한국어 문서의 인덱스 생성을 위한 유틸리티 `komkindex` 스크립트가 있습니다. 이것을 `arara`에서 사용하려면 KTUG 사설저장소 패키지로 제공하는 `arara-rules-ko`가 필요한데, 이를 설치하고 설정하는 방법을 설명합니다. arara를 사용하지 않는 경우에는 무시해도 좋습니다.

`Cmd+Space` 키를 눌러 `스포트라이트`를 실행하고 'term'을 입력하여 `터미널`을 실행합니다. `터미널` 창에서 아래의 명령을 차례로 실행하여 KTUG 사설저장소에서 제공하는 `arara-rules-ko` 패키지를 설치하고 `/usr/local/texlive/2025/texmf-dist/scripts/arara/rules/arara-rule-komkindex.yaml` 파일을 확인합니다.

```zsh
sudo tlmgr install arara-rules-ko
1s -l /usr/local/texlive/2025/texmf-dist/scripts/arara/rules/arara-rule-komkindex.yaml
```

<img src="{{ '/assets/images/macos-mactex/inst-arara-rules.png' | relative_url }}" alt="arara-rules-ko 패키지 설치">

이제 다음과 같은 arara directive를 쓸 수 있습니다.

```latex
% arara: komkindex: { koreanfirst: yes, style: kotex}
```

## 마무리

이제 MacTeX 설치 및 설정이 완료되었습니다. LaTeX 문서 작성을 시작할 준비가 되었습니다!
