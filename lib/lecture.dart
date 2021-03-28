import 'package:flutter/material.dart';

class ImageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
      ),
      body: ListView(
        children: [
          _ImageListItem(
            imageURL: 'https://img-cdn.guide.travel.co.jp/matome/3733/98F1B7981A2A4798B192679C75D73149_LL.jpg', 
            title: 'エントランス', 
            description: '写真を撮るところ'
          ),
          _ImageListItem(
            imageURL: 'https://www.lmaga.jp/wp-content/uploads/2016/03/yakeihoteluniversal.jpg', 
            title: 'ザ パークフロント', 
            description: '一歩足を踏み入れれば、そこはアメリカ。ニューヨーク、ロサンゼルス、ハワイ... とパーク本場アメリカのエンターテイメントに満ちた空間が広がります。'
          ),
          _ImageListItem(
            imageURL: 'https://next.jorudan.co.jp/trv/images/640/18436.jpg', 
            title: 'パーク全体', 
            description: '上から見たやつ'
          ),
          _ImageListItem(
            imageURL: 'https://topics-cdn.nintendo.co.jp/image/2020/11/26114731724217/800/16905_ban.jpg', 
            title: 'ニンテンドーランド', 
            description: '誰かと真剣に競い合ったり、仲間と協力したり、夢中になって遊ぶ時、人は誰だって最高にいい顔。そう、みんな、遊ぶために生まれてきたんだ！'
          ),
          _ImageListItem(
            imageURL: 'https://c02.castel.jp/cover?url=https%3A%2F%2Fcastel.jp%2Fimg%2Fup%2Fpicture_35152.jpg&w=681', 
            title: 'ジュラシックワールド', 
            description: '太古の恐竜に出会う探検が想定外のトラブルに。荒れ狂うT-レックスに絶体絶命、逃れるために25.9ｍ下へとまっ逆さま！'
          ),
          _ImageListItem(
            imageURL: 'https://resemom.jp/imgs/p/85E-uQits26mttRV9UEgGNNFxkioS0pNTE9O/200005.jpg', 
            title: 'ユニバーサル・スペクタクル・ナイトパレード ～ベスト・オブ・ハリウッド～', 
            description: 'フロート×マッピングによる驚愕の臨場感が、パレードの常識を変える！'
          ),
        ],
      ),
    );
  }
}

class _ImageListItem extends StatelessWidget {
  final String imageURL;
  final String title;
  final String description;

  _ImageListItem({
    required this.imageURL,
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _ImageListViewerScreen(imageURL: imageURL),
            fullscreenDialog: true,
          )
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // NOTE: Image
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration( 
                image: DecorationImage(
                  image: NetworkImage(imageURL),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8)
              ),
            ),
            // NOTE: Spacer
            SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // NOTE: Title
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  // NOTE: Spacer
                  SizedBox(height: 4,),
                  // NOTE: Description
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageListViewerScreen extends StatelessWidget {
  final String imageURL;

  _ImageListViewerScreen({
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // NOTE: Viewer
          InteractiveViewer(
            child: Center(
              child: Image.network(imageURL),
            ),
          ),
          // NOTE: Close Button
          Positioned(
            left: 20,
            top: 32,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ), 
              onPressed: () {
                Navigator.of(context).pop();
              }
            ),
          ),
        ]
      ),
    );
  }
}