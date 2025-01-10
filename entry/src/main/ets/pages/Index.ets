import { TabBarCommen } from '../module/Tabs';
import { ContactPage } from './ContactPage';
import { WeChat } from './WeChat';

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  @State tabList: TabBarCommen[] = [
    {
      icon: $r('app.media.ic_public_message'),
      name: "wechat",
      selectIcon: $r('app.media.ic_public_message_filled'),
      title: '微信'
    },
    {
      icon: $r('app.media.ic_public_contacts_group'),
      name: "联系人",
      selectIcon: $r("app.media.ic_public_contacts_group_filled"),
      title: "联系人"
    }, {
    icon: $r('app.media.ic_gallery_discover'),
    name: "发现",
    selectIcon: $r('app.media.ic_gallery_discover_filled'),
    title: "发现"
  }, {
    icon: $r('app.media.ic_public_contacts'),
    name: "我的",
    selectIcon: $r("app.media.ic_public_contacts_filled"),
    title: "发现"
  }
  ]

  @Builder
  CommenBar(tabBarCommen: TabBarCommen) {
    Column() {
      Image((tabBarCommen.name == this.tabList[this.currentIndex].name) ? tabBarCommen.selectIcon : tabBarCommen.icon)
        .width(20)
        .height(20)
      Text(tabBarCommen.title)
        .fontColor((tabBarCommen.name == this.tabList[this.currentIndex].name) ? $r("app.color.primary") :
        $r("app.color.text_primary"))
        .fontSize(12)
        .margin({ top: 5 })
    }
  }

  build() {
    Tabs({ index: $$this.currentIndex }) {
      ForEach(this.tabList, (item: TabBarCommen) => {
        TabContent() {
          if (item.name == "wechat") {
            ContactPage()
          } else  if (item.name == "联系人") {
            WeChat()
          } else {
            Text('首页的内容').fontSize(30)
          }
        }.tabBar(this.CommenBar(item))
      })
    }.animationDuration(300).barPosition(BarPosition.End)

    // .onChange((index)=>{
    //   this.currentIndex = index;
    // })
  }
}