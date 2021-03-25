module ApplicationHelper
  def default_meta_tags
    {
      site: 'サイト名',
      title: 'タイトル',
      reverse: true,
      separator: '|',
      description: 'ディスクリプション',
      keywords: 'キーワード',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'サイト名',
        title: 'タイトル',
        description: 'ディスクリプション', 
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@ツイッターのアカウント名',
      }
      fb: {
        app_id: '自身のfacebookのapplication ID'
      }
    }
  end
end
