module ApplicationHelper
  def default_meta_tags
    {
      site: 'トモイ珈琲',
      title: 'トモイ珈琲 online shop',
      reverse: true,
      separator: '|',
      description: '自家農園から採れた厳選した珈琲豆を使用。コクと深みのある味を実現する為製法にこだわっています。',
      keywords: '珈琲',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('751280.jpg') },
        { href: image_url('251280.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'トモイ珈琲',
        title: 'トモイ珈琲 online shop',
        description: '自家農園から採れた厳選した珈琲豆を使用。コクと深みのある味を実現する為製法にこだわっています。', 
        type: 'website',
        url: request.original_url,
        image: image_url('1219729.jpg'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@Fumi_Kazu5',
      }
      fb: {
        app_id: 'fumikazu.kodaira.5'
      }
    }
  end
end
