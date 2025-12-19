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

먼저 <a href="{{ '/getting-started/macos-mactex/ktug-repo/' | relative_url }}">KTUG 사설저장소 패키지</a>에서 설명한 바와 같이 `TLShell TeX Live Manager`를 **관리자 권한으로 실행**합니다. 이어서 "패키지 목록(PACKAGE LIST)"의 "상태(Status)"에서 "Not installed"를 선택하여 패키지 목록을 갱신합니다. 그런 후에 아래 화면과 같이 "탐색(Search)" 칸에 `arara`를 입력하여 `arara-rules-ko` 패키지를 찾습니다.

<img src="{{ '/assets/images/macos-mactex/tlshell-srch-arara.png' | relative_url }}" alt="TLShell arara 탐색">

이제 이 패키지를 선택(mark)하고 **Install marked**를 눌러 설치를 진행합니다.

<img src="{{ '/assets/images/macos-mactex/tlshell-inst-arara.png' | relative_url }}" alt="TLShell arara 설치">

설치가 완료되면 **Close**와 **Quit**을 차례로 눌러 `TLShell TeX Live Manager`를 종료합니다. 패키지가 설치되면 `arara-rule-komkindex.yaml` 파일이 `C:\texlive\2025\texmf-dist\scripts\arara\rules\` 폴더에 저장된 것을 다음과 같이 확인할 수 있습니다.

<img src="{{ '/assets/images/macos-mactex/expl-arara-rule.png' | relative_url }}" alt="arara 룰 파일">

이제 다음과 같은 arara directive를 쓸 수 있습니다.

```latex
% arara: komkindex: { koreanfirst: yes, style: kotex}
```

## 마무리

이제 TeX Live 설치 및 설정이 완료되었습니다. LaTeX 문서 작성을 시작할 준비가 되었습니다!
