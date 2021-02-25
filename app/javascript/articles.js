$(function(){
  let $window = $(window),
      $load = $('#load_animation'),
      $load_in = $load.find('img');

  //ロゴとLoadingGIFをフェードイン
  $load_in.delay(500).fadeIn('slow');

  //ウィンドウに対してloadイベントを設定
  //全ての要素をロードが終わったら，HideLoadingScreen()を実行する
  $window.on('load',function(){
      HideLoadingScreen();
  })
  
  //1秒後に強制的にHideLoadingScreen()を実行
  setTimeout(function(){
      HideLoadingScreen();
  },1000);

  //ロード画面を非表示にする関数
  function HideLoadingScreen(){
      $load.delay(1500).fadeOut("slow");
  }
}); 


$(function(){
  $(".fade-img img:not(:first-child)").hide();
  setInterval(function() {
    $(".fade-img img:first-child").fadeOut("slow").next("img").fadeIn("slow").end().appendTo(".fade-img");
  },8000);
});

