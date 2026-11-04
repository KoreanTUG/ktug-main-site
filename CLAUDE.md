# CLAUDE.md

한글텍사용자모임(KTUG) 공식 웹사이트. Jekyll 정적 사이트이며 GitHub Pages로 배포한다.
앞으로 이 사이트의 디자인, 콘텐츠 작성, 관리는 Claude Code로 한다. 기존 코드는 Claude Code가 작성한 것이 아니므로 관례가 일정하지 않은 곳이 있다. 아래 규칙이 기존 코드보다 우선한다.

## 배포

- 저장소: https://github.com/KoreanTUG/ktug-main-site
- 현재 주소: https://koreantug.github.io/ktug-main-site/ (`baseurl: "/ktug-main-site"`)
- GitHub Pages **legacy 빌드**를 쓴다. `main` 브랜치의 `/`를 빌드하며 Actions 워크플로는 없다. GitHub 쪽 빌드 환경은 `github-pages` gem(Jekyll 3.x)이다.
- **main에 push하면 즉시 공개된다.** 작업은 main에 직접 커밋하되, push는 사용자가 지시할 때만 한다.
- 앞으로 **www.ktug.org로 이전할 예정**이다. 이전하면 `CNAME`을 추가하고 `url`/`baseurl`을 바꾼다. 그래서 내부 경로는 절대로 하드코딩하지 않는다(아래 링크 규칙 참고).

## 로컬 개발

- Gemfile은 Jekyll 3.9를 쓴다(github-pages gem은 버전 충돌 때문에 주석 처리했다). Ruby 3.4+를 위해 base64, logger, bigdecimal을 추가해 두었다.
- Ruby는 Homebrew(Linuxbrew)의 `ruby@3.3`을 쓴다. keg-only라서 PATH에 직접 넣어야 한다:
  `export PATH="/home/linuxbrew/.linuxbrew/opt/ruby@3.3/bin:$PATH"`
  최신 `ruby`(4.x)는 Jekyll 3.9와 맞지 않을 수 있어 쓰지 않는다.
- gem은 `vendor/bundle`에 설치한다(`bundle config set --local path vendor/bundle`, git에서 제외됨).
- 미리보기: `bundle exec jekyll serve` → http://localhost:4000/ktug-main-site/
- 빌드 검증: `bundle exec jekyll build`. 커밋 전에 경고나 오류가 없는지 확인한다.
- 사용 플러그인: jekyll-feed, jekyll-sitemap, jekyll-seo-tag. GitHub Pages가 허용하는 플러그인만 쓸 수 있다.

## 구조

```
_config.yml          사이트 설정, 컬렉션, 기본 레이아웃
_data/navigation.yml 상단 메뉴와 하위 메뉴, 푸터 바로가기(헤더와 푸터가 함께 쓴다)
_layouts/            default(HTML 골격, MathJax 3) / page / tutorial(빵부스러기, PDF 저장 버튼, 이전·다음 이동)
_includes/           header.html(메뉴 JS 포함) / footer.html
_sass/               _variables(색, 글꼴, 간격, breakpoint) 외 base, layout, components, code, tutorials, faq
assets/css/main.scss 위 SCSS를 모으는 진입점
assets/documents/    배포용 PDF(번역 문서, 안내서)
assets/downloads/    배포용 압축 파일
assets/images/<튜토리얼>/  튜토리얼 스크린샷
_pages/              pages 컬렉션: about/, readings/, community/ (레이아웃 page)
_getting_started/    getting_started 컬렉션 (레이아웃 tutorial)
index.html, 404.html 홈과 404 페이지
closet/              빌드와 git에서 제외되는 개인 보관 폴더. 수정하지 않는다
```

### 시작하기 튜토리얼

- `01-before-you-start/`, `02-windows-miktex/`, `03-windows-texlive/`, `04-macos-mactex/`
- 02~04는 같은 장 구성을 따른다: 00-overview, 01-prep, 02-install, 03-texworks(macOS는 03-texshop), 04-first-doc, 05-fonts, 06-ktug-repo, 07-vscode, 08-lshort, 09-utils, 10-ktug-repo-adv
- **세 튜토리얼 가운데 하나를 고치면 나머지 둘에도 같은 수정이 필요한지 반드시 확인한다.**
- front matter에 `permalink`(예: `/getting-started/macos-mactex/install/`)와 `prev_tutorial`/`next_tutorial`을 명시한다. 장을 추가하거나 빼면 앞뒤 장의 링크와 00-overview의 목차, `_data/navigation.yml`을 함께 고친다.

## 작성 규칙

### 링크와 경로

- 내부 링크와 이미지는 언제나 `relative_url` 필터를 쓴다. `baseurl`이 바뀌어도 링크가 깨지지 않게 하기 위해서다.
  - 링크: `<a href="{{ '/getting-started/macos-mactex/install/' | relative_url }}">MacTeX 설치</a>`
  - 이미지: `<img src="{{ '/assets/images/macos-mactex/xxx.png' | relative_url }}" alt="설명">`
- `/ktug-main-site/...`처럼 baseurl을 직접 쓰지 않는다. 마크다운 `[]()`로 내부 경로를 적지도 않는다.
- 외부 링크는 마크다운 `[텍스트](https://...)`로 쓴다. 가능하면 https를 쓴다.
- 이미지에는 반드시 `alt`를 넣는다.

### 문체와 표기

- 본문은 한국어 **합니다체**로 쓴다.
- 'TeX'은 '텍'으로 읽으므로 **받침 있는 조사**를 붙인다: TeX**을**, TeX**으로**, LaTeX**은**, MacTeX**으로**, TeX Live**를**(라이브), MiKTeX**을**(믹텍).
- 기존 문서에는 'TeX를', 'MacTeX를' 같은 표기가 섞여 있다. 해당 문서를 고칠 때 함께 바로잡는다.
- 참고 상자는 `> **참고** ...` 형식으로 쓴다.
- 코드 블록에는 언어를 지정한다(`zsh`, `powershell`, `latex` 등).
- `_config.yml`에서 `parse_block_html`을 켜 두었으므로 HTML 블록 안에서도 마크다운이 해석된다.
- 수식은 MathJax로 렌더링한다. `$...$`가 인라인 수식으로 해석되므로 본문에 달러 기호를 쓸 때 주의한다.

### 콘텐츠 작성 분담

- 본문 초안은 Claude가 쓰고 사용자가 검토한다.
- 기술 내용(설치 절차, 명령어, 패키지 이름, 다운로드 경로)은 추측으로 쓰지 않는다. 공식 문서(CTAN, TUG, MiKTeX, MacTeX 등)로 확인하고, 확인하지 못한 부분은 사용자에게 표시해 둔다.
- 사실 관계(KTUG/KTS 역사, 인명, 연도)는 사용자에게 확인을 받는다.

## 디자인

- 디자인 방향은 아직 정하지 않았다. 큰 디자인 변경은 방향을 사용자와 먼저 합의한 다음 시작한다.
- 색, 글꼴, 간격, breakpoint는 `_sass/_variables.scss`의 변수를 쓴다. 값을 하드코딩하지 않는다.
- 모바일 메뉴는 768px(`$breakpoint-md`)을 기준으로 전환되고, `_includes/header.html`의 JS가 동작을 맡는다.
- 레이아웃이나 스타일을 바꾸면 데스크톱과 모바일 너비에서 모두 확인한다. 튜토리얼 페이지는 'PDF로 저장' 인쇄 결과도 확인한다.

## 커밋

- 커밋 메시지는 한국어로 짧게 쓴다(예: `MacTeX 설치 문서 표기 수정`).
- 작업 단위별로 커밋한다.

## 알려진 문제

- 커뮤니티 메뉴(`_data/navigation.yml`, `_pages/community/00-overview.md`, `index.html`)의 KTUG 마당, Q&A 마당, FAQ 마당이 모두 `http://discourse.ktug.org` 한 주소를 가리킨다. 2026-11-04 확인 시점에 이 주소는 http, https 모두 응답이 없었다.
- `README.md`에 내용이 거의 없다.
