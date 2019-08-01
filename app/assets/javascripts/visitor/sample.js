$(function() {
	
	// 都道府県名が変更されたら発動
	$('select[name="prefecture"]').change(function() {
		
		// 選択されている都道府県名のクラス名を取得
		var prefectureName = $('select[name="prefecture"] option:selected').attr("class");
		console.log(prefectureName);
		
		// 市区町村名の要素数を取得
		var count = $('select[name="city"]').children().length;
		
		// 市区町村名の要素数分、for文で回す
		for (var i=0; i<count; i++) {
			
			var city = $('select[name="city"] option:eq(' + i + ')');
			
			if(city.attr("class") === prefectureName) {
				// 選択した都道府県名と同じクラス名だった場合
				
				city.show();
			}else {
				// 選択した都道府県名とクラス名が違った場合
				
				if(city.attr("class") === "msg") {
					// 「市区町村名を選択して下さい」という要素だった場合
					
						city.show();  //「市区町村名を選択して下さい」を表示させる
						city.prop('selected',true);  //「市区町村名を選択して下さい」を強制的に選択されている状態にする
				} else {
					// 「市区町村名を選択して下さい」という要素でなかった場合
					
					city.hide();
				}
			}
		}
	})
})