#!/usr/bin/env bash
# 사자 그림(ktug-lion-new.png)에서 사자 부분만 남겨 벡터로 바꾼다.
# ktug-lion-new.png: 예전 로고의 사자(홍석호 그림)를 바탕으로 ChatGPT로 여러 번 조정해 새로 그린 그림
# 출력: lion.pdf(TikZ에 넣는 용도), lion.svg
# 필요 도구: ImageMagick(magick), potrace
#
# 참고: 예전 로고(ktug-lion-old.png, 홍석호 그림)도 같은 방식으로
# 벡터화해 봤지만, 원본이 흐려 결과가 좋지 않았다. 그래서 새로 그린 그림을 쓴다.
set -euo pipefail
cd "$(dirname "$0")"
SRC=ktug-lion-new.png
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

# 1) 그림 왼쪽의 글자(Korean TeX Users Group)를 흰색으로 지운다.
#    깃펜, 사각모 술, 펼친 책 모서리를 건드리지 않게 줄마다 영역을 따로 잡았다.
# 2) 회색조 → 3배 확대 → 살짝 흐리게(가장자리 계단 줄이기) → 흑백(문턱값 50%)
# 3) 둘레의 빈 여백을 잘라 낸다.
magick "$SRC" -fill white -stroke none \
    -draw "rectangle 0,0 452,232" -draw "rectangle 0,232 300,420" \
    -draw "rectangle 0,420 386,600" -draw "rectangle 0,600 422,785" \
    -colorspace gray -filter Lanczos -resize 300% -blur 0x0.8 -threshold 50% \
    -trim +repage "$TMP/lion.pbm"

# -t 10: 작은 얼룩 제거, -a 1.0: 모서리 매끄럽게, -O 0.3: 곡선 단순화
POTRACE_OPTS=(-t 10 -a 1.0 -O 0.3)
potrace "$TMP/lion.pbm" "${POTRACE_OPTS[@]}" -b pdf -o lion.pdf
potrace "$TMP/lion.pbm" "${POTRACE_OPTS[@]}" -s -o lion.svg
echo "lion.pdf, lion.svg 생성"
