/*
 * 메인 화면 '최근 게시물': Discourse 게시판(KTUG 마당)의 최근 글을 불러와 보여 준다.
 * 마크업은 index.html의 .recent-posts 영역. Discourse 주소와 게시판은 _config.yml의 discourse 항목.
 *
 * 사용하는 Discourse JSON
 *   /categories.json                게시판 안내 글("About the ... category")의 번호를 topic_url에서 얻어 목록에서 뺀다
 *   /c/<slug>/<id>/l/latest.json    게시판의 최근 글
 */
(function () {
    'use strict';

    var section = document.querySelector('.recent-posts');
    if (!section || !window.fetch) return;

    var base = section.getAttribute('data-discourse-url');
    var limit = parseInt(section.getAttribute('data-topics'), 10) || 10;
    var dateFormat = new Intl.DateTimeFormat('ko-KR', { year: 'numeric', month: 'long', day: 'numeric' });

    function getJSON(path) {
        return fetch(base + path, { credentials: 'omit', headers: { Accept: 'application/json' } })
            .then(function (res) {
                if (!res.ok) throw new Error(path + ' ' + res.status);
                return res.json();
            });
    }

    function setStatus(list, text) {
        list.textContent = '';
        var li = document.createElement('li');
        li.className = 'recent-posts-status';
        li.textContent = text;
        list.appendChild(li);
    }

    function renderTopics(list, topics) {
        if (topics.length === 0) {
            setStatus(list, '아직 글이 없습니다.');
            return;
        }
        list.textContent = '';
        topics.forEach(function (topic) {
            var li = document.createElement('li');
            li.className = 'recent-post';

            var link = document.createElement('a');
            link.className = 'recent-post-title';
            link.href = base + '/t/' + topic.slug + '/' + topic.id;
            link.textContent = topic.title; // textContent: 제목의 HTML을 해석하지 않는다
            li.appendChild(link);

            var meta = document.createElement('span');
            meta.className = 'recent-post-meta';
            var when = new Date(topic.last_posted_at || topic.created_at);
            var replies = Math.max((topic.posts_count || 1) - 1, 0);
            meta.textContent = dateFormat.format(when) + (replies > 0 ? ' · 댓글 ' + replies : '');
            li.appendChild(meta);

            list.appendChild(li);
        });
    }

    // 게시판 안내 글("About the ... category")의 topic id를 모은다. 실패해도 목록은 보여 준다
    var aboutTopicIds = getJSON('/categories.json')
        .then(function (data) {
            var categories = (data.category_list && data.category_list.categories) || [];
            return categories.map(function (c) {
                // topic_url 예: /t/about-the-ktug-category/7 → 7
                var m = /\/(\d+)$/.exec(c.topic_url || '');
                return m ? parseInt(m[1], 10) : null;
            });
        })
        .catch(function () { return []; });

    var board = section.querySelector('.recent-posts-board');
    if (!board) return;
    var list = board.querySelector('.recent-posts-list');
    var slug = board.getAttribute('data-category-slug');
    var id = board.getAttribute('data-category-id');

    Promise.all([aboutTopicIds, getJSON('/c/' + slug + '/' + id + '/l/latest.json')])
        .then(function (results) {
            var skip = results[0];
            var topics = (results[1].topic_list && results[1].topic_list.topics) || [];
            topics = topics.filter(function (t) { return skip.indexOf(t.id) === -1; });
            renderTopics(list, topics.slice(0, limit));
        })
        .catch(function () {
            setStatus(list, '게시물을 불러오지 못했습니다.');
        });
})();
