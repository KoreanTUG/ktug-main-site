#!/usr/bin/env python3
"""빌드된 _site/의 내부 링크를 검사한다.

- baseurl 없이 '/'로 시작하는 링크(배포하면 사이트 밖으로 나가 404가 된다)
- baseurl로 시작하지만 가리키는 파일이 없는 링크

사용법: bundle exec jekyll build && python3 scripts/check-links.py
문제가 있으면 목록을 출력하고 종료 코드 1을 돌려준다.

baseurl이 비어 있으면(도메인 루트 배포) relative_url을 빠뜨린 링크를 찾을 수 없다. 그럴 때는 가짜 baseurl로
따로 빌드해 검사한다:
  bundle exec jekyll build --baseurl /_check -d <폴더>
  CHECK_BASEURL=/_check python3 scripts/check-links.py <폴더>
"""
import os
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SITE = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else ROOT / "_site"
config = (ROOT / "_config.yml").read_text(encoding="utf-8")
m = re.search(r'^baseurl:\s*"?([^"\s#]*)"?', config, re.M)
BASEURL = os.environ.get("CHECK_BASEURL", m.group(1) if m else "").rstrip("/")

# HTML 주석 안의 링크는 검사하지 않는다
COMMENT = re.compile(r"<!--.*?-->", re.S)
LINK = re.compile(r'(?:href|src)="(/[^"#?]*)')

problems = []
for page in sorted(SITE.rglob("*.html")):
    html = COMMENT.sub("", page.read_text(encoding="utf-8"))
    rel = page.relative_to(SITE)
    for url in LINK.findall(html):
        if url.startswith("//"):
            continue  # 프로토콜 상대 외부 링크
        if BASEURL and not (url == BASEURL or url.startswith(BASEURL + "/")):
            problems.append(f"{rel}: baseurl 없음 {url}")
            continue
        target = SITE / url[len(BASEURL):].lstrip("/")
        if not (target.is_file() or (target / "index.html").is_file()):
            problems.append(f"{rel}: 대상 없음 {url}")

for p in problems:
    print(p)
print(f"검사 완료: 문제 {len(problems)}건")
sys.exit(1 if problems else 0)
