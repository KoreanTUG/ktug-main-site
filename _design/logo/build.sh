#!/usr/bin/env bash
# 로고 변형을 PDF와 SVG로 만든다. 결과는 out/에 모인다.
# 필요 도구: TeX Live(lualatex), Poppler(pdftocairo)
set -euo pipefail
cd "$(dirname "$0")"
[ -f lion.pdf ] || ./trace-lion.sh
mkdir -p out
for v in full wordmark lion; do
  lualatex -interaction=nonstopmode -halt-on-error -jobname="ktug-logo-$v" \
    "\def\variant{$v}\input{ktug-logo}" >/dev/null
  # pdftocairo는 글꼴을 경로로 바꾸므로 SVG 하나로 완결된다
  # (dvisvgm --pdf는 Ghostscript 10.01 이상을 지원하지 않아 쓰지 않는다)
  pdftocairo -svg "ktug-logo-$v.pdf" "out/ktug-logo-$v.svg"
  mv "ktug-logo-$v.pdf" out/
  rm -f "ktug-logo-$v".{aux,log}
done
ls -la out

# 웹용 이미지: 전체 로고를 높이별 PNG/WebP로 뽑아 사이트 자산 폴더에 둔다
# 60·120px은 헤더의 1배·2배용, 480px은 큰 자리(소개 페이지 등)용이다
WEB=../../assets/images/logo
mkdir -p "$WEB"
for h in 60 120 480; do
  pdftocairo -png -singlefile -scale-to-y "$h" -scale-to-x -1 \
    out/ktug-logo-full.pdf "$WEB/ktug-logo-$h"
  magick "$WEB/ktug-logo-$h.png" -strip -quality 90 "$WEB/ktug-logo-$h.webp"
  magick "$WEB/ktug-logo-$h.png" -strip -define png:compression-level=9 "$WEB/ktug-logo-$h.png"
done
ls -la "$WEB"
