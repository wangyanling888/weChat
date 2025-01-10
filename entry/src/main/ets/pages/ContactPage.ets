import { DefaultUserList, UserInfo } from '../module/users';

@Entry
@Component
export struct ContactPage {
  @State message: string = 'Contact';
  @State searchValue: string = ''
  @State listUser: UserInfo[] = DefaultUserList

  build() {
    Column() {
      Row() {
        Search({ placeholder: "搜索", value: $$this.searchValue })
      }.width('100%').padding({ left: 10, right: 10 }).margin({ left: 10, right: 10 })


      List() {
        ForEach(this.listUser, (item: UserInfo) => {
          ListItem() {
            Row({ space: 10 }) {
              Image(item.avatar).borderRadius(20).width(30)
                .height(30)
              Column() {
                Text(item.username).fontSize(12)
              }.layoutWeight(1).alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Center)

            }.padding({ left: 10, right: 10 }).justifyContent(FlexAlign.Center)
          }.height(60).stateStyles({
            normal: {
              .backgroundColor($r("app.color.white"))
            },
            pressed: {
              .backgroundColor($r("app.color.back_color"))
            }
          })
        })
      }
      .margin({ left: 10, right: 10 })
      .divider({ strokeWidth: 1, color: $r("app.color.border_color") })
      .width('100%')
      .height("100%")
      .padding({ top: 10, bottom: 10 })
      .backgroundColor($r('app.color.white'))
      .listDirection(Axis.Vertical)
    }
    .height('100%')
    .width('100%')
  }
}