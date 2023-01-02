module ApplicationHelper
  # 各ページのタイトル設定(検索エンジン用)
  def full_title(page_title = '')
    base_title = "StudySupport"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # 各ページの説明文 120文字前後(検索エンジン用)
  def full_description(page_description = '')
    base_description = "StudySupportは、学習に特化したタスク管理アプリです。忘却曲線に基いた学習スケジュールを自動的に作成し、あなたの学習をサポートします。"
    if page_description.empty?
      base_description
    else
      page_description
    end
  end

  # 各ページの説明文(SNS用)
  def og_description(page_description = '')
    base_description = "StudySupportは、学習に特化したタスク管理アプリです。"
    if page_description.empty?
      base_description
    else
      page_description
    end
  end

  # 各ページのイメージ画像(SNS用)
  def og_image(page_image = '')
    base_image = "https://picsum.photos/id/20/1200/630/?blur=1"
    if page_image.empty?
      base_image
    else
      page_image
    end
  end
end
