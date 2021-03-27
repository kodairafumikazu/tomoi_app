module ApplicationHelper
  def default_meta_tags
    {
      site: 'トモイ珈琲 online shop',
      title: 'トップページ',
      reverse: true,
      charset: 'utf-8',
      separator: '|',
      description: '自家農園から採れた厳選した珈琲豆を使用。コクと深みのある味を実現する為製法にこだわっています。',
      keywords: 'Rails,Ruby,プログラミング,珈琲',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: asset_pack_url('images/favicon.ico') },
        { href: asset_pack_url('images/meta_tags.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description, 
        type: 'website',
        url: request.original_url,
        image: asset_pack_url('images/405990_s.jpg'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@Fumi_Kazu5',
        image: asset_pack_url('images/twitter_icon.png'),
        width: 100,
        height: 100
      },
      fb: {
        app_id: '435683437534143'
      }
    }
  end
end
