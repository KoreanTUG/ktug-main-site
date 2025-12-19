# 튜토리얼 문서 별도 저장소 관리 가이드

튜토리얼 문서를 별도의 GitHub 저장소에서 관리하고 메인 사이트에 연결하는 방법을 안내합니다.

## 방법 1: Git Submodule 사용 (권장)

Git Submodule을 사용하면 별도 저장소의 내용을 메인 저장소에 포함시킬 수 있습니다.

### 1단계: 튜토리얼 전용 저장소 생성

1. GitHub에서 새 저장소 생성 (예: `KoreanTUG/ktug-tutorials`)
2. 현재 `_tutorials` 디렉토리의 내용을 새 저장소에 push

```bash
# 새 저장소 클론
git clone https://github.com/KoreanTUG/ktug-tutorials.git
cd ktug-tutorials

# 현재 튜토리얼 파일 복사
cp -r /Users/leekh/Projects/ktug-main-site/_tutorials/* .

# 커밋 및 push
git add .
git commit -m "Initial commit: Tutorial documents"
git push origin main
```

### 2단계: 메인 저장소에 Submodule 추가

```bash
cd /Users/leekh/Projects/ktug-main-site

# 기존 _tutorials 디렉토리 백업 (선택사항)
mv _tutorials _tutorials_backup

# Submodule 추가
git submodule add https://github.com/KoreanTUG/ktug-tutorials.git _tutorials

# 커밋
git add .gitmodules _tutorials
git commit -m "Add tutorials as submodule"
git push origin main
```

### 3단계: Submodule 업데이트

별도 저장소가 업데이트되면 메인 저장소에서 업데이트:

```bash
# Submodule 업데이트
git submodule update --remote _tutorials

# 변경사항 커밋
git add _tutorials
git commit -m "Update tutorials submodule"
git push origin main
```

### 장점
- ✅ 간단하고 표준적인 방법
- ✅ 버전 관리가 명확함
- ✅ GitHub Pages에서 자동으로 작동

### 단점
- ❌ GitHub Pages 빌드 시 Submodule이 자동으로 업데이트되지 않음
- ❌ 수동으로 업데이트해야 함

---

## 방법 2: GitHub Actions로 자동 동기화 (고급)

GitHub Actions를 사용하여 별도 저장소가 업데이트될 때마다 자동으로 메인 저장소를 업데이트합니다.

### 1단계: 튜토리얼 저장소에 Webhook 설정

튜토리얼 저장소(`ktug-tutorials`)에서:
1. **Settings** > **Webhooks** > **Add webhook**
2. Payload URL: `https://api.github.com/repos/KoreanTUG/ktug-main-site/dispatches`
3. Content type: `application/json`
4. Secret: GitHub Personal Access Token (repo 권한 필요)
5. Events: "Just the push event"
6. Active: 체크

### 2단계: 메인 저장소에 GitHub Actions 워크플로우 생성

`.github/workflows/sync-tutorials.yml` 파일 생성:

```yaml
name: Sync Tutorials

on:
  repository_dispatch:
    types: [tutorials-updated]
  workflow_dispatch:  # 수동 실행 가능
  schedule:
    - cron: '0 0 * * *'  # 매일 자정에 체크

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout main repo
        uses: actions/checkout@v3
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          submodules: true

      - name: Update submodule
        run: |
          git submodule update --remote _tutorials
          git config user.name "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          
      - name: Commit and push if changed
        run: |
          if [ -n "$(git status --porcelain _tutorials)" ]; then
            git add _tutorials
            git commit -m "Auto-update tutorials from external repo"
            git push
          fi
```

### 3단계: 튜토리얼 저장소에 Actions 추가

튜토리얼 저장소에 `.github/workflows/notify-main-repo.yml` 생성:

```yaml
name: Notify Main Repo

on:
  push:
    branches:
      - main

jobs:
  notify:
    runs-on: ubuntu-latest
    steps:
      - name: Trigger main repo update
        uses: peter-evans/repository-dispatch@v2
        with:
          token: ${{ secrets.MAIN_REPO_TOKEN }}
          repository: KoreanTUG/ktug-main-site
          event-type: tutorials-updated
```

### 장점
- ✅ 자동 동기화
- ✅ 실시간 업데이트
- ✅ 수동 작업 최소화

### 단점
- ❌ 설정이 복잡함
- ❌ GitHub Token 관리 필요

---

## 방법 3: GitHub Actions로 직접 복사 (간단한 자동화)

별도 저장소의 내용을 빌드 시점에 직접 가져오는 방법입니다.

### 1단계: GitHub Actions 워크플로우 생성

`.github/workflows/build.yml` 파일 생성 또는 수정:

```yaml
name: Build and Deploy

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout main repo
        uses: actions/checkout@v3

      - name: Checkout tutorials repo
        uses: actions/checkout@v3
        with:
          repository: KoreanTUG/ktug-tutorials
          path: tutorials-temp

      - name: Copy tutorials
        run: |
          rm -rf _tutorials
          cp -r tutorials-temp/* _tutorials

      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.1'
          bundler-cache: true

      - name: Build site
        run: bundle exec jekyll build

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./_site
```

### 장점
- ✅ 별도 저장소와 독립적으로 관리
- ✅ 빌드 시점에 최신 내용 가져옴
- ✅ Submodule 관리 불필요

### 단점
- ❌ GitHub Actions 사용 필요
- ❌ 빌드 시간이 약간 증가

---

## 추천 방법

**현재 상황에 가장 적합한 방법**: **방법 1 (Git Submodule) + 수동 업데이트**

이유:
- 설정이 간단함
- GitHub Pages에서 바로 작동
- 튜토리얼 업데이트가 자주 발생하지 않는다면 수동 업데이트로 충분

**자동화가 필요하다면**: **방법 3 (GitHub Actions로 직접 복사)**

이유:
- 설정이 상대적으로 간단함
- 자동 동기화 가능
- Submodule 관리 불필요

---

## 마이그레이션 체크리스트

1. [ ] 튜토리얼 전용 저장소 생성
2. [ ] 현재 `_tutorials` 내용을 새 저장소로 이동
3. [ ] 메인 저장소에서 Submodule 추가 또는 GitHub Actions 설정
4. [ ] 테스트: 새 저장소에서 파일 수정 후 메인 사이트 반영 확인
5. [ ] 문서화: 팀원들에게 업데이트 프로세스 공유

---

## 주의사항

1. **경로 일관성**: 별도 저장소의 파일 구조가 `_tutorials`와 동일해야 함
2. **Front Matter**: 모든 마크다운 파일의 front matter가 올바른지 확인
3. **이미지 경로**: 이미지가 `assets` 디렉토리에 있다면 경로 확인 필요
4. **링크**: 상대 경로 링크가 올바르게 작동하는지 확인

---

## 질문 및 문제 해결

문제가 발생하면:
1. GitHub Actions 로그 확인
2. 로컬에서 `jekyll build` 실행하여 에러 확인
3. Submodule 상태 확인: `git submodule status`

